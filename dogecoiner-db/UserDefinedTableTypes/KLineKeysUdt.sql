CREATE TYPE dbo.KLineKeysUdt AS TABLE
(
	KLineId BIGINT NULL,
    Symbol VARCHAR(20) NOT NULL,
    Interval VARCHAR(1) NOT NULL,
    TimestampUtc DATETIME2 NOT NULL,
    UNIQUE (Symbol, Interval, TimestampUtc)
)