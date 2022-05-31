
-- CREATE DATABASE MANUALLY: Northwind

/****** Object: Table [dbo].[Categories] Script Date: 2014-04-01 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
    [CategoryID] [int] IDENTITY(1,1) NOT NULL,
    [CategoryName] [nvarchar](50) NOT NULL,
    [Description] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
    [CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [dbo].[Customers] Script Date: 2014-04-01 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
    [CustomerID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerName] [nvarchar](50) NOT NULL,
    [ContactName] [nvarchar](50) NULL,
    [Address] [nvarchar](60) NULL,
    [City] [nvarchar](15) NULL,
    [PostalCode] [nvarchar](15) NULL,
    [Country] [nvarchar](15) NULL,
 CONSTRAINT [PK_Customers1] PRIMARY KEY CLUSTERED 
(
    [CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[Employees] Script Date: 2014-04-01 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
    [EmployeeID] [int] IDENTITY(1,1) NOT NULL,
    [LastName] [nvarchar](50) NOT NULL,
    [FirstName] [nvarchar](50) NOT NULL,
    [birthDate] [datetime] NULL,
    [Photo] [nvarchar](50) NULL,
    [Notes] [ntext] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
    [EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [CK_Birthdate] CHECK  (([birthDate]<getdate()))
GO

ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Birthdate]
GO

/****** Object: Table [dbo].[shippers] Script Date: 2014-04-01 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shippers](
    [shipperID] [int] IDENTITY(1,1) NOT NULL,
    [shipperName] [nvarchar](50) NOT NULL,
    [Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
    [shipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object: Table [dbo].[Orders] Script Date: 2014-04-01 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
    [OrderID] [int] IDENTITY(1,1) NOT NULL,
    [CustomerID] [int] NULL,
    [EmployeeID] [int] NULL,
    [OrderDate] [datetime] NULL,
    [shipperID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
    [OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO

ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO

ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([shipperID])
REFERENCES [dbo].[shippers] ([shipperID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO

/****** Object: Table [dbo].[suppliers] Script Date: 2014-04-01 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
    [supplierID] [int] IDENTITY(1,1) NOT NULL,
    [supplierName] [nvarchar](50) NOT NULL,
    [ContactName] [nvarchar](50) NULL,
    [Address] [nvarchar](60) NULL,
    [City] [nvarchar](15) NULL,
    [PostalCode] [nvarchar](15) NULL,
    [Country] [nvarchar](15) NULL,
    [Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_Suppliers1] PRIMARY KEY CLUSTERED 
(
    [supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object: Table [dbo].[Products] Script Date: 2014-04-01 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
    [ProductID] [int] IDENTITY(1,1) NOT NULL,
    [ProductName] [nvarchar](50) NOT NULL,
    [supplierID] [int] NULL,
    [CategoryID] [int] NULL,
    [unit] [nvarchar](50) NULL,
    [Price] [money] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
    [ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO

ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO

ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([supplierID])
REFERENCES [dbo].[suppliers] ([supplierID])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO

ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([Price]>=(0)))
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitPrice]
GO

/****** Object: Table [dbo].[OrderDetails] Script Date: 2014-04-01 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
    [OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
    [OrderID] [int] NOT NULL,
    [ProductID] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
    [OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO

ALTER TABLE [dbo].[OrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO

ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO

ALTER TABLE [dbo].[OrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO

ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Order_Details_Products]
GO

ALTER TABLE [dbo].[OrderDetails]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
GO

ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [CK_Quantity]
GO
/****** Inserting Tables ******/
SET IDENTITY_INSERT [dbo].[Categories] ON
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Beverages ', N'Soft drinks, coffees, teas, beers, and ales ')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Condiments ', N'Sweet and savory sauces, relishes, spreads, and seasonings ')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Confections ', N'Desserts, candies, and sweet breads ')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Dairy Products ', N'Cheeses ')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Grains/Cereals ', N'Breads, crackers, pasta, and cereal ')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Meat/Poultry ', N'Prepared meats ')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (7, N'Produce ', N'Dried fruit and bean curd ')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (8, N'Seafood ', N'Seaweed and fish ')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO

