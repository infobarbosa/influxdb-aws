# Grafana
<br>
Vamos configurar um dashboard simples no Grafana com o InfluxDB como fonte de dados.

### Solução
- No console do EC2 acesse o security group (grupo de segurança) e adicione uma regra de entrada (ingress) especificando a porta 3000 (porta do Grafana) aberta para 0.0.0.0/0.
- Obtenha o DNS Público da instância EC2.
- Em uma nova janela do browser informe o DNS Público com a porta 3000. 
- No Gravana busque o menu "Explore"
- No campo editável informe a query Flux a seguir:

```
from(bucket: "default")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "pedidos")
  |> filter(fn: (r) => r["_field"] == "Quantity")
  |> group(columns: ["produto"])
  |> aggregateWindow(every: v.windowPeriod, fn: sum, createEmpty: false)
  |> yield(name: "sum")
```

- Clique em "Run query"
- Escolha o período "Last 5 minutes"
- Clique em "Add to dashboard"
- No modal que se abrirá informe "New dashboard" e clique em "Open dashboard"
- Clique em "Save dashboard" e informe "Vendas" como nome do mesmo.
