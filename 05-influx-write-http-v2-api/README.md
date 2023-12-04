# InfluxDB v2 API
<br>

A API v2 HTTP do InfluxDB oferece uma interface programática para interações com o database.
Neste tópico vamos escrever data points utilizando o endpoint padrão `/api/v2/write` e line protocol. 
<br>
Para mais informações acesse https://docs.influxdata.com/influxdb/v2.5/write-data/developer-tools/api/

### Exemplos:
Atenção! Para fins didáticos estamos omitindo o timestamp.

**Utilizando POST**
```
curl --request POST \
"http://ubuntu:8086/api/v2/write?org=infobarbosa&bucket=default&precision=ns" \
  --header "Authorization: Token 3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==" \
  --header "Content-Type: text/plain; charset=utf-8" \
  --header "Accept: application/json" \
  --data-binary 'pedidos,produto=COMPUTADOR Quantity=1,UnitPrice=2000 1668387574000000000'
```

**Utilizando XPOST**
```
curl -i -XPOST 'http://ubuntu:8086/api/v2/write?org=infobarbosa&bucket=default&precision=ns' \
  --header 'Authorization: Token 3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==' \
  --data-raw 'pedidos,produto=SANDUICHEIRA Quantity=1,UnitPrice=2000'
```

**Parâmetro header "Content-Type"**
```
curl -i -XPOST 'http://ubuntu:8086/api/v2/write?org=infobarbosa&bucket=default&precision=ns' \
  --header 'Authorization: Token 3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==' \
  --header "Content-Type: text/plain; charset=utf-8" \
  --data-raw 'pedidos,produto=LAVADOURA Quantity=1,UnitPrice=6000'
```

**Parâmetro header "Accept"**
```
curl -i -XPOST 'http://ubuntu:8086/api/v2/write?org=infobarbosa&bucket=default&precision=ns' \
  --header 'Authorization: Token 3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==' \
  --header "Content-Type: text/plain; charset=utf-8" \
  --header "Accept: application/json" \
  --data-raw 'pedidos,produto=ASPIRADOR Quantity=5,UnitPrice=600'
```
