#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug  8 20:20:55 2019

@author: philipp

Main File to wrap up all functions 

:TO-DO: 

"""
import os 
import json
import configparser
import subprocess
import numpy as np
import osgeo.gdal as gdal
import matplotlib.pyplot as plt
import pandas as pd 
import psycopg2
from bs4 import BeautifulSoup, SoupStrainer
from googletrans import Translator
from tqdm import tqdm
import cv2
import ray 
import glob

config = configparser.ConfigParser()
config.sections()
config.read('config.json')

def list_parameters(param_set, table): 
    with psycopg2.connect(dbname=config['DATABASE']['PSQL_DBName'],
                          user=config['DATABASE']['PSQL_User'], 
                          password = config['DATABASE']['PSQL_Password'],
                          host=config['DATABASE']['PSQL_Service']) as conn: 
        with conn.cursor() as cur: 
            count_cmd = """SELECT {}, count({}) 
                            FROM {}
                            GROUP by {}
                            order by count({}) desc;""".format(param_set, param_set, table, param_set, param_set)
            cur.execute(count_cmd)
            desc_table = cur.fetchall()
            colnames = [desc[0] for desc in cur.description]
            df = pd.DataFrame(desc_table, columns = colnames)
    #print(df)
    return df 

def create_rasterize(img_path, corner_locations, resolution, show_image): 
    minx, miny, maxx, maxy = corner_locations
    resolutiox, resolutiony = resolution
    """
    Creates rasterize image 
    
    :TO-DO: 
        - direct gdal transform
    """
    rasterize_cmd = """gdal_rasterize -burn 1 \
                    -tr %s %s PG:"host='/var/run/postgresql/' dbname={} \
                    user={} password={}" \
                    -te %s %s %s %s\
                    -sql "select ST_Curvetoline(wkb_geometry) from ax_gebaeude" {}_rasterize.tif""".format(config['DATABASE']['PSQL_DBName'], 
                    config['DATABASE']['PSQL_User'],
                    config['DATABASE']['PSQL_Password'], img_path) % (resolutiox, resolutiony,  minx, miny, maxx, maxy)
      
    p = subprocess.Popen([rasterize_cmd], shell=True)
    p.wait()
    ds = gdal.Open("{}_rasterize.tif".format(img_path))
    myarray = np.array(ds.GetRasterBand(1).ReadAsArray())
    
    if show_image:
        plt.figure(0)
        plt.imshow(myarray)
       
    cv2.imwrite("{}_rasterize.png".format(img_path), np.array(myarray*255, dtype=np.uint8))
    os.remove("{}_rasterize.tif".format(img_path))
    return myarray

def get_aerial_image(img_path, show_image):
    """
    Get Information about location and resolution of aerial image
    
    :Returns: 
        - tuple with Geocoordinates of the Image Corners in EPSG 25832
        - [ResolutionX, ResolutionY] in meter / Pixel
    """
    
    in_image = gdal.Open(img_path)
    geoTransform = in_image.GetGeoTransform()
    resolution = [geoTransform[1], abs(geoTransform[5]) ]
    minx = geoTransform[0]
    maxy = geoTransform[3]
    maxx = minx + geoTransform[1] * in_image.RasterXSize
    miny = maxy + geoTransform[5] * in_image.RasterYSize
    print([minx, miny, maxx, maxy])
    print('Resolution {} m/pixel'.format(resolution))
    
    if show_image:
        print('Reading in aerial image, this may take a while')
        img_arr = in_image.ReadAsArray()
        img_arr = np.swapaxes(img_arr, 0, 2)
        img_arr = np.swapaxes(img_arr, 0, 1)
        plt.figure(1)
        plt.imshow(img_arr[::-1, : ,0:3], origin = 'lower')
    
        cv2.imwrite("tmp/A5_dop10rgbi_32306_5645_1_nw.png", img_arr[::-1, : ,0:3])
    
    return [minx, miny, maxx, maxy], resolution

def get_description(parameter, soup, param_set): 
    """
    Get human readable description for attribute value
    """
    rows = soup.findAll('tr')
    str_list = soup.prettify().split('bgcolor="#f0f0f0"')
    for i in str_list: 
        text = i.replace('\n', '').replace(' ', '')
        if 'Attributart:{}'.format(param_set) in text: 
            #print(i)
            soup2 = BeautifulSoup(i, 'html.parser')
            rows = soup2.findAll('tr')
            for row in rows:
                if True:
                    if str(int(parameter)) in str(row):
                        #print(row)
                        value = row.findAll('td', {'valign': 'top'})[1].text
                        value = ' '.join(value.split())
                        #print(value)
                        key = row.contents[3].contents[0]
                        key = ' '.join(key.split())
                        #print(key)
                        description = row.findAll('small')[0].text
                        description = ' '.join(description.split())
                        #print(description)
    return key, value, description

def translate(text): 
    """
    translates from german to english 
    NOT ALWAYS WORKING PROPERLY
    """
    translator = Translator()
    tmp_obj = translator.translate(text, dest='en', src='de')
    trans_text = tmp_obj.text
    return trans_text

def get_object_count(boundaries):
    """
    Returns True if there are Objects within the image boundaries 
    """    
    minx, miny, maxx, maxy = boundaries
    with psycopg2.connect(dbname=config['DATABASE']['PSQL_DBName'],
                          user=config['DATABASE']['PSQL_User'], 
                          password = config['DATABASE']['PSQL_Password'],
                          host=config['DATABASE']['PSQL_Service']) as conn: 
        with conn.cursor() as cur: 
            cur.execute("select count(*) from ax_gebaeude where \
                            ST_Contains(\
                            ST_GeomFromText('POLYGON((%s %s, %s %s, %s %s, %s %s, %s %s))', 25832) ,wkb_geometry);".format(config['DATABASE']['PSQL_DBName']), \
                                        (minx, miny, maxx, miny, maxx, maxy, minx, maxy, minx, miny))
            res = cur.fetchall()
            #print(res[0][0])
    
    print('Objects in Image {}'.format(res[0][0]))
    if res[0][0] == 0:
        return False
    else :
        return True
    
    
@ray.remote   
def main(img_path):
    corner_points, resolution = get_aerial_image(img_path, False)
    CONTAINS_OBJECTS = get_object_count(corner_points)
    if CONTAINS_OBJECTS:
        print('Creating Rasterize Image')
        myarray = create_rasterize(img_path, corner_points, resolution, False)
    else: 
        print('Image contains no Objects')



if __name__ == '__main__': 
    """
    while True:
        DB_Selection = input('Connection to PostgreSQL Database ? (y/n)')
        if DB_Selection == 'y': 
            print('Connecting to PSQL DB')
            break
        if DB_Selection == 'n': 
            print('Continuing with .xml files and downloading databases')
            break
    """
        
    ray.init(num_cpus=4)
    pids = []
    for i in glob.glob((config['PATHS']['SatImg_Dir'] + '*.jp2')): 
        pids.append(main.remote(i))
        
    for worker in tqdm(pids): 
        value = ray.get(worker)
    ray.shutdown()
        
      
    """    
    corner_points, resolution = get_aerial_image(i, False)
    CONTAINS_OBJECTS = get_object_count(corner_points)
    if CONTAINS_OBJECTS:
        print('Creating Rasterize Image')
        myarray = create_rasterize(i, corner_points, resolution, False)
    else: 
        print('Image contains no Objects')
        
    #df_params = list_parameters('gebaeudefunktion', 'ax-gebaeude')
    """
    
    
    
    
    """
    HtmlFile = open('/media/data/41_CCS/98_Gitlab/GSIS/alkis_parameter.html', 'r', encoding='utf-8')
    source_code = HtmlFile.read() 
    soup = BeautifulSoup(source_code, 'html.parser')
    #for table in soup.find("gebaeudefunktion"):
        #if 'gebaeudefunktion' in str(table): 
    #    print(table)
    #table = soup.find(lambda tag: tag.name=='table')
    
    df_params['Key'] = None
    df_params['Description'] = None
    for i in tqdm(range(0,df_params.shape[0])): 
        key, value, description = get_description(df_params.iloc[i,0], soup, df_params.columns[0])
        df_params.iloc[i,2] = key
        df_params.iloc[i,3] = description
        
    df_params['count'] = df_params['count'] / df_params['count'].sum() * 100
    print(df_params)
    """
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# =============================================================================
# Deprecated
# =============================================================================
    """
    
    url = "http://www.adv-online.de/AAA-Modell/ALKIS/binarywriterservlet?imgUid=dc860f61-34ab-4a41-52cf-b581072e13d6&uBasVariant=11111111-1111-1111-1111-111111111111"
    
    http = httplib2.Http()
    status, response = http.('/media/data/41_CCS/98_Gitlab/GSIS/alkis_parameter.html')
    soup = BeautifulSoup(response)
    
    table = soup.find('table', attrs={'class':'lineItemsTable'})
    table_body = table.find('tbody')

    rows = table_body.find_all('tr')
    rows = table_body.find_all('tr')
    for row in rows:
        print(row)
        
        
        
    rows = soup.findAll('tr')
    for i in 
    for row in rows:
        try: 
            if '1010' == row.findAll('td')[-1].get_text():
                if True:
                #if 'Wohnhaus' in str(row):
                    print(row.prettify().split('<table')[0].split('valign="top">')[1].replace('\n', ''))
                    
        except: 
            None
    str_list = soup.prettify().split('bgcolor="#f0f0f0"')
    for i in str_list: 
        text = i.replace('\n', '').replace(' ', '')
        if 'Attributart:gebaeudefunktion' in text: 
            #print(i)
            soup2 = BeautifulSoup(i, 'html.parser')
            rows = soup2.findAll('tr')
            for row in rows:
                if True:
                #try: 
                    if '1010' in str(row):
                        #print(row)
                        if True:
                        #if 'Wohnhaus' in str(row):
                            #print(row.prettify().split('<table')[0].split('valign="top">')[1].replace('\n', ''))
                            #print(row.prettify())
                            key = row.findAll('td', {'valign': 'top'})[1].text
                            key = ' '.join(key.split())
                            print(key)
                            description = row.findAll('small')[0].text
                            description = ' '.join(description.split())
                            print(description)
                            break
                #except: 
                #    None
                     
    """