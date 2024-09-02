CREATE TABLE [dbo].[Order]
(
    [OrderID]       INT                 IDENTITY(1,1) NOT NULL,
    [CustomerID]    INT                 NOT NULL,
    [OrderDate]     DATETIME2           NOT NULL DEFAULT GETDATE(),
    [TotalAmount]   DECIMAL(10, 2)      NOT NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [FK_Order_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID])
)