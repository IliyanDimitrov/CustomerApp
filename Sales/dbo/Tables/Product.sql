CREATE TABLE [dbo].[Product]
(
    [ProductID]     INT                 IDENTITY(1,1) NOT NULL,
    [ProductName]   NVARCHAR(100)       NOT NULL,
    [Description]   NVARCHAR(250)       NULL,
    [Price]         DECIMAL(10, 2)      NOT NULL,
    [StockQuantity] INT                 NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductID] ASC)
)
GO
-- Create index for Description for faster lookups
CREATE NONCLUSTERED INDEX [IX_Product_Description] ON [dbo].[Product] ([Description]) 
GO