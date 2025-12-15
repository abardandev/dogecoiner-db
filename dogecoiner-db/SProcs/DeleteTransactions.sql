CREATE PROCEDURE dbo.DeleteTransactions
	@TransactionIds dbo.IdsUdt READONLY
AS
	DELETE t
	FROM Transactions t
	INNER JOIN @TransactionIds ids 
		ON ids.Id = t.TransactionId
RETURN 0
