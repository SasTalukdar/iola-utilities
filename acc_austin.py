from scipy.interpolate import griddata
import pandas as pd
import xarray as xr
import matplotlib.pyplot as plt
import numpy as np
import cartopy.crs as ccrs
import cartopy.feature as cf
from cartopy.mpl.ticker import LongitudeFormatter, LatitudeFormatter
import os

plt.rcParams["font.weight"] = "bold"
plt.rcParams["axes.labelweight"] = "bold"
plt.rcParams['xtick.labelsize']=18
plt.rcParams['ytick.labelsize']=18
plt.rcParams["axes.linewidth"] = 4
plt.rcParams["patch.linewidth"] =2
plt.rcParams['font.size']=22
plt.rcParams['xtick.major.size']=8
plt.rcParams['ytick.major.size']=8
plt.rcParams['xtick.major.width']=3
plt.rcParams['ytick.major.width']=3

def st(x):
    if x<10:
        return '0'+str(x)
    else:
        return str(x)

def add_all(ax, x=True, y=True):
    ax.add_feature(cf.STATES)
    lon_formatter = LongitudeFormatter(zero_direction_label=True)
    lat_formatter = LatitudeFormatter()
    if y==True:
        ax.set_yticks(np.arange(-60,85,5), crs=ccrs.PlateCarree())
    else:
        ax.set_yticks(np.arange(30,46,10), [], crs=ccrs.PlateCarree())
    ax.yaxis.set_major_formatter(lat_formatter)
    ax.set_xticks(range(-150,-24,5), crs=ccrs.PlateCarree())
    ax.xaxis.set_major_formatter(lon_formatter)
    ax.tick_params(axis='x', labelsize=22)
    ax.tick_params(axis='y', labelsize=22)
    ax.coastlines()
    return ax

lons=[]
lats=[]
lon1, lat1 = np.meshgrid(np.arange(-110,-60,0.18), np.arange(17,40,0.18))
lon2, lat2 = np.meshgrid(np.arange(-110,-60,0.066), np.arange(17,40,0.066))
lon3, lat3 = np.meshgrid(np.arange(-110,-60,0.022), np.arange(17,40,0.022))

fig=plt.figure(figsize=(12,10))
ax=plt.subplot(1,1,1,projection=ccrs.PlateCarree())
ax=add_all(ax)

date_rec=[]
for d in range(1,5):
    all_rain=[]
    for i,date in enumerate(pd.date_range('2024-08-05 00:00:00','2024-08-11 00:00:00', freq='1H')):
        try:
            print(date)
            ncfile=xr.open_dataset(f'wrfout_d0{d}_2024-08-{st(date.day)}_{st(date.hour)}_00_00')
            rain=ncfile['TG_TOTAL_PRECIP'].squeeze().values*1000
            hlon=ncfile['HLON'].squeeze().values
            hlat=ncfile['HLAT'].squeeze().values
            points = np.stack((hlat.ravel(), hlon.ravel()), axis=-1)
            if d==1:
                lon = lon1
                lat=lat1
            elif d==2:
                lon=lon2
                lat=lat2
            else:
                lon=lon3
                lat=lat3
            rain = griddata(points, rain.ravel(), (lat, lon), method='linear')
            all_rain.append(rain)
            if d==4:
                lons.append(hlon[int(hlat.shape[0]/2)+1,int(hlon.shape[1]/2)+1])
                lats.append(hlat[int(hlat.shape[0]/2)+1,int(hlon.shape[1]/2)+1])
                date_rec.append(str(date))
        except:
            pass
    rain1=np.nansum(all_rain, axis=0)
    #rain1[rain1<1]=np.nan
    rain1=rain1*0.0393701
    plt.contourf(lon, lat, rain1, levels=np.arange(0,21,2), extend='max',cmap='gist_stern_r')
plt.plot(lons,lats,'b',lw=1)
plt.colorbar(label='Cumulative rainfall (inches)',shrink=0.8, orientation='horizontal')

for i in range(0,len(lons),12):
    plt.scatter(lons[i], lats[i],  marker='.', color='k')
    plt.text(lons[i], lats[i], ' AUG '+str(date_rec[i])[9:13]+' UTC', fontsize=8, transform=ccrs.PlateCarree())

#plt.scatter([-97.743],[30.267],marker='*',color='r')
#plt.text(-99, 30.5, "Austin")
#plt.scatter([-95.7604],[29.7604],marker='*',color='r')
#plt.text(-96, 30.1, "Houston")
#plt.scatter([-98.4243],[29.4252],marker='*',color='r')
#plt.text(-100, 28, "San Antonio")
#plt.scatter([-96.7767],[32.7767],marker='*',color='r')
#plt.text(-97.5, 32, "Dallas")
plt.xlim(-100,-65)
plt.ylim(17,40)
plt.title('Initialization 05 Aug 2024, 0 UTC')
plt.savefig('debby_0805.jpg',dpi=300)
plt.clf()

