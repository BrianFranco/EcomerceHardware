CREATE DATABASE BDGrupo4
GO
USE [BDGrupo4]
GO
CREATE TABLE [dbo].[Categorias](
	[Cod_Cat] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	[Nombre_Cat] [varchar](30) NULL,
) 
GO
CREATE TABLE [dbo].[Usuarios](
	[Dni_U] [int] NOT NULL PRIMARY KEY,
	[Nombre_U] [varchar](30) NULL,
	[Apellido_U] [varchar](30) NULL,
	[Direccion_U] [varchar](30) NULL,
	[Ciudad_U] [varchar](30) NULL,
	[Provincia_U] [varchar](30) NULL,
	[Email_U] [varchar](50) NULL,
	[Contraseña_U] [varchar](20) NULL,
	[Administrador_U] [bit] NULL,
)
GO
CREATE TABLE [dbo].[Articulos](
	[Cod_A] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	[Nombre_A] [varchar](30) NULL,
	[Descripcion_A] [varchar](50) NULL,
	[Cod_Cat_A] [int] FOREIGN KEY REFERENCES Categorias(Cod_Cat),
	[PU_A] [float] NULL,
	[Stock_A] [int] NULL,
	[Img_Url_A] [varchar](80) NULL,
	[Baja_A] [bit] DEFAULT 0
)
GO
CREATE TABLE [dbo].[Ventas](
	[Num_V] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	[Fecha_V] [varchar](10) NULL,
	[Dni_Usu_V] [int] FOREIGN KEY REFERENCES Usuarios(Dni_U),
	[Telefono_V] [varchar](30) NULL,
	[Direccion_V] [varchar](30) NULL,
	[Horario_V] [varchar](30) NULL,
	[Contacto_V] [varchar](30) NULL,
	[Total_V] [float] NULL,
)
GO
CREATE TABLE [dbo].[Detalle de Ventas](
	[Num_V_DV] [int] FOREIGN KEY REFERENCES Ventas(Num_V),
	[Cod_A_DV] [int] FOREIGN KEY REFERENCES Articulos(Cod_A),
	[Cant_DV] [int] NULL,
	[PU_DV] [float] NULL,
	PRIMARY KEY (Num_V_DV,Cod_A_DV),
)
GO
