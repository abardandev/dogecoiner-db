CREATE PROCEDURE dbo.UpsertTransactions
	@Transactions dbo.TransactionsUdt READONLY
AS
/*
MERGEs portfolio transaction data
*/
MERGE INTO Transactions AS t
USING @Transactions AS s
ON
    s.TransactionId = t.TransactionId
    AND s.PortfolioId = t.PortfolioId
    AND s.Symbol = t.Symbol

WHEN NOT MATCHED BY TARGET THEN
INSERT
(
    PortfolioId,
    Symbol,
    TransactionType,
    Quantity,
    Price,
    TimestampUtc
)
VALUES
(
    s.PortfolioId,
    s.Symbol,
    s.TransactionType,
    s.Quantity,
    s.Price,
    s.TimestampUtc
)
    
WHEN MATCHED THEN 
UPDATE SET
    -- don't allow changing a transaction's PorfolioId or Symbol
    t.TransactionType = s.TransactionType,
    t.Quantity = s.Quantity,
    t.Price = s.Price,
    t.TimestampUtc = s.TimestampUtc,
    t.ModifiedUtc = GETUTCDATE()

OUTPUT 
    $action, 
    INSERTED.TransactionId, 
    INSERTED.PortfolioId,
    INSERTED.Symbol,
    INSERTED.TransactionType,
    INSERTED.Quantity,
    INSERTED.Price,
    INSERTED.TimestampUtc;

RETURN 0
