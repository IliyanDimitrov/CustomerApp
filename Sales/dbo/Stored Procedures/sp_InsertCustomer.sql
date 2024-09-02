CREATE PROCEDURE [dbo].[sp_InsertCustomer]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(20) = NULL,
    @Postcode NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Customer] (FirstName, LastName, Email, Phone, Postcode)
    VALUES (@FirstName, @LastName, @Email, @Phone, @Postcode);

    SELECT SCOPE_IDENTITY() AS CustomerID;
END