CREATE TABLE [dbo].[OrderProduct]
(
    [OrderID]       INT                 NOT NULL,
    [ProductID]     INT                 NOT NULL,
    [Quantity]      INT                 NOT NULL,
    [UnitPrice]     DECIMAL(10, 2)      NOT NULL,
    CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Order] ([OrderID]),
    CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Product] ([ProductID])
)