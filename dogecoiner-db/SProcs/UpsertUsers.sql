CREATE PROCEDURE dbo.UpsertUsers
	@Users dbo.UsersUdt READONLY
AS
/*
MERGEs user data
*/
MERGE INTO Users AS t
USING @Users AS s
ON
    s.Email = t.Email

WHEN NOT MATCHED BY TARGET THEN
INSERT
(
    Email,
    FirstName,
    LastName,
    Picture,
    ProviderSub,
    ProviderName
)
VALUES
(
    s.Email,
    s.FirstName,
    s.LastName,
    s.Picture,
    s.ProviderSub,
    s.ProviderName
)

WHEN MATCHED THEN
UPDATE SET
    t.Email = s.Email,
    t.FirstName = s.FirstName,
    t.LastName = s.LastName,
    t.Picture = s.Picture,
    t.ProviderSub = s.ProviderSub,
    t.ProviderName = s.ProviderName,
    t.ModifiedUtc = GETUTCDATE()

OUTPUT
    $action,
    INSERTED.UserId,
    INSERTED.Email;

RETURN 0
