#!/bin/bash
mon=$(date "+%_m")
day=$(date "+%_d")
time=$(date "+%H%M")
echo $mon
r=$((2*$mon-2))
s=$((2*$mon-1))
d=$(($day-1))

sunr=( $(cut -d ' ' -f$r sunr_suns.csv) )
suns=( $(cut -d ' ' -f$s sunr_suns.csv) )
r=${sunr[$d]}
s=${suns[$d]}
lat=42
lon=23
lat1=$((-$lat))
lon1=$((180-${lon#-}))
if [$time<$r] || [$time>$s] ; then
	xflux -l $lat -g $lon -k 3400
else
	xflux -l $lat1 -g $lon1 -k 3400
fi



















