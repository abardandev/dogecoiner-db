CREATE TABLE dbo.Transactions
(
	TransactionId BIGINT PRIMARY KEY IDENTITY(1,1),
	PortfolioId BIGINT NOT NULL,
	Symbol VARCHAR(20) NOT NULL,
	TransactionType VARCHAR(4) NOT NULL DEFAULT 'BUY',
	Quantity DECIMAL(24, 12) NOT NULL,
	Price DECIMAL(24, 12) NOT NULL,
	TimestampUtc DATETIME2 NOT NULL,
	CreatedUtc DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
	ModifiedUtc DATETIME2
    CONSTRAINT Type_Enum CHECK (TransactionType IN ('BUY', 'SELL', 'TIN', 'TOUT')),
	CONSTRAINT FK_Transactions_Portfolios FOREIGN KEY (PortfolioId) REFERENCES Portfolios (PortfolioId)
);
