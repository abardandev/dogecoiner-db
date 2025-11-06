CREATE TYPE dbo.KLineKey AS TABLE
(
	ID BIGINT NULL,
    Symbol VARCHAR(20) NOT NULL,
    Interval VARCHAR(1) NOT NULL,
    [Timestamp] DATETIME2 NOT NULL,
    UNIQUE (Symbol, Interval, [Timestamp])
)