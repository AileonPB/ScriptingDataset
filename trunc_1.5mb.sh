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

# Truncamos el archivo a 1.5mb y eliminamos la última línea. 
head -c 1500000 $1 > $NAME_WITHOUT_CSV.trunc.csv
sed -i '$ d' $NAME_WITHOUT_CSV.trunc.csv
