/*
Returns KLine keys with IDs when they exist. 
If ID is null, you know it doesn't exist.
*/
CREATE PROCEDURE dbo.GetKLineKeys
	@KLineKeys dbo.KLineKey READONLY
AS
	SELECT
		kl.ID,
		kl.Symbol,
		kl.Interval,
		kl.[Timestamp]
	FROM @KLineKeys klk
	LEFT OUTER JOIN KLines kl 
		ON kl.Interval = klk.Interval
		AND kl.Symbol = klk.Symbol
		AND kl.[Timestamp] = klk.[Timestamp]
RETURN 0
