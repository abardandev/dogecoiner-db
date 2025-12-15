CREATE PROCEDURE dbo.UpsertUsers
	@Users dbo.UsersUdt READONLY
AS
/*
MERGEs user data
*/
MERGE INTO Users AS t
USING @Users AS s
ON 
    s.UserId = t.UserId

WHEN NOT MATCHED BY TARGET THEN
INSERT
(
    Username,
    IsRegistered
)
VALUES
(
    s.Username,
    s.IsRegistered
)
    
WHEN MATCHED THEN 
UPDATE SET
    t.Username = s.Username,
    t.IsRegistered = s.IsRegistered

OUTPUT 
    $action, 
    INSERTED.UserId,
    INSERTED.Username;

RETURN 0
