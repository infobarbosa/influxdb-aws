# InfluxDB - influx write

`influx write` escreve data points no InfluxDB via entrada padrão (console) ou a partir de um arquivo de dados.
<br>

### Sintaxe

```
influx write [flags]
influx write [command]
``` 

Maiores informações podem ser obtidas em https://docs.influxdata.com/influxdb/v2.5/reference/cli/influx/write/

### Exemplos:
```
influx write --bucket default "pedidos,produto=GELADEIRA Quantity=1,UnitPrice=2000 1668387574000000000"
```

Vendemos duas TVs! 
Perceba que desta vez não informamos o timestamp.
```
influx write --bucket default "pedidos,produto=TV Quantity=2,UnitPrice=5000"
```

Inserindo múltiplos data points
```
influx write --bucket default "
pedidos,produto=FOGAO Quantity=1,UnitPrice=1000 1668426060401463300
pedidos,produto=GELADEIRA Quantity=1,UnitPrice=2000 1668426081342160900
pedidos,produto=LAVADOURA Quantity=1,UnitPrice=1000 1668426093037252400
pedidos,produto=FILTRO Quantity=1,UnitPrice=500 1668426100229183600
pedidos,produto=TV Quantity=1,UnitPrice=5000 1668426107622748900
"
```
