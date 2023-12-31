USE [master]
GO
/****** Object:  Database [PruebaProducto]    Script Date: 6/16/2023 6:26:39 PM ******/
CREATE DATABASE [PruebaProducto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaProducto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PruebaProducto.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PruebaProducto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PruebaProducto_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PruebaProducto] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaProducto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaProducto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaProducto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaProducto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaProducto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaProducto] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaProducto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebaProducto] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaProducto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaProducto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaProducto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaProducto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaProducto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaProducto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaProducto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaProducto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaProducto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PruebaProducto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaProducto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaProducto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaProducto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaProducto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaProducto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaProducto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaProducto] SET RECOVERY FULL 
GO
ALTER DATABASE [PruebaProducto] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaProducto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaProducto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaProducto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaProducto] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PruebaProducto', N'ON'
GO
USE [PruebaProducto]
GO
/****** Object:  StoredProcedure [dbo].[CategoriaGetAll]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoriaGetAll]

AS

	SELECT [IdCategoria]
      ,[Nombre]
  FROM [dbo].[Categoria]

GO
/****** Object:  StoredProcedure [dbo].[Paginacion]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Paginacion]
@Siguiente INT,
@Registros INT
AS

SET NOCOUNT ON;

SELECT [IdProducto]
      ,Producto.[Nombre]
      ,[Precio]
      ,Categoria.[IdCategoria]
	  ,Categoria.Nombre AS NombreCategoria
  FROM [dbo].[Producto]

  INNER JOIN Categoria ON Categoria.IdCategoria = Producto.IdCategoria
  
  ORDER BY IdProducto

	OFFSET (@Siguiente - 1) * @Registros ROWS
    FETCH NEXT @Registros ROWS ONLY;
GO
/****** Object:  StoredProcedure [dbo].[ProductoAdd]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductoAdd]
@Nombre VARCHAR(100),
@Precio MONEY,
@IdCategoria INT

AS

	INSERT INTO [dbo].[Producto]
           ([Nombre]
           ,[Precio]
           ,[IdCategoria])
     VALUES
           (@Nombre
		    ,@Precio
			,@IdCategoria)
GO
/****** Object:  StoredProcedure [dbo].[ProductoDelete]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductoDelete]
@IdProducto INT

AS

	DELETE FROM [dbo].[Producto]

 WHERE IdProducto = @IdProducto
GO
/****** Object:  StoredProcedure [dbo].[ProductoGetAll]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductoGetAll]

AS

	SELECT [IdProducto]
      ,Producto.[Nombre]
      ,[Precio]
      ,Categoria.[IdCategoria]
	  ,Categoria.Nombre AS NombreCategoria
  FROM [dbo].[Producto]

  INNER JOIN Categoria ON Categoria.IdCategoria = Producto.IdCategoria
GO
/****** Object:  StoredProcedure [dbo].[ProductoGetById]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductoGetById]
@IdProducto INT

AS

	SELECT [IdProducto]
      ,Producto.[Nombre]
      ,[Precio]
      ,Categoria.[IdCategoria]
	  ,Categoria.Nombre AS NombreCategoria
  FROM [dbo].[Producto]

  INNER JOIN Categoria ON Categoria.IdCategoria = Producto.IdCategoria

 WHERE IdProducto = @IdProducto
GO
/****** Object:  StoredProcedure [dbo].[ProductoUpdate]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductoUpdate]
@IdProducto INT,
@Nombre VARCHAR(100),
@Precio MONEY,
@IdCategoria INT

AS

	UPDATE [dbo].[Producto]
   SET [Nombre] = @Nombre
      ,[Precio] = @Precio
      ,[IdCategoria] = @IdCategoria

 WHERE IdProducto = @IdProducto
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 6/16/2023 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Precio] [money] NULL,
	[IdCategoria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (1, N'Tecnologia')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (2, N'Abarrotes')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (3, N'Cremeria')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (4, N'Articulos de Limpieza')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre]) VALUES (5, N'Higiene Personal')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (1, N'Iphone X', 21000.0000, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (3, N'Frijol Negro', 30.5000, 2)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (4, N'Arroz Morelos', 35.0000, 2)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (5, N'Leche Lala', 20.0000, 3)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (6, N'Queso Manchego', 38.0000, 3)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (7, N'Pinol', 32.0000, 4)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (8, N'Cloralex', 20.0000, 4)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (9, N'Shampoo Caprice', 48.5000, 5)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (10, N'Pasta Dental Colgate', 23.5000, 5)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (12, N'Acondicionador', 25.0000, 5)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (16, N'Sabritas', 30.0000, 2)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Precio], [IdCategoria]) VALUES (17, N'Doritos', 18.0000, 2)
SET IDENTITY_INSERT [dbo].[Producto] OFF
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
USE [master]
GO
ALTER DATABASE [PruebaProducto] SET  READ_WRITE 
GO