SET IDENTITY_INSERT [dbo].[Customers] ON
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (1, N'Alfreds Futterkiste ', N'Maria Anders ', N'Obere Str. 57 ', N'Berlin ', N'12209 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (2, N'Ana Trujillo Emparedados y helados ', N'Ana Trujillo ', N'Avda. de la Constitución 2222 ', N'México D.F. ', N'05021 ', N'Mexico ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (3, N'Antonio Moreno Taquería ', N'Antonio Moreno ', N'Mataderos 2312 ', N'México D.F. ', N'05023 ', N'Mexico ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (4, N'Around the Horn ', N'Thomas Hardy ', N'120 Hanover Sq. ', N'London ', N'WA1 1DP ', N'UK ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (5, N'Berglunds snabbköp ', N'Christina Berglund ', N'Berguvsvägen 8 ', N'Luleå ', N'S-958 22 ', N'Sweden ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (6, N'Blauer See Delikatessen ', N'Hanna Moos ', N'Forsterstr. 57 ', N'Mannheim ', N'68306 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (7, N'Blondel père et fils ', N'Frédérique Citeaux ', N'24, place Kléber ', N'Strasbourg ', N'67000 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (8, N'Bólido Comidas preparadas ', N'Martín Sommer ', N'C/ Araquil, 67 ', N'Madrid ', N'28023 ', N'Spain ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (9, N'Bon app'' ', N'Laurence Lebihans ', N'12, rue des Bouchers ', N'Marseille ', N'13008 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (10, N'Bottom-Dollar Marketse ', N'Elizabeth Lincoln ', N'23 Tsawassen Blvd. ', N'Tsawassen ', N'T2F 8M4 ', N'Canada ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (11, N'B''s Beverages ', N'Victoria Ashworth ', N'Fauntleroy Circus ', N'London ', N'EC2 5NT ', N'UK ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (12, N'Cactus Comidas para llevar ', N'Patricio Simpson ', N'Cerrito 333 ', N'Buenos Aires ', N'1010 ', N'Argentina ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (13, N'Centro comercial Moctezuma ', N'Francisco Chang ', N'Sierras de Granada 9993 ', N'México D.F. ', N'05022 ', N'Mexico ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (14, N'Chop-suey Chinese ', N'Yang Wang ', N'Hauptstr. 29 ', N'Bern ', N'3012 ', N'Switzerland ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (15, N'Comércio Mineiro ', N'Pedro Afonso ', N'Av. dos Lusíadas, 23 ', N'São Paulo ', N'05432-043 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (16, N'Consolidated Holdings ', N'Elizabeth Brown ', N'Berkeley Gardens 12 Brewery ', N'London ', N'WX1 6LT ', N'UK ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (17, N'Drachenblut Delikatessend ', N'Sven Ottlieb ', N'Walserweg 21 ', N'Aachen ', N'52066 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (18, N'Du monde entier ', N'Janine Labrune ', N'67, rue des Cinquante Otages ', N'Nantes ', N'44000 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (19, N'Eastern Connection ', N'Ann Devon ', N'35 King George ', N'London ', N'WX3 6FW ', N'UK ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (20, N'Ernst Handel ', N'Roland Mendel ', N'Kirchgasse 6 ', N'Graz ', N'8010 ', N'Austria ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (21, N'Familia Arquibaldo ', N'Aria Cruz ', N'Rua Orós, 92 ', N'São Paulo ', N'05442-030 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (22, N'FISSA Fabrica Inter. Salchichas S.A. ', N'Diego Roel ', N'C/ Moralzarzal, 86 ', N'Madrid ', N'28034 ', N'Spain ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (23, N'Folies gourmandes ', N'Martine Rancé ', N'184, chaussée de Tournai ', N'Lille ', N'59000 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (24, N'Folk och fä HB ', N'Maria Larsson ', N'Åkergatan 24 ', N'Bräcke ', N'S-844 67 ', N'Sweden ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (25, N'Frankenversand ', N'Peter Franken ', N'Berliner Platz 43 ', N'München ', N'80805 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (26, N'France restauration ', N'Carine Schmitt ', N'54, rue Royale ', N'Nantes ', N'44000 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (27, N'Franchi S.p.A. ', N'Paolo Accorti ', N'Via Monte Bianco 34 ', N'Torino ', N'10100 ', N'Italy ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (28, N'Furia Bacalhau e Frutos do Mar ', N'Lino Rodriguez ', N'Jardim das rosas n. 32 ', N'Lisboa ', N'1675 ', N'Portugal ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (29, N'Galería del gastrónomo ', N'Eduardo Saavedra ', N'Rambla de Cataluña, 23 ', N'Barcelona ', N'08022 ', N'Spain ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (30, N'Godos Cocina Típica ', N'José Pedro Freyre ', N'C/ Romero, 33 ', N'Sevilla ', N'41101 ', N'Spain ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (31, N'Gourmet Lanchonetes ', N'André Fonseca ', N'Av. Brasil, 442 ', N'Campinas ', N'04876-786 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (32, N'Great Lakes Food Market ', N'Howard Snyder ', N'2732 Baker Blvd. ', N'Eugene ', N'97403 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (33, N'GROSELLA-Restaurante ', N'Manuel Pereira ', N'5ª Ave. Los Palos Grandes ', N'Caracas ', N'1081 ', N'Venezuela ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (34, N'Hanari Carnes ', N'Mario Pontes ', N'Rua do Paço, 67 ', N'Rio de Janeiro ', N'05454-876 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (35, N'HILARIÓN-Abastos ', N'Carlos Hernández ', N'Carrera 22 con Ave. Carlos Soublette #8-35 ', N'San Cristóbal ', N'5022 ', N'Venezuela ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (36, N'Hungry Coyote Import Store ', N'Yoshi Latimer ', N'City Center Plaza 516 Main St. ', N'Elgin ', N'97827 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (37, N'Hungry Owl All-Night Grocers ', N'Patricia McKenna ', N'8 Johnstown Road ', N'Cork ', N' ', N'Ireland ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (38, N'Island Trading ', N'Helen Bennett ', N'Garden House Crowther Way ', N'Cowes ', N'PO31 7PJ ', N'UK ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (39, N'Königlich Essen ', N'Philip Cramer ', N'Maubelstr. 90 ', N'Brandenburg ', N'14776 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (40, N'La corne d''abondance ', N'Daniel Tonini ', N'67, avenue de l''Europe ', N'Versailles ', N'78000 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (41, N'La maison d''Asie ', N'Annette Roulet ', N'1 rue Alsace-Lorraine ', N'Toulouse ', N'31000 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (42, N'Laughing Bacchus Wine Cellars ', N'Yoshi Tannamuri ', N'1900 Oak St. ', N'Vancouver ', N'V3F 2K1 ', N'Canada ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (43, N'Lazy K Kountry Store ', N'John Steel ', N'12 Orchestra Terrace ', N'Walla Walla ', N'99362 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (44, N'Lehmanns Marktstand ', N'Renate Messner ', N'Magazinweg 7 ', N'Frankfurt a.M. ', N'60528 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (45, N'Let''s Stop N Shop ', N'Jaime Yorres ', N'87 Polk St. Suite 5 ', N'San Francisco ', N'94117 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (46, N'LILA-Supermercado ', N'Carlos González ', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo ', N'Barquisimeto ', N'3508 ', N'Venezuela ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (47, N'LINO-Delicateses ', N'Felipe Izquierdo ', N'Ave. 5 de Mayo Porlamar ', N'I. de Margarita', N'4980 ', N'Venezuela ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (48, N'Lonesome Pine Restaurant ', N'Fran Wilson ', N'89 Chiaroscuro Rd. ', N'Portland ', N'97219 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (49, N'Magazzini Alimentari Riuniti ', N'Giovanni Rovelli ', N'Via Ludovico il Moro 22 ', N'Bergamo ', N'24100 ', N'Italy ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (50, N'Maison Dewey ', N'Catherine Dewey ', N'Rue Joseph-Bens 532 ', N'Bruxelles ', N'B-1180 ', N'Belgium ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (51, N'Mère Paillarde ', N'Jean Fresnière ', N'43 rue St. Laurent ', N'Montréal ', N'H1J 1C3 ', N'Canada ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (52, N'Morgenstern Gesundkost ', N'Alexander Feuer ', N'Heerstr. 22 ', N'Leipzig ', N'04179 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (53, N'North/South ', N'Simon Crowther ', N'South House 300 Queensbridge ', N'London ', N'SW7 1RZ ', N'UK ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (54, N'Océano Atlántico Ltda. ', N'Yvonne Moncada ', N'Ing. Gustavo Moncada 8585 Piso 20-A ', N'Buenos Aires ', N'1010 ', N'Argentina ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (55, N'Old World Delicatessen ', N'Rene Phillips ', N'2743 Bering St. ', N'Anchorage ', N'99508 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (56, N'Ottilies Käseladen ', N'Henriette Pfalzheim ', N'Mehrheimerstr. 369 ', N'Köln ', N'50739 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (57, N'Paris spécialités ', N'Marie Bertrand ', N'265, boulevard Charonne ', N'Paris ', N'75012 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (58, N'Pericles Comidas clásicas ', N'Guillermo Fernández ', N'Calle Dr. Jorge Cash 321 ', N'México D.F. ', N'05033 ', N'Mexico ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (59, N'Piccolo und mehr ', N'Georg Pipps ', N'Geislweg 14 ', N'Salzburg ', N'5020 ', N'Austria ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (60, N'Princesa Isabel Vinhoss ', N'Isabel de Castro ', N'Estrada da saúde n. 58 ', N'Lisboa ', N'1756 ', N'Portugal ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (61, N'Que Delícia ', N'Bernardo Batista ', N'Rua da Panificadora, 12 ', N'Rio de Janeiro ', N'02389-673 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (62, N'Queen Cozinha ', N'Lúcia Carvalho ', N'Alameda dos Canàrios, 891 ', N'São Paulo ', N'05487-020 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (63, N'QUICK-Stop ', N'Horst Kloss ', N'Taucherstraße 10 ', N'Cunewalde ', N'01307 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (64, N'Rancho grande ', N'Sergio Gutiérrez ', N'Av. del Libertador 900 ', N'Buenos Aires ', N'1010 ', N'Argentina ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (65, N'Rattlesnake Canyon Grocery ', N'Paula Wilson ', N'2817 Milton Dr. ', N'Albuquerque ', N'87110 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (66, N'Reggiani Caseifici ', N'Maurizio Moroni ', N'Strada Provinciale 124 ', N'Reggio Emilia ', N'42100 ', N'Italy ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (67, N'Ricardo Adocicados ', N'Janete Limeira ', N'Av. Copacabana, 267 ', N'Rio de Janeiro ', N'02389-890 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (68, N'Richter Supermarkt ', N'Michael Holz ', N'Grenzacherweg 237 ', N'Genève ', N'1203 ', N'Switzerland ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (69, N'Romero y tomillo ', N'Alejandra Camino ', N'Gran Vía, 1 ', N'Madrid ', N'28001 ', N'Spain ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (70, N'Santé Gourmet ', N'Jonas Bergulfsen ', N'Erling Skakkes gate 78 ', N'Stavern ', N'4110 ', N'Norway ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (71, N'Save-a-lot Markets ', N'Jose Pavarotti ', N'187 Suffolk Ln. ', N'Boise ', N'83720 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (72, N'Seven Seas Imports ', N'Hari Kumar ', N'90 Wadhurst Rd. ', N'London ', N'OX15 4NB ', N'UK ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (73, N'Simons bistro ', N'Jytte Petersen ', N'Vinbæltet 34 ', N'København ', N'1734 ', N'Denmark ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (74, N'Spécialités du monde ', N'Dominique Perrier ', N'25, rue Lauriston ', N'Paris ', N'75016 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (75, N'Split Rail Beer & Ale ', N'Art Braunschweiger ', N'P.O. Box 555 ', N'Lander ', N'82520 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (76, N'Suprêmes délices ', N'Pascale Cartrain ', N'Boulevard Tirou, 255 ', N'Charleroi ', N'B-6000 ', N'Belgium ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (77, N'The Big Cheese ', N'Liz Nixon ', N'89 Jefferson Way Suite 2 ', N'Portland ', N'97201 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (78, N'The Cracker Box ', N'Liu Wong ', N'55 Grizzly Peak Rd. ', N'Butte ', N'59801 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (79, N'Toms Spezialitäten ', N'Karin Josephs ', N'Luisenstr. 48 ', N'Münster ', N'44087 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (80, N'Tortuga Restaurante ', N'Miguel Angel Paolino ', N'Avda. Azteca 123 ', N'México D.F. ', N'05033 ', N'Mexico ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (81, N'Tradição Hipermercados ', N'Anabela Domingues ', N'Av. Inês de Castro, 414 ', N'São Paulo ', N'05634-030 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (82, N'Trail''s Head Gourmet Provisioners ', N'Helvetius Nagy ', N'722 DaVinci Blvd. ', N'Kirkland ', N'98034 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (83, N'Vaffeljernet ', N'Palle Ibsen ', N'Smagsløget 45 ', N'Århus ', N'8200 ', N'Denmark ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (84, N'Victuailles en stock ', N'Mary Saveley ', N'2, rue du Commerce ', N'Lyon ', N'69004 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (85, N'Vins et alcools Chevalier ', N'Paul Henriot ', N'59 rue de l''Abbaye ', N'Reims ', N'51100 ', N'France ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (86, N'Die Wandernde Kuh ', N'Rita Müller ', N'Adenauerallee 900 ', N'Stuttgart ', N'70563 ', N'Germany ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (87, N'Wartian Herkku ', N'Pirkko Koskitalo ', N'Torikatu 38 ', N'Oulu ', N'90110 ', N'Finland ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (88, N'Wellington Importadora ', N'Paula Parente ', N'Rua do Mercado, 12 ', N'Resende ', N'08737-363 ', N'Brazil ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (89, N'White Clover Markets ', N'Karl Jablonski ', N'305 - 14th Ave. S. Suite 3B ', N'Seattle ', N'98128 ', N'USA ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (90, N'Wilman Kala ', N'Matti Karttunen ', N'Keskuskatu 45 ', N'Helsinki ', N'21240 ', N'Finland ')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (91, N'Wolski ', N'Zbyszek ', N'ul. Filtrowa 68 ', N'Walla ', N'01-012 ', N'Poland ')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO

SET IDENTITY_INSERT [dbo].[Employees] ON
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (1, N'Davolio ', N'Nancy ', CAST(0x0000625A00000000 AS DateTime), N'EmpID1.pic ', N'Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of ''Toastmasters International''. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (2, N'Fuller ', N'Andrew ', CAST(0x00004A6100000000 AS DateTime), N'EmpID2.pic ', N'Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (3, N'Leverling ', N'Janet ', CAST(0x00005AD300000000 AS DateTime), N'EmpID3.pic ', N'Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (4, N'Peacock ', N'Margaret ', CAST(0x000053C500000000 AS DateTime), N'EmpID4.pic ', N'Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (5, N'Buchanan ', N'Steven ', CAST(0x00004EB600000000 AS DateTime), N'EmpID5.pic ', N'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses ''Successful Telemarketing'' and ''International Sales Management''. He is fluent in French. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (6, N'Suyama ', N'Michael ', CAST(0x00005A9800000000 AS DateTime), N'EmpID6.pic ', N'Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses ''Multi-Cultural Selling'' and ''Time Management for the Sales Professional''. He is fluent in Japanese and can read and write French, Portuguese, and Spanish. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (7, N'King ', N'Robert ', CAST(0x0000562F00000000 AS DateTime), N'EmpID7.pic ', N'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled ''Selling in Europe'', he was transferred to the London office. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (8, N'Callahan ', N'Laura ', CAST(0x000052C800000000 AS DateTime), N'EmpID8.pic ', N'Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (9, N'Dodsworth ', N'Anne ', CAST(0x0000632800000000 AS DateTime), N'EmpID9.pic ', N'Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German. ')
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [birthDate], [Photo], [Notes]) VALUES (10, N'West ', N'Adam ', CAST(0x000028F800000000 AS DateTime), N'EmpID10.pic ', N'An old chum ')
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO

SET IDENTITY_INSERT [dbo].[shippers] ON
GO
INSERT [dbo].[shippers] ([shipperID], [shipperName], [Phone]) VALUES (1, N'Speedy Express ', N'(503) 555-9831 ')
GO
INSERT [dbo].[shippers] ([shipperID], [shipperName], [Phone]) VALUES (2, N'United Package ', N'(503) 555-3199 ')
GO
INSERT [dbo].[shippers] ([shipperID], [shipperName], [Phone]) VALUES (3, N'Federal Shipping ', N'(503) 555-9931 ')
GO
SET IDENTITY_INSERT [dbo].[shippers] OFF
GO

SET IDENTITY_INSERT [dbo].[Orders] ON
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10248, 90, 5, CAST(0x000089B000000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10249, 81, 6, CAST(0x000089B100000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10250, 34, 4, CAST(0x000089B400000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10251, 84, 3, CAST(0x000089B400000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10252, 76, 4, CAST(0x000089B500000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10253, 34, 3, CAST(0x000089B600000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10254, 14, 5, CAST(0x000089B700000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10255, 68, 9, CAST(0x000089B800000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10256, 88, 3, CAST(0x000089BB00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10257, 35, 4, CAST(0x000089BC00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10258, 20, 1, CAST(0x000089BD00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10259, 13, 4, CAST(0x000089BE00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10260, 55, 4, CAST(0x000089BF00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10261, 61, 4, CAST(0x000089BF00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10262, 65, 8, CAST(0x000089C200000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10263, 20, 9, CAST(0x000089C300000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10264, 24, 6, CAST(0x000089C400000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10265, 7, 2, CAST(0x000089C500000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10266, 87, 3, CAST(0x000089C600000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10267, 25, 4, CAST(0x000089C900000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10268, 33, 8, CAST(0x000089CA00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10269, 89, 5, CAST(0x000089CB00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10270, 87, 1, CAST(0x000089CC00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10271, 75, 6, CAST(0x000089CC00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10272, 65, 6, CAST(0x000089CD00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10273, 63, 3, CAST(0x000089D000000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10274, 85, 6, CAST(0x000089D100000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10275, 49, 1, CAST(0x000089D200000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10276, 80, 8, CAST(0x000089D300000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10277, 52, 2, CAST(0x000089D400000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10278, 5, 8, CAST(0x000089D700000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10279, 44, 8, CAST(0x000089D800000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10280, 5, 2, CAST(0x000089D900000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10281, 69, 4, CAST(0x000089D900000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10282, 69, 4, CAST(0x000089DA00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10283, 46, 3, CAST(0x000089DB00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10284, 44, 4, CAST(0x000089DE00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10285, 63, 1, CAST(0x000089DF00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10286, 63, 8, CAST(0x000089E000000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10287, 67, 8, CAST(0x000089E100000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10288, 66, 4, CAST(0x000089E200000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10289, 11, 7, CAST(0x000089E500000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10290, 15, 8, CAST(0x000089E600000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10291, 61, 6, CAST(0x000089E600000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10292, 81, 1, CAST(0x000089E700000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10293, 80, 1, CAST(0x000089E800000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10294, 65, 4, CAST(0x000089E900000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10295, 85, 2, CAST(0x000089EC00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10296, 46, 6, CAST(0x000089ED00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10297, 7, 5, CAST(0x000089EE00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10298, 37, 6, CAST(0x000089EF00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10299, 67, 4, CAST(0x000089F000000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10300, 49, 2, CAST(0x000089F300000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10301, 86, 8, CAST(0x000089F300000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10302, 76, 4, CAST(0x000089F400000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10303, 30, 7, CAST(0x000089F500000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10304, 80, 1, CAST(0x000089F600000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10305, 55, 8, CAST(0x000089F700000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10306, 69, 1, CAST(0x000089FA00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10307, 48, 2, CAST(0x000089FB00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10308, 2, 7, CAST(0x000089FC00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10309, 37, 3, CAST(0x000089FD00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10310, 77, 8, CAST(0x000089FE00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10311, 18, 1, CAST(0x000089FE00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10312, 86, 2, CAST(0x00008A0100000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10313, 63, 2, CAST(0x00008A0200000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10314, 65, 1, CAST(0x00008A0300000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10315, 38, 4, CAST(0x00008A0400000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10316, 65, 1, CAST(0x00008A0500000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10317, 48, 6, CAST(0x00008A0800000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10318, 38, 8, CAST(0x00008A0900000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10319, 80, 7, CAST(0x00008A0A00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10320, 87, 5, CAST(0x00008A0B00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10321, 38, 3, CAST(0x00008A0B00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10322, 58, 7, CAST(0x00008A0C00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10323, 39, 4, CAST(0x00008A0F00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10324, 71, 9, CAST(0x00008A1000000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10325, 39, 1, CAST(0x00008A1100000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10326, 8, 4, CAST(0x00008A1200000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10327, 24, 2, CAST(0x00008A1300000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10328, 28, 4, CAST(0x00008A1600000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10329, 75, 4, CAST(0x00008A1700000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10330, 46, 3, CAST(0x00008A1800000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10331, 9, 9, CAST(0x00008A1800000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10332, 51, 3, CAST(0x00008A1900000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10333, 87, 5, CAST(0x00008A1A00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10334, 84, 8, CAST(0x00008A1D00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10335, 37, 7, CAST(0x00008A1E00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10336, 60, 7, CAST(0x00008A1F00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10337, 25, 4, CAST(0x00008A2000000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10338, 55, 4, CAST(0x00008A2100000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10339, 51, 2, CAST(0x00008A2400000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10340, 9, 1, CAST(0x00008A2500000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10341, 73, 7, CAST(0x00008A2500000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10342, 25, 4, CAST(0x00008A2600000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10343, 44, 4, CAST(0x00008A2700000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10344, 89, 4, CAST(0x00008A2800000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10345, 63, 2, CAST(0x00008A2B00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10346, 65, 3, CAST(0x00008A2C00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10347, 21, 4, CAST(0x00008A2D00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10348, 86, 4, CAST(0x00008A2E00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10349, 75, 7, CAST(0x00008A2F00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10350, 41, 6, CAST(0x00008A3200000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10351, 20, 1, CAST(0x00008A3200000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10352, 28, 3, CAST(0x00008A3300000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10353, 59, 7, CAST(0x00008A3400000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10354, 58, 8, CAST(0x00008A3500000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10355, 4, 6, CAST(0x00008A3600000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10356, 86, 6, CAST(0x00008A3900000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10357, 46, 1, CAST(0x00008A3A00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10358, 41, 5, CAST(0x00008A3B00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10359, 72, 5, CAST(0x00008A3C00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10360, 7, 4, CAST(0x00008A3D00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10361, 63, 1, CAST(0x00008A3D00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10362, 9, 3, CAST(0x00008A4000000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10363, 17, 4, CAST(0x00008A4100000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10364, 19, 1, CAST(0x00008A4100000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10365, 3, 3, CAST(0x00008A4200000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10366, 29, 8, CAST(0x00008A4300000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10367, 83, 7, CAST(0x00008A4300000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10368, 20, 2, CAST(0x00008A4400000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10369, 75, 8, CAST(0x00008A4700000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10370, 14, 6, CAST(0x00008A4800000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10371, 41, 1, CAST(0x00008A4800000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10372, 62, 5, CAST(0x00008A4900000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10373, 37, 4, CAST(0x00008A4A00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10374, 91, 1, CAST(0x00008A4A00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10375, 36, 3, CAST(0x00008A4B00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10376, 51, 1, CAST(0x00008A4E00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10377, 72, 1, CAST(0x00008A4E00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10378, 24, 5, CAST(0x00008A4F00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10379, 61, 2, CAST(0x00008A5000000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10380, 37, 8, CAST(0x00008A5100000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10381, 46, 3, CAST(0x00008A5100000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10382, 20, 4, CAST(0x00008A5200000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10383, 4, 8, CAST(0x00008A5500000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10384, 5, 3, CAST(0x00008A5500000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10385, 75, 1, CAST(0x00008A5600000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10386, 21, 9, CAST(0x00008A5700000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10387, 70, 1, CAST(0x00008A5700000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10388, 72, 2, CAST(0x00008A5800000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10389, 10, 4, CAST(0x00008A5900000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10390, 20, 6, CAST(0x00008A5C00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10391, 17, 3, CAST(0x00008A5C00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10392, 59, 2, CAST(0x00008A5D00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10393, 71, 1, CAST(0x00008A5E00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10394, 36, 1, CAST(0x00008A5E00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10395, 35, 6, CAST(0x00008A5F00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10396, 25, 1, CAST(0x00008A6000000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10397, 60, 5, CAST(0x00008A6000000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10398, 71, 2, CAST(0x00008A6300000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10399, 83, 8, CAST(0x00008A6400000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10400, 19, 1, CAST(0x00008A6500000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10401, 65, 1, CAST(0x00008A6500000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10402, 20, 8, CAST(0x00008A6600000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10403, 20, 4, CAST(0x00008A6700000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10404, 49, 2, CAST(0x00008A6700000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10405, 47, 1, CAST(0x00008A6A00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10406, 62, 7, CAST(0x00008A6B00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10407, 56, 2, CAST(0x00008A6B00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10408, 23, 8, CAST(0x00008A6C00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10409, 54, 3, CAST(0x00008A6D00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10410, 10, 3, CAST(0x00008A6E00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10411, 10, 9, CAST(0x00008A6E00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10412, 87, 8, CAST(0x00008A7100000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10413, 41, 3, CAST(0x00008A7200000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10414, 21, 2, CAST(0x00008A7200000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10415, 36, 3, CAST(0x00008A7300000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10416, 87, 8, CAST(0x00008A7400000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10417, 73, 4, CAST(0x00008A7400000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10418, 63, 4, CAST(0x00008A7500000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10419, 68, 4, CAST(0x00008A7800000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10420, 88, 3, CAST(0x00008A7900000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10421, 61, 8, CAST(0x00008A7900000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10422, 27, 2, CAST(0x00008A7A00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10423, 31, 6, CAST(0x00008A7B00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10424, 51, 7, CAST(0x00008A7B00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10425, 41, 6, CAST(0x00008A7C00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10426, 29, 4, CAST(0x00008A7F00000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10427, 59, 4, CAST(0x00008A7F00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10428, 66, 7, CAST(0x00008A8000000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10429, 37, 3, CAST(0x00008A8100000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10430, 20, 4, CAST(0x00008A8200000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10431, 10, 4, CAST(0x00008A8200000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10432, 75, 3, CAST(0x00008A8300000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10433, 60, 3, CAST(0x00008A8600000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10434, 24, 3, CAST(0x00008A8600000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10435, 16, 8, CAST(0x00008A8700000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10436, 7, 3, CAST(0x00008A8800000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10437, 87, 8, CAST(0x00008A8800000000 AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10438, 79, 3, CAST(0x00008A8900000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10439, 51, 6, CAST(0x00008A8A00000000 AS DateTime), 3)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10440, 71, 4, CAST(0x00008A8D00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10441, 55, 3, CAST(0x00008A8D00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10442, 20, 3, CAST(0x00008A8E00000000 AS DateTime), 2)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [shipperID]) VALUES (10443, 66, 8, CAST(0x00008A8F00000000 AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO

SET IDENTITY_INSERT [dbo].[suppliers] ON
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (1, N'Exotic Liquid ', N'Charlotte Cooper ', N'49 Gilbert St. ', N'Londona ', N'EC1 4SD ', N'UK ', N'(171) 555-2222 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (2, N'New Orleans Cajun Delights ', N'Shelley Burke ', N'P.O. Box 78934 ', N'New Orleans ', N'70117 ', N'USA ', N'(100) 555-4822 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (3, N'Grandma Kelly''s Homestead ', N'Regina Murphy ', N'707 Oxford Rd. ', N'Ann Arbor ', N'48104 ', N'USA ', N'(313) 555-5735 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (4, N'Tokyo Traders ', N'Yoshi Nagase ', N'9-8 Sekimai Musashino-shi ', N'Tokyo ', N'100 ', N'Japan ', N'(03) 3555-5011 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (5, N'Cooperativa de Quesos ''Las Cabras'' ', N'Antonio del Valle Saavedra ', N'Calle del Rosal 4 ', N'Oviedo ', N'33007 ', N'Spain ', N'(98) 598 76 54 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (6, N'Mayumi''s ', N'Mayumi Ohno ', N'92 Setsuko Chuo-ku ', N'Osaka ', N'545 ', N'Japan ', N'(06) 431-7877 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (7, N'Pavlova, Ltd. ', N'Ian Devling ', N'74 Rose St. Moonie Ponds ', N'Melbourne ', N'3058 ', N'Australia ', N'(03) 444-2343 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (8, N'Specialty Biscuits, Ltd. ', N'Peter Wilson ', N'29 King''s Way ', N'Manchester ', N'M14 GSD ', N'UK ', N'(161) 555-4448 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (9, N'PB Knäckebröd AB ', N'Lars Peterson ', N'Kaloadagatan 13 ', N'Göteborg ', N'S-345 67 ', N'Sweden ', N'031-987 65 43 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (10, N'Refrescos Americanas LTDA ', N'Carlos Diaz ', N'Av. das Americanas 12.890 ', N'São Paulo ', N'5442 ', N'Brazil ', N'(11) 555 4640 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (11, N'Heli Süßwaren GmbH & Co. KG ', N'Petra Winkler ', N'Tiergartenstraße 5 ', N'Berlin ', N'10785 ', N'Germany ', N'(010) 9984510 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (12, N'Plutzer Lebensmittelgroßmärkte AG ', N'Martin Bein ', N'Bogenallee 51 ', N'Frankfurt ', N'60439 ', N'Germany ', N'(069) 992755 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (13, N'Nord-Ost-Fisch Handelsgesellschaft mbH ', N'Sven Petersen ', N'Frahmredder 112a ', N'Cuxhaven ', N'27478 ', N'Germany ', N'(04721) 8713 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (14, N'Formaggi Fortini s.r.l. ', N'Elio Rossi ', N'Viale Dante, 75 ', N'Ravenna ', N'48100 ', N'Italy ', N'(0544) 60323 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (15, N'Norske Meierier ', N'Beate Vileid ', N'Hatlevegen 5 ', N'Sandvika ', N'1320 ', N'Norway ', N'(0)2-953010 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (16, N'Bigfoot Breweries ', N'Cheryl Saylor ', N'3400 - 8th Avenue Suite 210 ', N'Bend ', N'97101 ', N'USA ', N'(503) 555-9931 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (17, N'Svensk Sjöföda AB ', N'Michael Björn ', N'Brovallavägen 231 ', N'Stockholm ', N'S-123 45 ', N'Sweden ', N'08-123 45 67 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (18, N'Aux joyeux ecclésiastiques ', N'Guylène Nodier ', N'203, Rue des Francs-Bourgeois ', N'Paris ', N'75004 ', N'France ', N'(1) 03.83.00.68 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (19, N'New England Seafood Cannery ', N'Robb Merchant ', N'Order Processing Dept. 2100 Paul Revere Blvd. ', N'Boston ', N'02134 ', N'USA ', N'(617) 555-3267 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (20, N'Leka Trading ', N'Chandra Leka ', N'471 Serangoon Loop, Suite #402 ', N'Singapore ', N'0512 ', N'Singapore ', N'555-8787 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (21, N'Lyngbysild ', N'Niels Petersen ', N'Lyngbysild Fiskebakken 10 ', N'Lyngby ', N'2800 ', N'Denmark ', N'43844108 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (22, N'Zaanse Snoepfabriek ', N'Dirk Luchte ', N'Verkoop Rijnweg 22 ', N'Zaandam ', N'9999 ZZ ', N'Netherlands ', N'(12345) 1212 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (23, N'Karkki Oy ', N'Anne Heikkonen ', N'Valtakatu 12 ', N'Lappeenranta ', N'53120 ', N'Finland ', N'(953) 10956 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (24, N'G''day, Mate ', N'Wendy Mackenzie ', N'170 Prince Edward Parade Hunter''s Hill ', N'Sydney ', N'2042 ', N'Australia ', N'(02) 555-5914 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (25, N'Ma Maison ', N'Jean-Guy Lauzon ', N'2960 Rue St. Laurent ', N'Montréal ', N'H1J 1C3 ', N'Canada ', N'(514) 555-9022 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (26, N'Pasta Buttini s.r.l. ', N'Giovanni Giudici ', N'Via dei Gelsomini, 153 ', N'Salerno ', N'84100 ', N'Italy ', N'(089) 6547665 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (27, N'Escargots Nouveaux ', N'Marie Delamare ', N'22, rue H. Voiron ', N'Montceau ', N'71300 ', N'France ', N'85.57.00.07 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (28, N'Gai pâturage ', N'Eliane Noz ', N'Bat. B 3, rue des Alpes ', N'Annecy ', N'74000 ', N'France ', N'38.76.98.06 ')
GO
INSERT [dbo].[suppliers] ([supplierID], [supplierName], [ContactName], [Address], [City], [PostalCode], [Country], [Phone]) VALUES (29, N'Forêts d''érables ', N'Chantal Goulet ', N'148 rue Chasseur ', N'Ste-Hyacinthe ', N'J2S 7S8 ', N'Canada ', N'(514) 555-2955 ')
GO
SET IDENTITY_INSERT [dbo].[suppliers] OFF
GO

SET IDENTITY_INSERT [dbo].[Products] ON
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (1, N'Chais ', 1, 1, N'10 boxes x 20 bags ', 18.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (2, N'Chang ', 1, 1, N'24 - 12 oz bottles ', 19.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (3, N'Aniseed Syrup ', 1, 2, N'12 - 550 ml bottles ', 10.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (4, N'Chef Anton''s Cajun Seasoning ', 2, 2, N'48 - 6 oz jars ', 22.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (5, N'Chef Anton''s Gumbo Mix ', 2, 2, N'36 boxes ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (6, N'Grandma''s Boysenberry Spread ', 3, 2, N'12 - 8 oz jars ', 25.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (7, N'Uncle Bob''s Organic Dried Pears ', 3, 7, N'12 - 1 lb pkgs. ', 30.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (8, N'Northwoods Cranberry Sauce ', 3, 2, N'12 - 12 oz jars ', 40.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (9, N'Mishi Kobe Niku ', 4, 6, N'18 - 500 g pkgs. ', 97.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (10, N'Ikura ', 4, 8, N'12 - 200 ml jars ', 31.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (11, N'Queso Cabrales ', 5, 4, N'1 kg pkg. ', 21.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (12, N'Queso Manchego La Pastora ', 5, 4, N'10 - 500 g pkgs. ', 38.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (13, N'Konbu ', 6, 8, N'2 kg box ', 6.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (14, N'Tofu ', 6, 7, N'40 - 100 g pkgs. ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (15, N'Genen Shouyu ', 6, 2, N'24 - 250 ml bottles ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (16, N'Pavlova ', 7, 3, N'32 - 500 g boxes ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (17, N'Alice Mutton ', 7, 6, N'20 - 1 kg tins ', 39.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (18, N'Carnarvon Tigers ', 7, 8, N'16 kg pkg. ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (19, N'Teatime Chocolate Biscuits ', 8, 3, N'10 boxes x 12 pieces ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (20, N'Sir Rodney''s Marmalade ', 8, 3, N'30 gift boxes ', 81.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (21, N'Sir Rodney''s Scones ', 8, 3, N'24 pkgs. x 4 pieces ', 10.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (22, N'Gustaf''s Knäckebröd ', 9, 5, N'24 - 500 g pkgs. ', 21.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (23, N'Tunnbröd ', 9, 5, N'12 - 250 g pkgs. ', 9.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (24, N'Guaraná Fantástica ', 10, 1, N'12 - 355 ml cans ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (25, N'NuNuCa Nuß-Nougat-Creme ', 11, 3, N'20 - 450 g glasses ', 14.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (26, N'Gumbär Gummibärchen ', 11, 3, N'100 - 250 g bags ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (27, N'Schoggi Schokolade ', 11, 3, N'100 - 100 g pieces ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (28, N'Rössle Sauerkraut ', 12, 7, N'25 - 825 g cans ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (29, N'Thüringer Rostbratwurst ', 12, 6, N'50 bags x 30 sausgs. ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (30, N'Nord-Ost Matjeshering ', 13, 8, N'10 - 200 g glasses ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (31, N'Gorgonzola Telino ', 14, 4, N'12 - 100 g pkgs ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (32, N'Mascarpone Fabioli ', 14, 4, N'24 - 200 g pkgs. ', 32.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (33, N'Geitost ', 15, 4, N'500 g ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (34, N'Sasquatch Ale ', 16, 1, N'24 - 12 oz bottles ', 14.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (35, N'Steeleye Stout ', 16, 1, N'24 - 12 oz bottles ', 18.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (36, N'Inlagd Sill ', 17, 8, N'24 - 250 g jars ', 19.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (37, N'Gravad lax ', 17, 8, N'12 - 500 g pkgs. ', 26.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (38, N'Côte de Blaye ', 18, 1, N'12 - 75 cl bottles ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (39, N'Chartreuse verte ', 18, 1, N'750 cc per bottle ', 18.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (40, N'Boston Crab Meat ', 19, 8, N'24 - 4 oz tins ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (41, N'Jack''s New England Clam Chowder ', 19, 8, N'12 - 12 oz cans ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (42, N'Singaporean Hokkien Fried Mee ', 20, 5, N'32 - 1 kg pkgs. ', 14.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (43, N'Ipoh Coffee ', 20, 1, N'16 - 500 g tins ', 46.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (44, N'Gula Malacca ', 20, 2, N'20 - 2 kg bags ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (45, N'Røgede sild ', 21, 8, N'1k pkg. ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (46, N'Spegesild ', 21, 8, N'4 - 450 g glasses ', 12.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (47, N'Zaanse koeken ', 22, 3, N'10 - 4 oz boxes ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (48, N'Chocolade ', 22, 3, N'10 pkgs. ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (49, N'Maxilaku ', 23, 3, N'24 - 50 g pkgs. ', 20.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (50, N'Valkoinen suklaa ', 23, 3, N'12 - 100 g bars ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (51, N'Manjimup Dried Apples ', 24, 7, N'50 - 300 g pkgs. ', 53.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (52, N'Filo Mix ', 24, 5, N'16 - 2 kg boxes ', 7.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (53, N'Perth Pasties ', 24, 6, N'48 pieces ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (54, N'Tourtière ', 25, 6, N'16 pies ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (55, N'Pâté chinois ', 25, 6, N'24 boxes x 2 pies ', 24.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (56, N'Gnocchi di nonna Alice ', 26, 5, N'24 - 250 g pkgs. ', 38.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (57, N'Ravioli Angelo ', 26, 5, N'24 - 250 g pkgs. ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (58, N'Escargots de Bourgogne ', 27, 8, N'24 pieces ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (59, N'Raclette Courdavault ', 28, 4, N'5 kg pkg. ', 55.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (60, N'Camembert Pierrot ', 28, 4, N'15 - 300 g rounds ', 34.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (61, N'Sirop d''érable ', 29, 2, N'24 - 500 ml bottles ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (62, N'Tarte au sucre ', 29, 3, N'48 pies ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (63, N'Vegie-spread ', 7, 2, N'15 - 625 g jars ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (64, N'Wimmers gute Semmelknödel ', 12, 5, N'20 bags x 4 pieces ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce ', 2, 2, N'32 - 8 oz bottles ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (66, N'Louisiana Hot Spiced Okra ', 2, 2, N'24 - 8 oz jars ', 17.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (67, N'Laughing Lumberjack Lager ', 16, 1, N'24 - 12 oz bottles ', 14.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (68, N'Scottish Longbreads ', 8, 3, N'10 boxes x 8 pieces ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (69, N'Gudbrandsdalsost ', 15, 4, N'10 kg pkg. ', 36.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (70, N'Outback Lager ', 7, 1, N'24 - 355 ml bottles ', 15.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (71, N'Fløtemysost ', 15, 4, N'10 - 500 g pkgs. ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (72, N'Mozzarella di Giovanni ', 14, 4, N'24 - 200 g pkgs. ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (73, N'Röd Kaviar ', 17, 8, N'24 - 150 g jars ', 15.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (74, N'Longlife Tofu ', 4, 7, N'5 kg pkg. ', 10.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (75, N'Rhönbräu Klosterbier ', 12, 1, N'24 - 0.5 l bottles ', NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (76, N'Lakkalikööri ', 23, 1, N'500 ml ', 18.0000)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [supplierID], [CategoryID], [unit], [Price]) VALUES (77, N'Original Frankfurter grüne Soße ', 12, 2, N'12 boxes ', 13.0000)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO

SET IDENTITY_INSERT [dbo].[OrderDetails] ON
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (1, 10248, 11, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (2, 10248, 42, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (3, 10248, 72, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (4, 10249, 14, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (5, 10249, 51, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (6, 10250, 41, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (7, 10250, 51, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (8, 10250, 65, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (9, 10251, 22, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (10, 10251, 57, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (11, 10251, 65, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (12, 10252, 20, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (13, 10252, 33, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (14, 10252, 60, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (15, 10253, 31, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (16, 10253, 39, 42)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (17, 10253, 49, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (18, 10254, 24, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (19, 10254, 55, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (20, 10254, 74, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (21, 10255, 2, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (22, 10255, 16, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (23, 10255, 36, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (24, 10255, 59, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (25, 10256, 53, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (26, 10256, 77, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (27, 10257, 27, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (28, 10257, 39, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (29, 10257, 77, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (30, 10258, 2, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (31, 10258, 5, 65)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (32, 10258, 32, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (33, 10259, 21, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (34, 10259, 37, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (35, 10260, 41, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (36, 10260, 57, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (37, 10260, 62, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (38, 10260, 70, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (39, 10261, 21, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (40, 10261, 35, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (41, 10262, 5, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (42, 10262, 7, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (43, 10262, 56, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (44, 10263, 16, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (45, 10263, 24, 28)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (46, 10263, 30, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (47, 10263, 74, 36)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (48, 10264, 2, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (49, 10264, 41, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (50, 10265, 17, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (51, 10265, 70, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (52, 10266, 12, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (53, 10267, 40, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (54, 10267, 59, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (55, 10267, 76, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (56, 10268, 29, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (57, 10268, 72, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (58, 10269, 33, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (59, 10269, 72, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (60, 10270, 36, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (61, 10270, 43, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (62, 10271, 33, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (63, 10272, 20, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (64, 10272, 31, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (65, 10272, 72, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (66, 10273, 10, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (67, 10273, 31, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (68, 10273, 33, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (69, 10273, 40, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (70, 10273, 76, 33)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (71, 10274, 71, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (72, 10274, 72, 7)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (73, 10275, 24, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (74, 10275, 59, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (75, 10276, 10, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (76, 10276, 13, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (77, 10277, 28, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (78, 10277, 62, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (79, 10278, 44, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (80, 10278, 59, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (81, 10278, 63, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (82, 10278, 73, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (83, 10279, 17, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (84, 10280, 24, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (85, 10280, 55, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (86, 10280, 75, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (87, 10281, 19, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (88, 10281, 24, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (89, 10281, 35, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (90, 10282, 30, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (91, 10282, 57, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (92, 10283, 15, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (93, 10283, 19, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (94, 10283, 60, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (95, 10283, 72, 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (96, 10284, 27, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (97, 10284, 44, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (98, 10284, 60, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (99, 10284, 67, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (100, 10285, 1, 45)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (101, 10285, 40, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (102, 10285, 53, 36)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (103, 10286, 35, 100)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (104, 10286, 62, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (105, 10287, 16, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (106, 10287, 34, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (107, 10287, 46, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (108, 10288, 54, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (109, 10288, 68, 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (110, 10289, 3, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (111, 10289, 64, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (112, 10290, 5, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (113, 10290, 29, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (114, 10290, 49, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (115, 10290, 77, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (116, 10291, 13, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (117, 10291, 44, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (118, 10291, 51, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (119, 10292, 20, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (120, 10293, 18, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (121, 10293, 24, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (122, 10293, 63, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (123, 10293, 75, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (124, 10294, 1, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (125, 10294, 17, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (126, 10294, 43, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (127, 10294, 60, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (128, 10294, 75, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (129, 10295, 56, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (130, 10296, 11, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (131, 10296, 16, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (132, 10296, 69, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (133, 10297, 39, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (134, 10297, 72, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (135, 10298, 2, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (136, 10298, 36, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (137, 10298, 59, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (138, 10298, 62, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (139, 10299, 19, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (140, 10299, 70, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (141, 10300, 66, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (142, 10300, 68, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (143, 10301, 40, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (144, 10301, 56, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (145, 10302, 17, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (146, 10302, 28, 28)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (147, 10302, 43, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (148, 10303, 40, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (149, 10303, 65, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (150, 10303, 68, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (151, 10304, 49, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (152, 10304, 59, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (153, 10304, 71, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (154, 10305, 18, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (155, 10305, 29, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (156, 10305, 39, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (157, 10306, 30, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (158, 10306, 53, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (159, 10306, 54, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (160, 10307, 62, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (161, 10307, 68, 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (162, 10308, 69, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (163, 10308, 70, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (164, 10309, 4, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (165, 10309, 6, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (166, 10309, 42, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (167, 10309, 43, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (168, 10309, 71, 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (169, 10310, 16, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (170, 10310, 62, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (171, 10311, 42, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (172, 10311, 69, 7)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (173, 10312, 28, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (174, 10312, 43, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (175, 10312, 53, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (176, 10312, 75, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (177, 10313, 36, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (178, 10314, 32, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (179, 10314, 58, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (180, 10314, 62, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (181, 10315, 34, 14)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (182, 10315, 70, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (183, 10316, 41, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (184, 10316, 62, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (185, 10317, 1, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (186, 10318, 41, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (187, 10318, 76, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (188, 10319, 17, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (189, 10319, 28, 14)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (190, 10319, 76, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (191, 10320, 71, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (192, 10321, 35, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (193, 10322, 52, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (194, 10323, 15, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (195, 10323, 25, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (196, 10323, 39, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (197, 10324, 16, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (198, 10324, 35, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (199, 10324, 46, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (200, 10324, 59, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (201, 10324, 63, 80)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (202, 10325, 6, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (203, 10325, 13, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (204, 10325, 14, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (205, 10325, 31, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (206, 10325, 72, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (207, 10326, 4, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (208, 10326, 57, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (209, 10326, 75, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (210, 10327, 2, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (211, 10327, 11, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (212, 10327, 30, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (213, 10327, 58, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (214, 10328, 59, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (215, 10328, 65, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (216, 10328, 68, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (217, 10329, 19, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (218, 10329, 30, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (219, 10329, 38, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (220, 10329, 56, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (221, 10330, 26, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (222, 10330, 72, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (223, 10331, 54, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (224, 10332, 18, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (225, 10332, 42, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (226, 10332, 47, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (227, 10333, 14, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (228, 10333, 21, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (229, 10333, 71, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (230, 10334, 52, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (231, 10334, 68, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (232, 10335, 2, 7)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (233, 10335, 31, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (234, 10335, 32, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (235, 10335, 51, 48)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (236, 10336, 4, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (237, 10337, 23, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (238, 10337, 26, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (239, 10337, 36, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (240, 10337, 37, 28)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (241, 10337, 72, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (242, 10338, 17, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (243, 10338, 30, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (244, 10339, 4, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (245, 10339, 17, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (246, 10339, 62, 28)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (247, 10340, 18, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (248, 10340, 41, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (249, 10340, 43, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (250, 10341, 33, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (251, 10341, 59, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (252, 10342, 2, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (253, 10342, 31, 56)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (254, 10342, 36, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (255, 10342, 55, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (256, 10343, 64, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (257, 10343, 68, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (258, 10343, 76, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (259, 10344, 4, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (260, 10344, 8, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (261, 10345, 8, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (262, 10345, 19, 80)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (263, 10345, 42, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (264, 10346, 17, 36)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (265, 10346, 56, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (266, 10347, 25, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (267, 10347, 39, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (268, 10347, 40, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (269, 10347, 75, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (270, 10348, 1, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (271, 10348, 23, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (272, 10349, 54, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (273, 10350, 50, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (274, 10350, 69, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (275, 10351, 38, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (276, 10351, 41, 13)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (277, 10351, 44, 77)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (278, 10351, 65, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (279, 10352, 24, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (280, 10352, 54, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (281, 10353, 11, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (282, 10353, 38, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (283, 10354, 1, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (284, 10354, 29, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (285, 10355, 24, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (286, 10355, 57, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (287, 10356, 31, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (288, 10356, 55, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (289, 10356, 69, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (290, 10357, 10, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (291, 10357, 26, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (292, 10357, 60, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (293, 10358, 24, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (294, 10358, 34, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (295, 10358, 36, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (296, 10359, 16, 56)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (297, 10359, 31, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (298, 10359, 60, 80)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (299, 10360, 28, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (300, 10360, 29, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (301, 10360, 38, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (302, 10360, 49, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (303, 10360, 54, 28)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (304, 10361, 39, 54)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (305, 10361, 60, 55)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (306, 10362, 25, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (307, 10362, 51, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (308, 10362, 54, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (309, 10363, 31, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (310, 10363, 75, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (311, 10363, 76, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (312, 10364, 69, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (313, 10364, 71, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (314, 10365, 11, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (315, 10366, 65, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (316, 10366, 77, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (317, 10367, 34, 36)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (318, 10367, 54, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (319, 10367, 65, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (320, 10367, 77, 7)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (321, 10368, 21, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (322, 10368, 28, 13)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (323, 10368, 57, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (324, 10368, 64, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (325, 10369, 29, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (326, 10369, 56, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (327, 10370, 1, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (328, 10370, 64, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (329, 10370, 74, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (330, 10371, 36, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (331, 10372, 20, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (332, 10372, 38, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (333, 10372, 60, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (334, 10372, 72, 42)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (335, 10373, 58, 80)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (336, 10373, 71, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (337, 10374, 31, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (338, 10374, 58, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (339, 10375, 14, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (340, 10375, 54, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (341, 10376, 31, 42)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (342, 10377, 28, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (343, 10377, 39, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (344, 10378, 71, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (345, 10379, 41, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (346, 10379, 63, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (347, 10379, 65, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (348, 10380, 30, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (349, 10380, 53, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (350, 10380, 60, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (351, 10380, 70, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (352, 10381, 74, 14)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (353, 10382, 5, 32)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (354, 10382, 18, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (355, 10382, 29, 14)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (356, 10382, 33, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (357, 10382, 74, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (358, 10383, 13, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (359, 10383, 50, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (360, 10383, 56, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (361, 10384, 20, 28)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (362, 10384, 60, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (363, 10385, 7, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (364, 10385, 60, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (365, 10385, 68, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (366, 10386, 24, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (367, 10386, 34, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (368, 10387, 24, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (369, 10387, 28, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (370, 10387, 59, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (371, 10387, 71, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (372, 10388, 45, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (373, 10388, 52, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (374, 10388, 53, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (375, 10389, 10, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (376, 10389, 55, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (377, 10389, 62, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (378, 10389, 70, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (379, 10390, 31, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (380, 10390, 35, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (381, 10390, 46, 45)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (382, 10390, 72, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (383, 10391, 13, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (384, 10392, 69, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (385, 10393, 2, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (386, 10393, 14, 42)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (387, 10393, 25, 7)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (388, 10393, 26, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (389, 10393, 31, 32)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (390, 10394, 13, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (391, 10394, 62, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (392, 10395, 46, 28)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (393, 10395, 53, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (394, 10395, 69, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (395, 10396, 23, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (396, 10396, 71, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (397, 10396, 72, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (398, 10397, 21, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (399, 10397, 51, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (400, 10398, 35, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (401, 10398, 55, 120)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (402, 10399, 68, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (403, 10399, 71, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (404, 10399, 76, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (405, 10399, 77, 14)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (406, 10400, 29, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (407, 10400, 35, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (408, 10400, 49, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (409, 10401, 30, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (410, 10401, 56, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (411, 10401, 65, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (412, 10401, 71, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (413, 10402, 23, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (414, 10402, 63, 65)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (415, 10403, 16, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (416, 10403, 48, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (417, 10404, 26, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (418, 10404, 42, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (419, 10404, 49, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (420, 10405, 3, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (421, 10406, 1, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (422, 10406, 21, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (423, 10406, 28, 42)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (424, 10406, 36, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (425, 10406, 40, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (426, 10407, 11, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (427, 10407, 69, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (428, 10407, 71, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (429, 10408, 37, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (430, 10408, 54, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (431, 10408, 62, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (432, 10409, 14, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (433, 10409, 21, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (434, 10410, 33, 49)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (435, 10410, 59, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (436, 10411, 41, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (437, 10411, 44, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (438, 10411, 59, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (439, 10412, 14, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (440, 10413, 1, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (441, 10413, 62, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (442, 10413, 76, 14)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (443, 10414, 19, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (444, 10414, 33, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (445, 10415, 17, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (446, 10415, 33, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (447, 10416, 19, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (448, 10416, 53, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (449, 10416, 57, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (450, 10417, 38, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (451, 10417, 46, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (452, 10417, 68, 36)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (453, 10417, 77, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (454, 10418, 2, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (455, 10418, 47, 55)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (456, 10418, 61, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (457, 10418, 74, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (458, 10419, 60, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (459, 10419, 69, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (460, 10420, 9, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (461, 10420, 13, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (462, 10420, 70, 😎
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (463, 10420, 73, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (464, 10421, 19, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (465, 10421, 26, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (466, 10421, 53, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (467, 10421, 77, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (468, 10422, 26, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (469, 10423, 31, 14)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (470, 10423, 59, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (471, 10424, 35, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (472, 10424, 38, 49)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (473, 10424, 68, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (474, 10425, 55, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (475, 10425, 76, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (476, 10426, 56, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (477, 10426, 64, 7)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (478, 10427, 14, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (479, 10428, 46, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (480, 10429, 50, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (481, 10429, 63, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (482, 10430, 17, 45)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (483, 10430, 21, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (484, 10430, 56, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (485, 10430, 59, 70)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (486, 10431, 17, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (487, 10431, 40, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (488, 10431, 47, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (489, 10432, 26, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (490, 10432, 54, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (491, 10433, 56, 28)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (492, 10434, 11, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (493, 10434, 76, 18)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (494, 10435, 2, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (495, 10435, 22, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (496, 10435, 72, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (497, 10436, 46, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (498, 10436, 56, 40)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (499, 10436, 64, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (500, 10436, 75, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (501, 10437, 53, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (502, 10438, 19, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (503, 10438, 34, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (504, 10438, 57, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (505, 10439, 12, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (506, 10439, 16, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (507, 10439, 64, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (508, 10439, 74, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (509, 10440, 2, 45)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (510, 10440, 16, 49)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (511, 10440, 29, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (512, 10440, 61, 90)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (513, 10441, 27, 50)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (514, 10442, 11, 30)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (515, 10442, 54, 80)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (516, 10442, 66, 60)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (517, 10443, 11, 6)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (518, 10443, 28, 12)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO