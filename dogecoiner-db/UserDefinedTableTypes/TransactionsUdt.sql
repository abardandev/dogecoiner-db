CREATE TYPE dbo.TransactionsUdt AS TABLE
(
	RowId INT NOT NULL,
	TransactionId BIGINT NULL,
	PortfolioId BIGINT NOT NULL,
	Symbol VARCHAR(20) NOT NULL,
	TransactionType VARCHAR(4) NOT NULL 
		CHECK (TransactionType IN ('BUY', 'SELL', 'TIN', 'TOUT')) DEFAULT 'BUY',
	Quantity DECIMAL(24, 12) NOT NULL,
	Price DECIMAL(24, 12) NOT NULL,
	TimestampUtc DATETIME2 NOT NULL
)