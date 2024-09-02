CREATE PROCEDURE [dbo].[sp_SelectCustomer]
    @CustomerID INT = NULL,
    @Postcode NVARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @CustomerID IS NOT NULL
    BEGIN
        SELECT CustomerID, FirstName, LastName, Email, Phone, Postcode
        FROM [dbo].[Customer]
        WHERE CustomerID = @CustomerID;
    END
    ELSE IF @Postcode IS NOT NULL
    BEGIN
        SELECT CustomerID, FirstName, LastName, Email, Phone, Postcode
        FROM [dbo].[Customer]
        WHERE Postcode = @Postcode;
    END
    ELSE
    BEGIN
        RAISERROR('Either CustomerID or Postcode must be provided.', 16, 1);
        RETURN;
    END
END