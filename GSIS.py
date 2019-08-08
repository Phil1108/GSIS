#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug  8 20:20:55 2019

@author: philipp

Main File to wrap up all functions 

:TO-DO: 

"""

import configparser
import subprocess
import numpy as np
import osgeo.gdal as gdal
import matplotlib.pyplot as plt


config = configparser.ConfigParser()
config.sections()
config.read('config.json')


def create_rasterize(corner_locations, resolution, show_image): 
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
                    -l ax_gebaeude tmp/test_rasterize.tif""".format(config['DATABASE']['PSQL_DBName'], 
                    config['DATABASE']['PSQL_User'],
                    config['DATABASE']['PSQL_Password']) % (resolutiox, resolutiony,  minx, miny, maxx, maxy)
                    
    p = subprocess.Popen([rasterize_cmd], shell=True)
    p.wait()
    ds = gdal.Open('tmp/test_rasterize.tif')
    myarray = np.array(ds.GetRasterBand(1).ReadAsArray())
    
    if show_image:
        plt.figure(0)
        plt.imshow(myarray)
    return myarray

def get_aerial_image(img_path, show_image):
    """
    Get Information about location and resolution of aerial image
    
    :Returns: 
        - tuple with Geocoordinates of the Image Corners in EPSG 25832
        - [ResolutionX, ResolutionY] in meter / Pixel
    """
    
    in_image = gdal.Open("tmp/A5_dop10rgbi_32306_5645_1_nw.jp2")
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
    
    return [minx, miny, maxx, maxy], resolution

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
    corner_points, resolution = get_aerial_image('a', False)
    create_rasterize(corner_points, resolution, True)
    
    


    
    
