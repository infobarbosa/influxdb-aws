# Grafana
<br>
Vamos configurar um dashboard simples no Grafana com o InfluxDB como fonte de dados.

### Solução
- Acesse o menu "Traffic / Ports"
- Em "Custom Ports" informe 3000 (porta padrão do Grafana) e clique em Access
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
