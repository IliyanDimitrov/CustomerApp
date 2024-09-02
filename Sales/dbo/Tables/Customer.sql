CREATE TABLE [dbo].[Customer]
(
    [CustomerID]    INT                 IDENTITY(1,1) NOT NULL,
    [FirstName]     NVARCHAR(50)        NOT NULL,
    [LastName]      NVARCHAR(50)        NOT NULL,
    [Email]         NVARCHAR(100)       NOT NULL,
    [Phone]         NVARCHAR(20)        NULL,
    [Postcode]      NVARCHAR(10)        NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    CONSTRAINT [UQ_Customer_Email] UNIQUE NONCLUSTERED ([Email] ASC)
)
GO

-- Create index on Postcode for faster lookups
CREATE NONCLUSTERED INDEX [IX_Customer_Postcode] ON [dbo].[Customer] ([Postcode] ASC)