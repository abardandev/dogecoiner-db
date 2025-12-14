This is the database that stores crypto price history and user portfolios.

```mermaid
erDiagram
    KL[KLINES] {
        string Symbol
        string Interval
        date Timestamp
        decimal OpenPrice
        decimal HighPrice
        decimal LowPrice
        decimal ClosePrice
        decimal Volume
    }
```