CREATE TYPE dbo.PortfoliosUdt AS TABLE
(
	PortfolioId BIGINT NULL,
	UserId BIGINT NOT NULL,
	PortfolioName NVARCHAR(150)
);
