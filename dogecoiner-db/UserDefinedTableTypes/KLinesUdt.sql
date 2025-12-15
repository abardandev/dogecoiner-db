CREATE TYPE dbo.KLinesUdt AS TABLE
(
	KLineId BIGINT NULL,
    Symbol VARCHAR(20) NOT NULL,
    Interval VARCHAR(1) NOT NULL,
    TimestampUtc DATETIME2 NOT NULL,
    OpenPrice DECIMAL(24, 12) NOT NULL,
    HighPrice DECIMAL(24, 12) NOT NULL,
    LowPrice DECIMAL(24, 12) NOT NULL,
    ClosePrice DECIMAL(24, 12) NOT NULL,
    Volume DECIMAL(24, 8) NOT NULL,
    UNIQUE (Symbol, Interval, TimestampUtc)
)