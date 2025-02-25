USE [master]
GO
/****** Object:  Database [Restaurante2]    Script Date: 6/13/2022 4:04:50 PM ******/
CREATE DATABASE [Restaurante2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restaurante2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Restaurante2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Restaurante2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Restaurante2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Restaurante2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurante2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurante2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurante2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurante2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurante2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurante2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurante2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restaurante2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurante2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurante2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurante2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurante2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurante2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurante2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurante2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurante2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restaurante2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurante2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurante2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurante2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurante2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurante2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurante2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurante2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restaurante2] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurante2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurante2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurante2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurante2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Restaurante2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Restaurante2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Restaurante2', N'ON'
GO
ALTER DATABASE [Restaurante2] SET QUERY_STORE = OFF
GO
USE [Restaurante2]
GO
/****** Object:  Table [dbo].[DBS]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NULL,
	[MontoTotal] [decimal](18, 0) NULL,
	[IdModoDePago] [int] NULL,
 CONSTRAINT [PK_DBS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleBoleta]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleBoleta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[MontoTotal] [decimal](18, 2) NOT NULL,
	[IdModoDePago] [int] NOT NULL,
 CONSTRAINT [PK_DetalleBoleta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[IdTipoEmpleado] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Celular] [int] NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Sueldo] [money] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](191) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModoDePago]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoDePago](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ModoDePago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Atendido] [bit] NOT NULL,
	[Detalle] [nvarchar](50) NOT NULL,
	[IdEmpleado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPS]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdPedido] [int] NULL,
	[Observacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_PPS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[IdTipoProducto] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[imagen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_Proveedor]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Proveedor](
	[producto_id] [int] NOT NULL,
	[proveedor_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC,
	[proveedor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos_Pedidos]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Pedidos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[Observacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Productos_Pedidos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](191) NOT NULL,
	[rubro] [nvarchar](191) NOT NULL,
	[ubicacion] [nvarchar](191) NOT NULL,
	[celular] [nvarchar](191) NOT NULL,
	[telefono] [nvarchar](191) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Atendido] [bit] NULL,
	[Detalle] [nvarchar](50) NULL,
 CONSTRAINT [PK_PS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Sueldo] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoProducto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetalleBoleta] ON 

INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (1, 1, CAST(30.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (2, 2, CAST(36.50 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[DetalleBoleta] OFF
GO
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ADMINMax', N'1234', 1, N'Max', 998877665, N'max2.lara435676@gmail.com', N'Alipio Ponce', 1200.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ADMINRenato', N'1234', 1, N'Renato Zegarra Villa', 944645999, N'rezv98@gmail.com', N'Av Tupac 191', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ADMINRodrigo', N'1234', 1, N'Rodrigo Max Lara Camarena', 988403355, N'max.lara@hotmail.com', N'Av. LosAlamos 141', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ALC', N'1234', 5, N'Andrea Lara Camarena', 944645263, N'andrealara@hotmail.com', N'Av. LosAlamos 141', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'CAAndrea', N'12345678', 2, N'Andrea', 988403360, N'andrea@hotmail.com', N'Av. Los Alamos 141', 800.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'CARodrigo', N'123456', 2, N'Rodrigo', 944645888, N'max.lara99999999@gmail.com', N'Av. Mariscal La Mar 175', 800.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'CodigoFuente', N'1234', 5, N'Rodrigo Max Lara Camarena', 944645247, N'CodigoFuente@gmail.com', N'Av. Mariscal La Mar 673', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'COJorge', N'abcd', 3, N'Jorge', 999999999, N'jorge2@gmail.com', N'calle alamos 260', 600.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'CORenato', N'renato777', 3, N'Renato', 984018241, N'rezv98@gmail.com', N'Av Los Incas 323', 600.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'COSergio', N'12345', 3, N'Sergio', 998877664, N'sergio.slc@hotmail.com', N'Resid.Inclan Block 20', 600.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'daniprofe', N'1234', 5, N'daniel', 123456789, N'dancarvas2431@gmail.com', N'calle upc', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'nuevo', N'1234', 2, N'pepe lucho di maria', 456789032, N'asd@upc.pe', N'av. la lucha', 0.0000)
GO
SET IDENTITY_INSERT [dbo].[migrations] ON 

INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (1, N'2022_06_06_005600_create_proveedors_table', 1)
SET IDENTITY_INSERT [dbo].[migrations] OFF
GO
SET IDENTITY_INSERT [dbo].[ModoDePago] ON 

INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (1, N'efectivo')
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (2, N'visa')
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (3, N'mastercard')
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (4, N'dolares')
SET IDENTITY_INSERT [dbo].[ModoDePago] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (1, 0, N'Andrea Lara Camarena', N'ADMINMax')
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (2, 0, N'Rodrigo Max Lara Camarena', N'ADMINMax')
SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (1, N'Royal', 1, CAST(14.90 AS Decimal(18, 2)), N'Hamburguesa con huevo, queso, lechuga y tomate', N'royal.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (2, N'Clasica', 1, CAST(10.90 AS Decimal(18, 2)), N'Hamburguesa básica con lechuga y tomate', N'clasica.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (3, N'A lo pobre', 1, CAST(14.90 AS Decimal(18, 2)), N'Hamburguesa con tomate, cebolla, platano y huevo', N'alopobre.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (4, N'Hawaiana', 1, CAST(13.90 AS Decimal(18, 2)), N'Hamburguesa con jamon, queso y piña', N'hawaiana.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (5, N'Extrema', 1, CAST(18.90 AS Decimal(18, 2)), N'Hamburguesa con doble carne, lechuga, tomate, queso y tocino', N'extrema.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (6, N'Mexicana', 1, CAST(15.90 AS Decimal(18, 2)), N'Hamburguesa con tomate, queso, huacamole y nachos', N'mexicana.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (7, N'Cheese', 1, CAST(13.90 AS Decimal(18, 2)), N'Hamburguesa con lechuga, tomate y queso', N'chesse_1_1.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (8, N'Parrillera', 1, CAST(17.90 AS Decimal(18, 2)), N'Hamburguesa con tomate, chorizo, chemichurri y mostaza', N'parrillera.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (9, N'Huachana', 1, CAST(15.90 AS Decimal(18, 2)), N'Hamburguesa con lechuga, salchicha huachana y papas al hilo', N'huachana_7.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (10, N'Golf', 1, CAST(13.90 AS Decimal(18, 2)), N'Hamburguesa con tomate, huevo, papas al hilo y salsa golf', N'golf.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (11, N'Papas Fritas', 2, CAST(5.50 AS Decimal(18, 2)), N'Papas fritas crocantes', N'papasfritas.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (12, N'Onion Rings', 2, CAST(7.90 AS Decimal(18, 2)), N'Aros empannizados rellenos de cebolla', N'OnionRings.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (13, N'Cheese Fingers', 2, CAST(8.90 AS Decimal(18, 2)), N'Palillos rellenos de queso', N'cheesefingers.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (14, N'Nuggets', 2, CAST(10.90 AS Decimal(18, 2)), N'Trozos de pollo crujientes', N'nuggets.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (15, N'San Mateo', 2, CAST(2.90 AS Decimal(18, 2)), N'Agua Mineral', N'sanMateo.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (16, N'San Luis', 2, CAST(1.50 AS Decimal(18, 2)), N'Agua Mineral', N'logo-san-luis.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (17, N'Inka Kola', 2, CAST(2.20 AS Decimal(18, 2)), N'Gaseosa ', N'inka.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (18, N'Coca Cola', 2, CAST(2.20 AS Decimal(18, 2)), N'Gaseosa', N'cocacola.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (19, N'Seven Up', 2, CAST(2.20 AS Decimal(18, 2)), N'Gaseosa', N'sevenup.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (20, N'Royal+Cheese', 3, CAST(21.90 AS Decimal(18, 2)), N'Combo de dos hamburguesas', N'royalmascheese.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (21, N'A lo pobre+Royal', 3, CAST(22.90 AS Decimal(18, 2)), N'Combo de dos hamburguesas', N'alopobremasroyal.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (22, N'Triple Cheese', 3, CAST(23.90 AS Decimal(18, 2)), N'Tres hamburguesas Cheese', N'triplecheese.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (23, N'2 Clasicas+1 Chesse', 3, CAST(25.90 AS Decimal(18, 2)), N'Dos hamburguesas clasicas y una cheese', N'2clasicasmascheese.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (24, N'fanta', 2, CAST(2.00 AS Decimal(18, 2)), N'Gaseosa con sabor de naranja', N'fanta.png')
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
INSERT [dbo].[Producto_Proveedor] ([producto_id], [proveedor_id]) VALUES (1, 1)
INSERT [dbo].[Producto_Proveedor] ([producto_id], [proveedor_id]) VALUES (1, 2)
INSERT [dbo].[Producto_Proveedor] ([producto_id], [proveedor_id]) VALUES (2, 1)
INSERT [dbo].[Producto_Proveedor] ([producto_id], [proveedor_id]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[Productos_Pedidos] ON 

INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (2, 7, 1, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (3, 16, 1, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (4, 1, 2, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (5, 4, 2, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (6, 11, 2, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (7, 19, 2, NULL)
SET IDENTITY_INSERT [dbo].[Productos_Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([id], [nombre], [rubro], [ubicacion], [celular], [telefono], [created_at], [updated_at]) VALUES (1, N'ejemplo1', N'ejemplo1', N'ejemplo1', N'ejemplo1', N'ejemplo1', CAST(N'2022-06-06T22:59:37.397' AS DateTime), CAST(N'2022-06-06T22:59:37.397' AS DateTime))
INSERT [dbo].[Proveedor] ([id], [nombre], [rubro], [ubicacion], [celular], [telefono], [created_at], [updated_at]) VALUES (2, N'ejemplo2', N'ejemplo2', N'ejemplo2', N'ejemplo2', N'ejemplo2', CAST(N'2022-06-06T22:59:57.897' AS DateTime), CAST(N'2022-06-06T22:59:57.897' AS DateTime))
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoEmpleado] ON 

INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (1, N'admin', CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (2, N'cajero', CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (3, N'cocinero', CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (5, N'cliente', CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (6, N'Seguridad', CAST(900.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TipoEmpleado] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoProducto] ON 

INSERT [dbo].[TipoProducto] ([ID], [Descripcion]) VALUES (1, N'hamburguesa')
INSERT [dbo].[TipoProducto] ([ID], [Descripcion]) VALUES (2, N'complemento')
INSERT [dbo].[TipoProducto] ([ID], [Descripcion]) VALUES (3, N'combo')
SET IDENTITY_INSERT [dbo].[TipoProducto] OFF
GO
ALTER TABLE [dbo].[DBS]  WITH CHECK ADD  CONSTRAINT [FK_DBS_ModoDePago] FOREIGN KEY([IdModoDePago])
REFERENCES [dbo].[ModoDePago] ([ID])
GO
ALTER TABLE [dbo].[DBS] CHECK CONSTRAINT [FK_DBS_ModoDePago]
GO
ALTER TABLE [dbo].[DBS]  WITH CHECK ADD  CONSTRAINT [FK_DBS_PS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PS] ([ID])
GO
ALTER TABLE [dbo].[DBS] CHECK CONSTRAINT [FK_DBS_PS]
GO
ALTER TABLE [dbo].[DetalleBoleta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleBoleta_ModoDePago] FOREIGN KEY([IdModoDePago])
REFERENCES [dbo].[ModoDePago] ([ID])
GO
ALTER TABLE [dbo].[DetalleBoleta] CHECK CONSTRAINT [FK_DetalleBoleta_ModoDePago]
GO
ALTER TABLE [dbo].[DetalleBoleta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleBoleta_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([ID])
GO
ALTER TABLE [dbo].[DetalleBoleta] CHECK CONSTRAINT [FK_DetalleBoleta_Pedido]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_TipoEmpleado] FOREIGN KEY([IdTipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([ID])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_TipoEmpleado]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Pedido] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Pedido]
GO
ALTER TABLE [dbo].[PPS]  WITH CHECK ADD  CONSTRAINT [FK_PPS_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([ID])
GO
ALTER TABLE [dbo].[PPS] CHECK CONSTRAINT [FK_PPS_Producto]
GO
ALTER TABLE [dbo].[PPS]  WITH CHECK ADD  CONSTRAINT [FK_PPS_PS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PS] ([ID])
GO
ALTER TABLE [dbo].[PPS] CHECK CONSTRAINT [FK_PPS_PS]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TipoProducto] FOREIGN KEY([IdTipoProducto])
REFERENCES [dbo].[TipoProducto] ([ID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_TipoProducto]
GO
ALTER TABLE [dbo].[Producto_Proveedor]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[Producto] ([ID])
GO
ALTER TABLE [dbo].[Producto_Proveedor]  WITH CHECK ADD FOREIGN KEY([proveedor_id])
REFERENCES [dbo].[Proveedor] ([id])
GO
ALTER TABLE [dbo].[Productos_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Pedidos_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([ID])
GO
ALTER TABLE [dbo].[Productos_Pedidos] CHECK CONSTRAINT [FK_Productos_Pedidos_Pedido]
GO
ALTER TABLE [dbo].[Productos_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Pedidos_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([ID])
GO
ALTER TABLE [dbo].[Productos_Pedidos] CHECK CONSTRAINT [FK_Productos_Pedidos_Producto]
GO
/****** Object:  StoredProcedure [dbo].[eliminar]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar]
AS
BEGIN
	delete from DBS 
	delete from PPS
    delete from PS
	DBCC CHECKIDENT (PS, RESEED,0)
	DBCC CHECKIDENT (PPS, RESEED,0)
	DBCC CHECKIDENT (DBS, RESEED,0)
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarTodo]    Script Date: 6/13/2022 4:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminarTodo] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
delete from DBS 
	delete from PPS
    delete from PS
	DBCC CHECKIDENT (PS, RESEED,0)
	DBCC CHECKIDENT (PPS, RESEED,0)
	DBCC CHECKIDENT (DBS, RESEED,0)
	END
GO
USE [master]
GO
ALTER DATABASE [Restaurante2] SET  READ_WRITE 
GO