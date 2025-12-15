CREATE PROCEDURE dbo.UpsertKLineItems
	@KlineItems dbo.KLinesUdt READONLY
AS
/*
MERGEs kline data
*/
MERGE INTO KLines AS t
USING @KlineItems AS s
ON 
    s.Symbol = t.Symbol
    AND s.Interval = t.Interval
    AND s.TimestampUtc = t.TimestampUtc

WHEN NOT MATCHED BY TARGET THEN
INSERT
(
    Symbol,
    Interval,
    TimestampUtc,
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
    s.TimestampUtc,
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
    INSERTED.KLineId, 
    INSERTED.Symbol, 
    INSERTED.Interval, 
    INSERTED.TimestampUtc;

RETURN 0
