import os

def st(x):
    if x>99:
        return str(x)
    elif x>9:
        return '0'+str(x)
    else:
        return '00'+str(x)

date='2021040800'
for x in range(0,48):
    os.system(f'wget https://data.rda.ucar.edu/ds084.1/date[:4]/{date[:-2]}/gfs.0p25.{date}.f{st(x)}.grib2')
