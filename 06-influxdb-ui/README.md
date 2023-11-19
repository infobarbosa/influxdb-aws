# InfluxDB UI
<br>
Vamos acessar a interface web do InfluxDB.

### Acessando a InfluxDB UI
- Acesse o menu "Traffic / Ports"
- Em "Custom Ports" informe 8086 e clique em Access.
- Na tela do InfluxDB UI informe o usuário `barbosa` e senha `inseguro`.

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

