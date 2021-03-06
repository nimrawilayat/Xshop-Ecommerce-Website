/****** Object:  ForeignKey [FK_OrderDetail_Orders]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Orders]
GO
/****** Object:  ForeignKey [FK_ShoppingCart_Product]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShoppingCart_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShoppingCart]'))
ALTER TABLE [dbo].[ShoppingCart] DROP CONSTRAINT [FK_ShoppingCart_Product]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartUpdateItem]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartUpdateItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShoppingCartUpdateItem]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateOrder]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartAddItem]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartAddItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShoppingCartAddItem]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetItems]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartGetItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShoppingCartGetItems]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetTotalAmount]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartGetTotalAmount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShoppingCartGetTotalAmount]
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartRemoveItem]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartRemoveItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShoppingCartRemoveItem]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCart]') AND type in (N'U'))
DROP TABLE [dbo].[ShoppingCart]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product]') AND type in (N'U'))
DROP TABLE [dbo].[product]
GO
/****** Object:  Default [DF_Orders_DateCreated]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Orders_DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Orders_DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF_Orders_DateCreated]
END


End
GO
/****** Object:  Default [DF_Orders_Verified]    Script Date: 11/06/2016 11:54:36 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Orders_Verified]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Orders_Verified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [DF_Orders_Verified]
END


End
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[product](
	[pid] [int] NOT NULL,
	[pname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [money] NULL,
	[description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stockquantity] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[product] ([pid], [pname], [image], [price], [description], [stockquantity]) VALUES (1, N'Ladies Suit', N'1.jpg', 1500.0000, N'The Purple dress with Light Embroidery. Have Shirt, Trouser, Dupatta.', 20)
INSERT [dbo].[product] ([pid], [pname], [image], [price], [description], [stockquantity]) VALUES (2, N'Kurti', N'2.jpg', 2000.0000, N'This is the Blue kurti with an embroidery on neck and back.', 50)
INSERT [dbo].[product] ([pid], [pname], [image], [price], [description], [stockquantity]) VALUES (3, N'Top', N'3.jpg', 1000.0000, N'The western style Top.', 10)
/****** Object:  Table [dbo].[Orders]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateShipped] [smalldatetime] NULL,
	[Verified] [bit] NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerEmail] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShippingAddress] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Status], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (1, CAST(0xA6B60090 AS SmallDateTime), NULL, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[ProductName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [ProductName]) VALUES (1, 1, 3, N'Ladies Suit')
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [ProductName]) VALUES (1, 2, 3, N'Kurti')
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [ProductName]) VALUES (1, 3, 1, N'Top')
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShoppingCart](
	[ProductID] [int] NOT NULL,
	[CartID] [char](36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Quantity] [int] NULL,
	[DateAdded] [smalldatetime] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CartID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[ShoppingCart] ([ProductID], [CartID], [Quantity], [DateAdded]) VALUES (3, N'1424bd50-8924-4f84-87a7-af448231322f', 1, CAST(0xA6B5055D AS SmallDateTime))
INSERT [dbo].[ShoppingCart] ([ProductID], [CartID], [Quantity], [DateAdded]) VALUES (3, N'2b105c7a-d5aa-4729-ad26-1c19e261706d', 1, CAST(0xA6B5055F AS SmallDateTime))
/****** Object:  StoredProcedure [dbo].[ShoppingCartRemoveItem]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartRemoveItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ShoppingCartRemoveItem]
(@CartID char(36),
@ProductID int)
AS
DELETE FROM ShoppingCart
WHERE CartID = @CartID and ProductID = @ProductID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetTotalAmount]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartGetTotalAmount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ShoppingCartGetTotalAmount]
(@CartID char(36))
AS
SELECT ISNULL(SUM(product.price * ShoppingCart.Quantity), 0)
FROM ShoppingCart INNER JOIN product
ON ShoppingCart.ProductID = product.pid
WHERE ShoppingCart.CartID = @CartID

/*ShoppingCartGetTotalAmount returns the total value of the products in the shopping cart. This
is called when displaying the total amount for the shopping cart.*/

/*The ISNULL method is used to return 0 instead of a NULL total amount (this happens if the shopping
cart is empty). You must do this because the business tier expects to receive a numerical value as the amount.*/' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetItems]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartGetItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ShoppingCartGetItems]
(@CartID char(36))
AS
SELECT product.pid, product.pname, 
product.price, ShoppingCart.Quantity,product.price * ShoppingCart.Quantity AS Subtotal
FROM ShoppingCart INNER JOIN product
ON ShoppingCart.ProductID = product.pid
WHERE ShoppingCart.CartID = @CartID




/*Subtotal is a computed column. It doesn’t exist in any of the tables you joined, but it’s generated
using a formula, which in this case is the price of the product multiplied by its quantity. When sending back
the results, Subtotal is regarded as a separate column.*/

' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartAddItem]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartAddItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Procedure [dbo].[ShoppingCartAddItem]
(@CartID char(36),
@ProductID int)
AS
IF EXISTS
(SELECT CartID
FROM ShoppingCart
WHERE ProductID = @ProductID AND CartID = @CartID)
UPDATE ShoppingCart
SET Quantity = Quantity + 1
WHERE ProductID = @ProductID AND CartID = @CartID
ELSE
IF EXISTS (SELECT pname FROM product WHERE pid=@ProductID)
INSERT INTO ShoppingCart (CartID, ProductID, Quantity, DateAdded)
VALUES (@CartID, @ProductID, 1, GETDATE())' 
END
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CreateOrder]
(@CartID char(36))
AS
/* Insert a new record into Orders */
DECLARE @OrderID int
INSERT INTO Orders DEFAULT VALUES
/* Save the new Order ID */
SET @OrderID = @@IDENTITY
/* Add the order details to OrderDetail */
INSERT INTO OrderDetail
(OrderID, ProductID, ProductName, Quantity, UnitCost)
SELECT
@OrderID, product.pid, product.pname,
ShoppingCart.Quantity, product.price
FROM product JOIN ShoppingCart
ON product.pid = ShoppingCart.ProductID
WHERE ShoppingCart.CartID = @CartID
/* Clear the shopping cart */
DELETE FROM ShoppingCart
WHERE CartID = @CartID
/* Return the Order ID */
SELECT @OrderID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartUpdateItem]    Script Date: 11/06/2016 11:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCartUpdateItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Procedure [dbo].[ShoppingCartUpdateItem]
(@CartID char(36),
@ProductID int,
@Quantity int)
AS
IF @Quantity <= 0
EXEC ShoppingCartRemoveItem @CartID, @ProductID
ELSE
UPDATE ShoppingCart
SET Quantity = @Quantity, DateAdded = GETDATE()
WHERE ProductID = @ProductID AND CartID = @CartID' 
END
GO
/****** Object:  Default [DF_Orders_DateCreated]    Script Date: 11/06/2016 11:54:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Orders_DateCreated]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Orders_DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END


End
GO
/****** Object:  Default [DF_Orders_Verified]    Script Date: 11/06/2016 11:54:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Orders_Verified]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Orders_Verified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Verified]  DEFAULT ((0)) FOR [Verified]
END


End
GO
/****** Object:  ForeignKey [FK_OrderDetail_Orders]    Script Date: 11/06/2016 11:54:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
/****** Object:  ForeignKey [FK_ShoppingCart_Product]    Script Date: 11/06/2016 11:54:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShoppingCart_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShoppingCart]'))
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([pid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShoppingCart_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShoppingCart]'))
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Product]
GO
