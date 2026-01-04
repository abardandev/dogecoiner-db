/* 
* JWT token claims
* This table allows SSO token revokation
*/
CREATE TABLE dbo.UserSessions
(
	UserSessionId BIGINT PRIMARY KEY IDENTITY(1,1),
	Sub UNIQUEIDENTIFIER NOT NULL,
	-- jti claim - the token's uid
	JwtId UNIQUEIDENTIFIER NOT NULL,
	-- iat claim - issued at ts
	Issued DATETIME2 NOT NULL,
	-- exp claim - expiration ts
	Expiration DATETIME2 NOT NULL,
	-- for SSO, revoke the token before exp
	RevokedUtc DATETIME2 NULL,
	CreatedUtc DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
	ModifiedUtc DATETIME2,
	CONSTRAINT FK_UserSessions_Users FOREIGN KEY (Sub) REFERENCES Users (Sub)
);