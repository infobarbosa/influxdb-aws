### Queries Flux

```
from(bucket: "default")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "invoices")
  |> filter(fn: (r) => r["_field"] == "Quantity")
  |> group(columns: ["Country"])
  |> aggregateWindow(every: v.windowPeriod, fn: sum, createEmpty: false)
  |> yield(name: "sum")
```

```
from(bucket: "default")
  |> range(start: v.timeRangeStart, stop:v.timeRangeStop)
  |> filter(fn: (r) =>
    r._measurement == "invoices" and
    r._field == "UnitPrice" and
    r.Country == "Australia" and
    r.Description == "20 DOLLY PEGS RETROSPOT"
  )
  |> yield()
```

```
from(bucket: "default")
  |> range(start: v.timeRangeStart, stop:v.timeRangeStop)
  |> filter(fn: (r) =>
    r._measurement == "invoices" and
    r._field == "UnitPrice" and
    r.Description == "20 DOLLY PEGS RETROSPOT"
  )
  |> yield()
```

```
from(bucket: "default")
  |> range(start: v.timeRangeStart, stop:v.timeRangeStop)
  |> window(every: 5m)
  |> filter(fn: (r) =>
    r._measurement == "invoices" and
    r._field == "UnitPrice" and
    r.Description == "20 DOLLY PEGS RETROSPOT"
  )
  |> yield()  
```

```
from(bucket: "default")
  |> range(start: -2h)
  |> window(every: 10m)
  |> filter(fn: (r) =>
    r._measurement == "invoices" and
    r._field == "UnitPrice" and
    r.Description == "20 DOLLY PEGS RETROSPOT"
  )
  |> yield()  
```

```
from(bucket: "default")
  |> range(start: -3h)
  |> filter(fn: (r) => r["_measurement"] == "invoices")
  |> group(columns: ["_measurement", "Country"])
  |> aggregateWindow(every: 1h, fn: sum, createEmpty: false)
  |> yield(name: "sum")
```

```
from(bucket: "default")
  |> range(start: -3h)
  |> filter(fn: (r) => r["_measurement"] == "invoices" and
      r._field == "UnitPrice" and
    r.Description == "20 DOLLY PEGS RETROSPOT"
  )
  |> group(columns: ["_measurement", "Country"])
  |> aggregateWindow(every: 1h, fn: sum, createEmpty: false)
  |> yield(name: "sum")
```