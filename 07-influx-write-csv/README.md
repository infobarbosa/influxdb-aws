# InfluxDB - influx write (csv)

Hora de escrever os dados no InfluxDB.

Verifique o arquivo `invoices.csv` disponível no servidor.
```
ls -latrh invoices.csv

wc -l invoices.csv
```

Analise as informações disponíveis no mesmo
```
head -50 invoices.csv


tail -50 invoices.csv
```

### Sintaxe
```
influx write -b default \
  -f ./data/invoices.csv \
  --header "#constant measurement,invoices" \
  --header "#datatype dateTime,tag,tag,tag,tag,tag,double,double"

```
