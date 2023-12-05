# Grafana
<br>
Vamos configurar um dashboard simples no Grafana com o InfluxDB como fonte de dados.

### Solução
- No console do EC2 acesse o security group (grupo de segurança) e adicione uma regra de entrada (ingress) especificando a porta 3000 (porta do Grafana) aberta para 0.0.0.0/0.
- Obtenha o DNS Público da instância EC2.
- Em uma nova janela do browser informe o DNS Público com a porta 3000. 
- No Gravana busque o menu "Explore"
- No combo ao lado do menu "Outline" escolha `InfluxDB_v2_InfluxQL`
- No label FROM informe: default
- Clique no label `select measurement` e escolha `pedidos`
- No label WHERE clique no sinal ` + ` e escolha `produto::tag`
- Clique em `select tag value` e escolha `CELULAR`
- No label SELECT clique em `field(value)` e escolha `quantity`
- Clique em `mean()` e então em `remove` para remover essa função agregadora
- Clique no ` + `, escolha `Aggregations` e então escolha a função `sum()`
- No label GROUP BY clique em `time($__interval)` e então em `remove` para removê-lo
- Clique no ` + ` e então `tag(pais::tag)`
- Se você clicar no ícone de lápis à direita, verá a seguinte query:

```
SELECT "Quantity" FROM "pedidos" WHERE ("produto"::tag = 'CELULAR') AND $timeFilter GROUP BY "pais"::tag
```

- Clique em "Run query"
- Escolha o período "Last 5 minutes"
- Clique em "Add to dashboard"
- No modal que se abrirá informe "New dashboard" e clique em "Open dashboard"
- Clique em "Save dashboard" e informe "Vendas" como nome do mesmo.
