#!/bin/bash

# Comprobamos que el archivo existe y es un csv
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

if [[ $1 != *.csv ]]; then
    echo "File must be a csv!"
    exit 1
fi

NAME_WITHOUT_CSV=${1%.csv}

#truncamos 1500mb usando head pero manteniendo la primera linea
head -n 1 $1 > $NAME_WITHOUT_CSV"_trunc.csv"
#cogemos todas las filas del año 2018 y 2019
grep -E "2018|2019" $1 >> $NAME_WITHOUT_CSV"_trunc.csv"
