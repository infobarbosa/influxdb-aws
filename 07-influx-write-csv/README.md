# InfluxDB - influx write (csv)

Hora de escrever os dados no InfluxDB.

Verifique o arquivo `invoices.csv` disponível no servidor.
### Listar o arquivo
```
ls -latrh ./data/invoices.csv
```

### Contagem de linhas
```
wc -l ./data/invoices.csv
```

### Analise as informações disponíveis no mesmo
```
head -50 ./data/invoices.csv
```

```
tail -50 ./data/invoices.csv
```

### Sintaxe
```
influx write -b default \
  -f ./data/invoices.csv \
  --header "#constant measurement,invoices" \
  --header "#datatype dateTime,tag,tag,tag,tag,tag,double,double"

```
