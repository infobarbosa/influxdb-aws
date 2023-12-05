# InfluxDB UI
<br>
Vamos acessar a interface web do InfluxDB.

### Acessando a InfluxDB UI
- No console do EC2 acesse o security group (grupo de segurança) e adicione uma regra de entrada (ingress) especificando a porta 8086 (porta do InfluxDB) aberta para 0.0.0.0/0.
- Obtenha o DNS Público da instância EC2.
- Em uma nova janela do browser informe o DNS Público com a porta 8086. 
- Na tela do InfluxDB UI informe o usuário `barbosa` e senha `pessimasenha`.

### Solução 1
- No menu Buckets busque por "default"
- No canto superior à direita ative a chave seletora "Switch do old data explorer."
- Em "From" escolha o bucket "default"
- Em "Filter" escolha a measurement "pedidos"
- No novo "Filter" que se abrir escolha "Quantity"
- Escolha o intervalo de 1 minuto ou 5 minutos para visualização
- Clique em "Submit"

### Solução 2
- No menu Buckets busque por "default"
- No canto superior à direita ative a chave seletora "Switch do old data explorer."
- Clique em "Script Editor" e informe a consulta Flux a seguir:
```
from(bucket: "default")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "pedidos")
  |> filter(fn: (r) => r["_field"] == "Quantity")
  |> group(columns: ["produto"])
  |> aggregateWindow(every: v.windowPeriod, fn: sum, createEmpty: false)
  |> yield(name: "sum")
```  
- Escolha o intervalo de 1 minuto ou 5 minutos para visualização
- Clique em "Submit"

