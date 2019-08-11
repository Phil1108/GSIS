#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Aug 10 12:37:30 2019

@author: philipp


:TO-DO: 
    - improve Doc 
    - make generator for file names

"""


import sys 
import pickle
import os 
import urllib
import requests
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
from zipfile import ZipFile
import ray

config = configparser.ConfigParser()
config.sections()
config.read('config.json')

def download(url, filename):
    """
    Downloads file from url with a progressbar
    :TO-DO: 
        - Check if file already exists
    """
    if os.path.exists(filename): 
        print('{} already downloaded'.format(filename))
    else: 
        with open(file_name, "wb") as f:
            print("Downloading %s" % file_name)
            response = requests.get((base_url +  url_add), stream=True)
            total_length = response.headers.get('content-length')
    
            #if total_length is None: # no content length header
            #    f.write(response.content)
            if True:
                dl = 0
                total_length = int(total_length)
                for data in response.iter_content(chunk_size=4096):
                    dl += len(data)
                    f.write(data)
                    done = int(50 * dl / total_length)
                    sys.stdout.write("\r[%s%s]" % ('=' * done, ' ' * (50-done)) )    
                    sys.stdout.flush()
        return True

def download_alkis():
    """
    Download all alkis zip-files from NRW server. Prints progressbars
    
    :Parameters: 
        - path to save zip-files
    """
    base_url = "https://www.opengeodata.nrw.de/produkte/geobasis/lika/alkis_sek/bda_oe/"
    
    with open('index_alkis.json', 'r') as alkis_json:
        get = json.loads(alkis_json.read())
    
    nr_files = len(get['datasets'][0]['files'])
    
    for i in tqdm(range(0, nr_files)):
        url_add = get['datasets'][0]['files'][i]['name']
        
        file_name = config['PATHS']['DownloadDir'] + 'alkis_zip/' + url_add
    
        download((base_url +  url_add), file_name)
    
    return True

def file_generator(path):
    """
    Generates file paths
    """
    with open('index_alkis.json', 'r') as alkis_json:
        get = json.loads(alkis_json.read())
        
    nr_files = len(get['datasets'][0]['files'])
    
    for i in range(0, nr_files):
        url_add = get['datasets'][0]['files'][i]['name']
        file_name =  path + 'alkis_zip/' + url_add
        yield file_name

@ray.remote        
def extract2PGIS(key, zip_file, extract_path): 
    """
    extracts only the file for the given key (example 31001 for houses etc.)
    
    Saves the file with the according Official Id for the county
    """
    extract_path = extract_path + zip_file.split('_')[-4] + '/' 
    os.makedirs(os.path.dirname(extract_path), exist_ok=True)
    print(extract_path)
    
    with ZipFile(zip_file, 'r') as zipObj:
        listOfFileNames = zipObj.namelist()
        for fileName in listOfFileNames:
            if key in fileName:
                zipObj.extract(fileName, extract_path)    
                Ruby_Path = "xmi2db-master/converter/rename_nas.rb"
                XML_File = extract_path + fileName 
                ruby_cmd = "ruby {} {}".format(Ruby_Path, XML_File)
            
                p = subprocess.Popen([ruby_cmd], shell=True)
                p.wait()
                os.remove(XML_File)
                
                Renamed_File = os.listdir(extract_path)
                Renamed_Path = (extract_path + Renamed_File[0])
                #Renamed_Path = os.path.abspath(Renamed_File[0])
                
                """
                XML2PGIS = 'ogr2ogr -f "PostgreSQL" --config PG_USE_COPY NO \
                -nlt CONVERT_TO_LINEAR -append PG:"dbname={}  \
                active_schema=public user={} host=\'{}\' \
                port=5432 password={}" -a_srs EPSG:25832 %s'.format(config['DATABASE']['PSQL_DBName'],
                config['DATABASE']['PSQL_User'], config['DATABASE']['PSQL_Service'], config['DATABASE']['PSQL_Password'])
                """
                
                XML2PGIS = 'ogr2ogr -f "PostgreSQL" --config PG_USE_COPY NO \
                -nlt PROMOTE_TO_MULTI -append PG:"dbname={}  \
                active_schema=public user={} host=\'{}\' \
                port=5432 password={}" -a_srs EPSG:25832 %s'.format(config['DATABASE']['PSQL_DBName'],
                config['DATABASE']['PSQL_User'], config['DATABASE']['PSQL_Service'], config['DATABASE']['PSQL_Password'])
                
                #print(XML2PGIS % Renamed_Path)
                p = subprocess.Popen([XML2PGIS % Renamed_Path], shell=True)
                p.wait()
                
                os.remove(Renamed_Path)
    
    return None
        
if __name__ == '__main__': 
    type_dict = {'ax_gebaeude': '31001'
                 }
    
    param_set    = 'ax_gebaeude'
    key = type_dict[param_set]
    
    extract_path = config['PATHS']['DownloadDir'] + key + '/'
    
    #download_alkis()

    gen = file_generator(config['PATHS']['DownloadDir'])
    #for zip_file in gen: 
    #    if 'Bonn' in zip_file:
    #        extract2PGIS(key, zip_file, extract_path)
    
    ray.init()
    pids = []
    for zip_file in gen: 
        pids.append(extract2PGIS.remote(key, zip_file, extract_path))
        
    for worker in tqdm(pids): 
        value = ray.get(worker)
    ray.shutdown()
    
    
    
# =============================================================================
# Deprecated    
# =============================================================================
    
    """
    base_url = "https://www.opengeodata.nrw.de/produkte/geobasis/lika/alkis_sek/bda_oe/"
    
    #r = requests.get(alkis_json_url)
    with open('index_alkis.json', 'r') as alkis_json:
        get = json.loads(alkis_json.read())
    
    nr_files = len(get['datasets'][0]['files'])
    
    for i in tqdm(range(0, nr_files)):
        url_add = get['datasets'][0]['files'][i]['name']
        
        file_name = config['PATHS']['DownloadDir'] + 'alkis_zip/' + url_add
    
        download((base_url +  url_add), file_name)
    """
