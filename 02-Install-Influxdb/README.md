Author: Prof. Barbosa<br>
Contact: infobarbosa@gmail.com<br>
Github: [infobarbosa](https://github.com/infobarbosa)

# Instalação do Influxdb

O objetivo desta sessão é executar a instalação automática do Influxdb e outras ferramentas como Grafana.

> Atenção! Os comandos desse laboratório presumem que você está no diretório ./influxdb-aws

```
cd influxdb-aws/
```

### Execute o script `setup_influxdb.sh`
Execute o script `setup_influxdb.sh` conforme a seguir:
```
sh scripts/setup_influxdb.sh
```

### Torne o script `pedidos1.sh` executável
```
chmod +x scripts/pedidos1.sh
```

### Execute o script `pedidos1.sh`
`nohup` indica que o script será executado em background
```
nohup scripts/pedidos1.sh &
```

Parabéns! Seu ambiente Cloud9 está pronto pra uso!
