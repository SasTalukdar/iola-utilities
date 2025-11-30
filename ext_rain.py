#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun  3 11:01:08 2025

@author: st37357
"""

from scipy.interpolate import griddata
import pandas as pd
import xarray as xr
import numpy as np
from glob import glob
from concurrent.futures import ProcessPoolExecutor

def st(x):
    if x<10:
        return '0'+str(x)
    else:
        return str(x)

def create_nc(params):
    path, out_file = params
    lon1, lat1 = np.meshgrid(np.arange(55,110.1,0.18), np.arange(0,42.1,0.18))
    lon2, lat2 = np.meshgrid(np.arange(55,110,0.06), np.arange(0,42,0.06))
    lon3, lat3 = np.meshgrid(np.arange(55,110,0.02), np.arange(0,42,0.02))
    #d=path[-1]

    files=sorted(glob(path+'*'))
    print(len(files))
    if len(files)>0:
        date1=files[0][-19:].replace('_',':')
        date1=pd.to_datetime(date1[:10] + ' ' + date1[11:])
        date2=files[-1][-19:].replace('_',':')
        date2=pd.to_datetime(date2[:10] + ' ' + date2[11:])
        
        date_rec=[]
        all_rain=[]
        
        for i,date in enumerate(pd.date_range(date1,date2, freq='1H')):
            print(date)
            ncfile=xr.open_dataset(path+f'_{st(date.year)}-{st(date.month)}-{st(date.day)}_{st(date.hour)}_00_00')
            rain=ncfile['TG_TOTAL_PRECIP'].squeeze().values*1000
            hlon=ncfile['HLON'].squeeze().values
            hlat=ncfile['HLAT'].squeeze().values
            points = np.stack((hlat.ravel(), hlon.ravel()), axis=-1)
            
            del_x=np.round(np.mean((hlon[0,:]-np.roll(hlon[0,:],1))[1:]),3)
            
            if del_x>0.12:
                lon = lon1
                lat=lat1
            elif del_x>0.04 and del_x<0.12:
                lon=lon2
                lat=lat2
            else:
                lon=lon3
                lat=lat3
            rain = griddata(points, rain.ravel(), (lat, lon), method='linear')
            all_rain.append(rain)
            date_rec.append(date)
        all_rain=np.array(all_rain)
        rain=xr.DataArray(all_rain, dims=['time','lat','lon'], coords=[date_rec, lat[:,0], lon[0,:]])
        rain.name='prec'
        rain.to_netcdf(out_file)
        
        acc_rain=rain.sum(axis=0)
        acc_rain.to_netcdf(out_file[:-3]+'_acc.nc')

def main():
    paths=[[f'wrfout_d0{d}', f'prec_{d}.nc'] for d in range(1,6)]
    with ProcessPoolExecutor(max_workers=24) as executor:
        results = executor.map(create_nc, paths)

if __name__ == "__main__":
    main()