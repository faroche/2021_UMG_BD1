USE [Control_Alquileres]
GO
/****** Object:  Table [dbo].[Agencia_Inmobiliaria]    Script Date: 9/6/2020 8:02:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencia_Inmobiliaria](
	[Agencia_ID] [int] NOT NULL,
	[Nombre_Agencia] [varchar](150) NOT NULL,
	[Nit] [varchar](25) NOT NULL,
	[Direccion] [varchar](400) NOT NULL,
	[Telefono] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Agencia_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Control_Alquiler]    Script Date: 9/6/2020 8:02:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Alquiler](
	[Alquiler_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vivienda_ID] [int] NULL,
	[Fecha_inicio] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Importe_mensual] [decimal](12, 2) NOT NULL,
	[Fianza] [decimal](12, 2) NOT NULL,
	[Fecha_Firma] [datetime] NOT NULL,
	[Alquiler_renovacion] [int] NULL,
	[Inquilino_id] [int] NULL,
 CONSTRAINT [PK__Control___7E1F8041BD26DD0F] PRIMARY KEY CLUSTERED 
(
	[Alquiler_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inquilino]    Script Date: 9/6/2020 8:02:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inquilino](
	[Inquilino_id] [int] NOT NULL,
	[Nit] [varchar](25) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Telefono] [varchar](60) NOT NULL,
	[FechaNacimiento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Inquilino_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 9/6/2020 8:02:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[Propietario_id] [int] NOT NULL,
	[Nit] [varchar](25) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Telefono] [varchar](60) NOT NULL,
	[Direccion] [varchar](400) NOT NULL,
	[Email] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Propietario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vivienda]    Script Date: 9/6/2020 8:02:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vivienda](
	[Vivienda_ID] [int] NOT NULL,
	[Calle] [varchar](400) NOT NULL,
	[Piso] [varchar](2) NULL,
	[CodigoPostal] [varchar](6) NOT NULL,
	[Poblacion] [varchar](200) NOT NULL,
	[Descripcion] [varchar](4000) NOT NULL,
	[Propietario_id] [int] NULL,
	[Agencia_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Vivienda_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Control_Alquiler]  WITH CHECK ADD  CONSTRAINT [Alquiler_Inquilino] FOREIGN KEY([Inquilino_id])
REFERENCES [dbo].[Inquilino] ([Inquilino_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Control_Alquiler] CHECK CONSTRAINT [Alquiler_Inquilino]
GO
ALTER TABLE [dbo].[Control_Alquiler]  WITH CHECK ADD  CONSTRAINT [Alquiler_Renovacion] FOREIGN KEY([Alquiler_renovacion])
REFERENCES [dbo].[Control_Alquiler] ([Alquiler_ID])
GO
ALTER TABLE [dbo].[Control_Alquiler] CHECK CONSTRAINT [Alquiler_Renovacion]
GO
ALTER TABLE [dbo].[Control_Alquiler]  WITH CHECK ADD  CONSTRAINT [Alquiler_Vivienda] FOREIGN KEY([Vivienda_ID])
REFERENCES [dbo].[Vivienda] ([Vivienda_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Control_Alquiler] CHECK CONSTRAINT [Alquiler_Vivienda]
GO
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD  CONSTRAINT [Agencia_Vivienda] FOREIGN KEY([Agencia_ID])
REFERENCES [dbo].[Agencia_Inmobiliaria] ([Agencia_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Vivienda] CHECK CONSTRAINT [Agencia_Vivienda]
GO
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD  CONSTRAINT [Propietario_Vivienda] FOREIGN KEY([Propietario_id])
REFERENCES [dbo].[Propietario] ([Propietario_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Vivienda] CHECK CONSTRAINT [Propietario_Vivienda]
GO
