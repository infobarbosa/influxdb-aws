#!/bin/bash

echo "Instalação iniciada em `date -Is`" >> /tmp/install.log 

# Adicionando o repositório do grafana:
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Atualizando lista de pacotes
sudo apt update -y

###########################################################
# Instalação do InfluxDB
###########################################################
# Ubuntu/Debian AMD64
curl -O https://dl.influxdata.com/influxdb/releases/influxdb2_2.7.4-1_amd64.deb
sudo dpkg -i influxdb2_2.7.4-1_amd64.deb

sudo systemctl enable influxdb
sudo systemctl start influxdb

###########################################################
# Instalação do cliente InfluxDB
###########################################################

# Baixando os binários:
wget https://dl.influxdata.com/influxdb/releases/influxdb2-client-2.7.3-linux-amd64.tar.gz

# Desempacotando:
tar xvzf ./influxdb2-client-2.7.3-linux-amd64.tar.gz

# Movendo para `/usr/local/bin`:
sudo cp ./influx /usr/local/bin/


### Configurando o acesso

# Setando algumas variáveis de ambiente:
sudo echo 'export INFLUX_CONFIG_NAME=default' >> /etc/profile
sudo echo 'export INFLUX_BUCKET_NAME=default' >> /etc/profile
sudo echo 'export INFLUX_HOST=http://localhost:8086' >> /etc/profile
sudo echo 'export INFLUX_ORG=infobarbosa' >> /etc/profile
sudo echo 'export INFLUX_TOKEN=3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==' >> /etc/profile
sudo echo 'export INFLUX_USER=barbosa' >> /etc/profile
sudo echo 'export INFLUX_PASSWORD=inseguro' >> /etc/profile

source /etc/profile

# Executando a configuração inicial:
influx setup \
  --username ${INFLUX_USER} \
  --password ${INFLUX_PASSWORD} \
  --token ${INFLUX_TOKEN} \
  --org ${INFLUX_ORG} \
  --bucket ${INFLUX_BUCKET_NAME} \
  --force

###########################################################
# Instalação do Grafana
###########################################################

# Criando um usuário de sistema operacional para o Grafana:
sudo useradd \
    --system \
    --no-create-home \
    --shell /bin/false grafana

# Instalando dependências:
sudo apt install -y wget apt-transport-https software-properties-common

# Importando a GPG key:
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

# Atualizando lista de pacotes
sudo apt update -y

# Executando a instalação:
sudo apt -y install grafana

# Incluindo arquivo de configuração de datasource InfluxDB
sudo mv influxdb-grafana-datasource.yaml /etc/grafana/provisioning/datasources/influxdb.yaml

# Ativando o serviço
sudo systemctl enable grafana-server

# Inicializando o serviço
sudo systemctl start grafana-server

###########################################################
# Inicializando a produção de data point
###########################################################
nohup ~/pedidos.sh &

###########################################################
echo "Instalação finalizada em `date -Is`" >> /tmp/install.log





