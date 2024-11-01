export HDF5=/work2/09534/st37357/stampede3/libs
export NETCDF=/work2/09534/st37357/stampede3/libs
export PNETCDF=/work2/09534/st37357/stampede3/libs
export JASPERLIB=/work2/09534/st37357/stampede3/libs/lib
export JASPERINC=/work2/09534/st37357/stampede3/libs/include

export LDFLAGS=-L/work2/09534/st37357/stampede3/libs/lib
export CPPFLAGS=-I/work2/09534/st37357/stampede3/libs/include

export PATH=/work2/09534/st37357/stampede3/libs/lib:$PATH
export PATH=/work2/09534/st37357/stampede3/libs/bin:$PATH
export PATH=/work2/09534/st37357/stampede3/libs/include:$PATH
export LD_LIBRARY_PATH=/work2/09534/st37357/stampede3/libs/lib:$LD_LIBRARY_PATH

ln -fs /work2/09534/st37357/stampede3/IOLA_repository/sorc/WPSV3/geogrid.exe .
ln -sf /work2/09534/st37357/stampede3/IOLA_repository/parm/hwrf_GEOGRID.TBL ./GEOGRID.TBL
ln -sf /work2/09534/st37357/stampede3/IOLA_repository/parm/hwrf_METGRID.TBL ./METGRID.TBL

ln -fs /work2/09534/st37357/stampede3/IOLA_repository/parm/hwrf_Vtable_gfs2017 ./Vtable
ln -fs /work2/09534/st37357/stampede3/IOLA_repository/sorc/WPSV3/ungrib.exe .
ln -fs /work2/09534/st37357/stampede3/IOLA_repository/sorc/WPSV3/metgrid.exe .

ln -fs /work2/09534/st37357/stampede3/IOLA_repository/sorc/WRFV3/main/real_nmm.exe .
ln -fs /work2/09534/st37357/stampede3/IOLA_repository/sorc/WRFV3/main/wrf.exe .

