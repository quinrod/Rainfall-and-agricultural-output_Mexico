**********Merge station coordinates with station data averages******************

clear all

set more off

insheet using "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/Estaciones.csv", clear 

rename estacion station

rename longitud longitude

rename latitud latitude

label variable station "station"

label variable longitude "longitude"

label variable latitude "latitude"

save "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/Stations.dta", replace

************************Flag values repeates yearly*****************************
use "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean_collapse_T_prec_year_ave_merge.dta", clear

foreach var in prec Tmid Tmax Tmin Tobs {
	bysort station: ge tag_`var'=(`var'[_n]==`var'[_n-1])
	replace tag_`var'=1 if `var'==0 | `var'==.
}

set dp period, permanently

merge m:1 station using "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/Stations.dta"

drop if _m!=3
 
order station longitude latitude year prec Tmid Tmax Tmin Tobs tag_prec tag_Tmid tag_Tmax tag_Tmin tag_Tobs _merge

drop if longitude ==0

drop _m

save "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean_collapse_T_prec_year_ave_flag.dta", replace

export delimited using "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean_collapse_T_prec_year_ave_flag.csv", replace

#delimit;


drop if station=="MELZC" | station=="MEXJL" | station=="MGZTP" | station=="MHGSI" 
| station=="MIRVC" | station=="MLIVC"| station=="MLNSO"| station=="MNANL"
| station=="MORGJ"| station=="MQTSL"| station=="MRYTP"| station=="MSLSL"
| station=="MTPSO"| station=="MXLGR"| station=="MXLGR"| station=="MZQCL"
| station=="MZTSO"| station=="NA"| station=="NEUGJ"| station=="NOHYC"
| station=="OCMCL"| station=="OCRSI"| station=="OCTMR"| station=="OCTSL"
| station=="OHCHD"| station=="ORTCM"| station=="ORZDR"| station=="OTTSI"
| station=="PC2MX"| station=="PCHJL"| station=="PDLSI"| station=="PDSJL"
| station=="PGRDR"| station=="PIEDR"| station=="PIMCP"| station=="PITJL"
| station=="PIXMR"| station=="PLMQT"| station=="PLMSO"| station=="PLSCL"
| station=="M2MX"| station=="P"| station=="PMAMX"| station=="PNLDR"
| station=="POZGJ"| station=="PRSNL"| station=="PSLGR"| station=="PSOGR"
| station=="PXYCA"| station=="PSDMX"| station=="QTZGR"| station=="RDODR"
| station=="RENZC"| station=="RQEGJ"| station=="RSTDR"| station=="RVJVC"
| station=="SAAZC"| station=="SATVC"| station=="SBANL"| station=="SCRPB"
| station=="SDDVC"| station=="SDICP"| station=="SELCP"| station=="SFBNL"
| station=="SFLDR"| station=="SJLJL"| station=="SJPGJ"| station=="SJQMX"
| station=="SJQSI"| station=="SJTGR"| station=="SJTYC"| station=="SL3MX"
| station=="SLAGR"| station=="SLCDR"| station=="SJUNL"| station=="SLOGJ"
| station=="SLTDR"| station=="SMAGJ"| station=="SMAJL"| station=="SMAMR"
| station=="SMAOX"| station=="SMJCL"| station=="SMOGJ"| station=="SNASO"
| station=="SNMGR"| station=="SNTCM"| station=="SONVC"| station=="SPGDR"
| station=="SRTPB"| station=="SSEMC"| station=="STCNL"| station=="STETP"
| station=="TANSL"| station=="TAPVC"| station=="TARMC"| station=="TCCSL"
| station=="TCLVC"| station=="TDMQT"| station=="TECVC"| station=="TELPB"
| station=="TEOPB"| station=="THYCH"| station=="TLYMR"| station=="TLPPB"
| station=="TLYSI"| station=="TNZJL"| station=="TOMTP"| station=="TORNL"
| station=="TORSI"| station=="TOXCP"| station=="TPCGJ"| station=="TPCNL"
| station=="TPLDR"| station=="TPLSI"| station=="TRNSO"| station=="TZPJL"
| station=="URSSO"| station=="TRNGJ"| station=="TRTSI"| station=="UCFOX"
| station=="VAGSL"| station=="VANOX"| station=="TSFNL"| station=="VAQNL"
| station=="VATSL"| station=="VGRDR"| station=="TYAOX"| station=="VJRSL"
| station=="VLONL"| station=="VLPCH"| station=="VMAOX"| station=="XCTTP"
| station=="XICGJ"| station=="XOCTL"| station=="VSMTP"| station=="YCRSI"
| station=="YESSO"| station=="YHLHD"| station=="ZALVC"| station=="ZTCHD"
| station=="ZGZCL"| station=="ZINMC"| station=="ZRGNL"| station=="ZZMMC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"
| station=="MELZC"| station=="MELZC"| station=="MELZC"| station=="MELZC"

; #delimit cr

drop in 17475/17551

set dp period, permanently
format varlist %#.#g
