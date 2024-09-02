CREATE PROCEDURE [dbo].[sp_SelectProductsByDescription]
    @Description NVARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Product
    WHERE Description LIKE '%' + @Description + '%'
END
