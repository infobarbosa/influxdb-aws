# InfluxDB - influx write (csv)

Hora de escrever os dados no InfluxDB.

Verifique o arquivo `invoices.csv` disponível no servidor.
```plain
ls -latrh invoices.csv

wc -l invoices.csv
```{{exec}}

Analise as informações disponíveis no mesmo
```plain
head -50 invoices.csv


tail -50 invoices.csv
```{{exec}}

### Sintaxe
```plain
influx write -b default \
  -f invoices.csv \
  --header "#constant measurement,invoices" \
  --header "#datatype dateTime,tag,tag,tag,tag,tag,double,double"

```{{exec}}
