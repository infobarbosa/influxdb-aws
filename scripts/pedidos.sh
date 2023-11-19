#!/usr/bin/env bash
produtos=("TV" "GELADEIRA" "TV" "HOMETHEATER" "COMPUTADOR" "MONITOR" "TABLET" "SOUNDBAR" "CELULAR" "NOTEBOOK")
for i in `seq 10000`
do

    influx write --bucket default "pedidos,produto=${produtos[${RANDOM:0:1}]} Quantity=``${RANDOM:0:1}``,UnitPrice=2000 `date +%s%N`"
    
    sleep 0.05
done
