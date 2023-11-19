#!/usr/bin/env bash

export INFLUX_CONFIG_NAME=default
export INFLUX_BUCKET_NAME=default
export INFLUX_HOST=http://localhost:8086
export INFLUX_ORG=infobarbosa
export INFLUX_TOKEN=3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==
export INFLUX_USER=barbosa
export INFLUX_PASSWORD=pessimasenha

produtos=("TV" "GELADEIRA" "TV" "HOMETHEATER" "COMPUTADOR" "MONITOR" "TABLET" "SOUNDBAR" "CELULAR" "NOTEBOOK")
for i in `seq 10000`
do
    if [ $(expr $i % 2 ) != "0" ]; then
        influx write --bucket default "pedidos,produto=${produtos[${RANDOM:0:1}]},pais=BR Quantity=``${RANDOM:0:1}`` `date +%s%N`"
    else
        influx write --bucket default "pedidos,produto=${produtos[${RANDOM:0:1}]},pais=US Quantity=``${RANDOM:0:1}`` `date +%s%N`"
    fi

    sleep 0.05
done