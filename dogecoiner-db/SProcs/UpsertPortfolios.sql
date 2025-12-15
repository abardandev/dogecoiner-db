CREATE PROCEDURE dbo.UpsertPortfolios
	@Portfolios dbo.PortfoliosUdt READONLY
AS
/*
MERGEs user data
*/
MERGE INTO Portfolios AS t
USING @Portfolios AS s
ON 
    s.PortfolioId = t.PortfolioId
    AND s.UserId = t.UserId

WHEN NOT MATCHED BY TARGET THEN
INSERT
(
    UserId,
    PortfolioName
)
VALUES
(
    s.UserId,
    s.PortfolioName
)
    
WHEN MATCHED THEN 
UPDATE SET
    t.PortfolioName = s.PortfolioName,
    t.ModifiedUtc = GETUTCDATE()

OUTPUT 
    $action,
    INSERTED.PortfolioId,
    INSERTED.UserId,
    INSERTED.PortfolioName;

RETURN 0