ln -sf $FIX/hwrf_eta_micro_lookup.dat eta_micro_lookup.dat
ln -sf $FIX/hwrf_track track
ln -sf $FIX/hwrf-wrf/RRTMG_LW_DATA RRTMG_LW_DATA
ln -sf $FIX/hwrf-wrf/CAM_AEROPT_DATA CAM_AEROPT_DATA
ln -sf $FIX/hwrf-wrf/ozone_plev.formatted ozone_plev.formatted
ln -sf $FIX/hwrf-wrf/coeff_q.asc coeff_q.asc
ln -sf $FIX/hwrf-wrf/LANDUSE.TBL LANDUSE.TBL
ln -sf $FIX/hwrf-wrf/aerosol.formatted aerosol.formatted
ln -sf $FIX/hwrf-wrf/CLM_EXT_ICE_DFS_DATA CLM_EXT_ICE_DFS_DATA
ln -sf $FIX/hwrf-wrf/kernels.asc_s_0_03_0_9 kernels.asc_s_0_03_0_9
ln -sf $FIX/hwrf-wrf/grib2map.tbl grib2map.tbl
ln -sf $FIX/hwrf-wrf/CLM_DRDSDT0_DATA CLM_DRDSDT0_DATA
ln -sf $FIX/hwrf-wrf/wind-turbine-1.tbl wind-turbine-1.tbl
ln -sf $FIX/hwrf-wrf/CLM_ALB_ICE_DRC_DATA CLM_ALB_ICE_DRC_DATA
ln -sf $FIX/hwrf-wrf/GENPARM.TBL GENPARM.TBL
ln -sf $FIX/hwrf-wrf/RRTM_DATA_DBL RRTM_DATA_DBL
ln -sf $FIX/hwrf-wrf/README.namelist README.namelist
ln -sf $FIX/hwrf-wrf/kernels_z.asc kernels_z.asc
ln -sf $FIX/hwrf-wrf/gribmap.txt gribmap.txt
ln -sf $FIX/hwrf-wrf/tr49t85 tr49t85
ln -sf $FIX/hwrf-wrf/tr49t67 tr49t67
ln -sf $FIX/hwrf-wrf/CLM_ASM_ICE_DRC_DATA CLM_ASM_ICE_DRC_DATA
ln -sf $FIX/hwrf-wrf/constants.asc constants.asc
ln -sf $FIX/hwrf-wrf/ETAMPNEW_DATA_DBL ETAMPNEW_DATA_DBL
ln -sf $FIX/hwrf-wrf/aerosol_plev.formatted aerosol_plev.formatted
ln -sf $FIX/hwrf-wrf/RRTMG_SW_DATA RRTMG_SW_DATA
ln -sf $FIX/hwrf-wrf/ozone.formatted ozone.formatted
ln -sf $FIX/hwrf-wrf/aerosol_lon.formatted aerosol_lon.formatted
ln -sf $FIX/hwrf-wrf/tr67t85 tr67t85
ln -sf $FIX/hwrf-wrf/RRTMG_SW_DATA_DBL RRTMG_SW_DATA_DBL
ln -sf $FIX/hwrf-wrf/co2_trans co2_trans
ln -sf $FIX/hwrf-wrf/URBPARM_UZE.TBL URBPARM_UZE.TBL
ln -sf $FIX/hwrf-wrf/CLM_ALB_ICE_DFS_DATA CLM_ALB_ICE_DFS_DATA
ln -sf $FIX/hwrf-wrf/CAMtr_volume_mixing_ratio.RCP6 CAMtr_volume_mixing_ratio.RCP6
ln -sf $FIX/hwrf-wrf/RRTMG_LW_DATA_DBL RRTMG_LW_DATA_DBL
ln -sf $FIX/hwrf-wrf/CLM_ASM_ICE_DFS_DATA CLM_ASM_ICE_DFS_DATA
ln -sf $FIX/hwrf-wrf/coeff_p.asc coeff_p.asc
ln -sf $FIX/hwrf-wrf/CLM_KAPPA_DATA CLM_KAPPA_DATA
ln -sf $FIX/hwrf-wrf/bulkradii.asc_s_0_03_0_9 bulkradii.asc_s_0_03_0_9
ln -sf $FIX/hwrf-wrf/CAMtr_volume_mixing_ratio.A1B CAMtr_volume_mixing_ratio.A1B
ln -sf $FIX/hwrf-wrf/CAMtr_volume_mixing_ratio.A2 CAMtr_volume_mixing_ratio.A2
ln -sf $FIX/hwrf-wrf/ozone_lat.formatted ozone_lat.formatted
ln -sf $FIX/hwrf-wrf/aerosol_lat.formatted aerosol_lat.formatted
ln -sf $FIX/hwrf-wrf/ETAMPNEW_DATA ETAMPNEW_DATA
ln -sf $FIX/hwrf-wrf/README.fix README.fix
ln -sf $FIX/hwrf-wrf/CLM_EXT_ICE_DRC_DATA CLM_EXT_ICE_DRC_DATA
ln -sf $FIX/hwrf-wrf/termvels.asc termvels.asc
ln -sf $FIX/hwrf-wrf/README.tslist README.tslist
ln -sf $FIX/hwrf-wrf/bulkdens.asc_s_0_03_0_9 bulkdens.asc_s_0_03_0_9
ln -sf $FIX/hwrf-wrf/RRTM_DATA
ln -sf $FIX/hwrf-wrf/ETAMPNEW_DATA.expanded_rain ETAMPNEW_DATA.expanded_rain
ln -sf $FIX/hwrf-wrf/CLM_TAU_DATA CLM_TAU_DATA
ln -sf $FIX/hwrf-wrf/CAMtr_volume_mixing_ratio.RCP8.5 CAMtr_volume_mixing_ratio.RCP8.5
ln -sf $FIX/hwrf-wrf/CCN_ACTIVATE.BIN CCN_ACTIVATE.BIN
ln -sf $FIX/hwrf-wrf/URBPARM.TBL URBPARM.TBL
ln -sf $FIX/hwrf-wrf/capacity.asc capacity.asc
ln -sf $FIX/hwrf-wrf/CAMtr_volume_mixing_ratio.RCP4.5 CAMtr_volume_mixing_ratio.RCP4.5
ln -sf $FIX/hwrf-wrf/masses.asc masses.asc
ln -sf $FIX/hwrf-wrf/CAM_ABS_DATA CAM_ABS_DATA
ln -sf $FIX/hwrf-wrf/ETAMPNEW_DATA.expanded_rain_DBL ETAMPNEW_DATA.expanded_rain_DBL
ln -sf $FIX/hwrf-wrf/SOILPARM.TBL SOILPARM.TBL
ln -sf $FIX/hwrf-wrf/VEGPARM.TBL VEGPARM.TBL
ln -sf $FIX/hwrf-wrf/MPTABLE.TBL MPTABLE.TBL
ln -sf $FIX/hwrf_wps_geo geog-data

alias link_grib=/work2/09534/st37357/frontera/HWRF4/hwrfrun/sorc/WPS/link_grib.csh

#cp /work2/09534/st37357/stampede3/iola_scripts/namelist* .
cp /work2/09534/st37357/stampede3/iola_scripts/iola-utilities/create_namelist.py .
cp /work2/09534/st37357/stampede3/iola_scripts/iola-utilities/create_namelist_gulf.py .
cp /work2/09534/st37357/stampede3/iola_scripts/iola-utilities/job.sh .
cp /work2/09534/st37357/stampede3/iola_scripts/iola-utilities/acc_austin.py .
cp /work2/09534/st37357/stampede3/iola_scripts/iola-utilities/down.py .
cp /work2/09534/st37357/stampede3/iola_scripts/iola-utilities/down_fnl.py .
