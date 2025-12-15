/*
Returns KLine keys with IDs when they exist. 
If ID is null, you know it doesn't exist.
*/
CREATE PROCEDURE dbo.GetKLineKeys
	@KLineKeys dbo.KLineKeysUdt READONLY
AS
	SELECT
		kl.KLineId,
		kl.Symbol,
		kl.Interval,
		kl.TimestampUtc
	FROM @KLineKeys klk
	LEFT OUTER JOIN KLines kl 
		ON kl.Interval = klk.Interval
		AND kl.Symbol = klk.Symbol
		AND kl.TimestampUtc = klk.TimestampUtc
RETURN 0
