CREATE PROCEDURE dbo.UpsertKLineItems
	@KlineItems KLineItem READONLY
AS

MERGE INTO KLines AS t
USING @KlineItems AS s
ON 
    s.Symbol = t.Symbol
    AND s.Interval = t.Interval
    AND s.[Timestamp] = t.[Timestamp]

WHEN NOT MATCHED BY TARGET THEN
INSERT
(
    Symbol,
    Interval,
    [Timestamp],
    OpenPrice,
    HighPrice,
    LowPrice,
    ClosePrice,
    Volume
)
VALUES
(
    s.Symbol,
    s.Interval,
    s.[Timestamp],
    s.OpenPrice,
    s.HighPrice,
    s.LowPrice,
    s.ClosePrice,
    s.Volume
)
    
WHEN MATCHED THEN 
UPDATE SET
    t.OpenPrice = s.OpenPrice,
    t.HighPrice = s.HighPrice,
    t.LowPrice = s.LowPrice,
    t.ClosePrice = s.ClosePrice,
    t.Volume = s.Volume

OUTPUT 
    $action, 
    INSERTED.ID, 
    INSERTED.Symbol, 
    INSERTED.Interval, 
    INSERTED.[Timestamp];

RETURN 0
