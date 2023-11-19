# Introdução ao InfluxDB

Author: Prof. Barbosa<br>
Contact: infobarbosa@gmail.com<br>
Github: [infobarbosa](https://github.com/infobarbosa)

O objetivo desse laboratório é oferecer ao aluno ambiente onde de familiarização com **InfluxDB**.

### Produtos 
Estão disponíveis as seguintes ferramentas:
- InfluxDB
    `https://dl.influxdata.com/influxdb/releases/influxdb2-2.7.0-amd64.deb`
- InfluxDB client
    `https://dl.influxdata.com/influxdb/releases/influxdb2-client-2.7.3-linux-amd64.tar.gz`
- Grafana

### Variáveis de ambiente
```
INFLUX_CONFIG_NAME=default
INFLUX_BUCKET_NAME=default
INFLUX_HOST=http://localhost:8086
INFLUX_ORG=infobarbosa
INFLUX_TOKEN=3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==
INFLUX_USER=barbosa
INFLUX_PASSWORD=inseguro
```

### Verificando a instalação
```plain
tail status-instalacao.txt
```{{exec}}

O lab estará pronto para uso quando aparecer a **última linha**:
```
Instalação iniciada em 2023-08-06T14:21:57+00:00
Instalação finalizada em 2023-08-06T14:22:27+00:00
```