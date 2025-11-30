import os
from concurrent.futures import ProcessPoolExecutor

def st(x):
    if x>99:
        return str(x)
    elif x>9:
        return '0'+str(x)
    else:
        return '00'+str(x)

def down(param):
    date, x = param
    os.system(f'wget --no-check-certificate https://data-osdf.rda.ucar.edu/ncar/rda/d084001/{date[:4]}/{date[:-2]}/gfs.0p25.{date}.f{st(x)}.grib2')

def main():
    date='2025070400'
    param = [[date,x] for x in range(0,49,3)]
    with ProcessPoolExecutor(max_workers=10) as executor:
        results = executor.map(down, param)

if __name__ == "__main__":
    main()
