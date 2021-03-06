USE [TP2_Parte_C]
GO
/****** Object:  Table [dbo].[afiliados]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[afiliados](
	[dni] [int] NOT NULL,
	[sigla] [varchar](20) NOT NULL,
	[nroplan] [int] NOT NULL,
	[nroafiliado] [int] NOT NULL,
 CONSTRAINT [PK_Afiliados] PRIMARY KEY CLUSTERED 
(
	[dni] ASC,
	[sigla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coberturas]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coberturas](
	[sigla] [varchar](20) NOT NULL,
	[nroplan] [int] NOT NULL,
	[idEstudio] [int] NOT NULL,
	[cobertura] [varchar](50) NULL,
 CONSTRAINT [PK_Coberturas] PRIMARY KEY CLUSTERED 
(
	[sigla] ASC,
	[nroplan] ASC,
	[idEstudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidades]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidades](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[espemedi]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[espemedi](
	[matricula] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
 CONSTRAINT [PK_EspecialidadesMatriculas] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudios]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudios](
	[idEstudio] [int] IDENTITY(1,1) NOT NULL,
	[estudio] [varchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Estudios] PRIMARY KEY CLUSTERED 
(
	[idEstudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estuespe]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estuespe](
	[idEstudio] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
 CONSTRAINT [PK_EstudiosEspecialidades] PRIMARY KEY CLUSTERED 
(
	[idEstudio] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historias]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historias](
	[dni] [int] NOT NULL,
	[idEstudio] [int] NOT NULL,
	[idInstituto] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[matricula] [int] NOT NULL,
	[sigla] [varchar](20) NOT NULL,
	[activo] [bit] NOT NULL,
	[observaciones] [varchar](500) NULL,
	[pagado] [bit] NOT NULL,
 CONSTRAINT [PK_Historias] PRIMARY KEY CLUSTERED 
(
	[dni] ASC,
	[idEstudio] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[institutos]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[institutos](
	[idInstituto] [int] IDENTITY(1,1) NOT NULL,
	[instituto] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Institutos] PRIMARY KEY CLUSTERED 
(
	[idInstituto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicos]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicos](
	[matricula] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
	[sexo] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Matriculas] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OOSS]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OOSS](
	[sigla] [varchar](20) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[categoria] [varchar](150) NOT NULL,
 CONSTRAINT [PK_OOSS] PRIMARY KEY CLUSTERED 
(
	[sigla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pacientes]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pacientes](
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[nacimiento] [date] NOT NULL,
 CONSTRAINT [PK_pacientes] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planes]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planes](
	[sigla] [varchar](20) NOT NULL,
	[nroplan] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Planes] PRIMARY KEY CLUSTERED 
(
	[sigla] ASC,
	[nroplan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precios]    Script Date: 6/7/2022 22:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precios](
	[idEstudio] [int] NOT NULL,
	[idInstituto] [int] NOT NULL,
	[precio] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Precios] PRIMARY KEY CLUSTERED 
(
	[idEstudio] ASC,
	[idInstituto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (11254661, N'OSDE', 6, 1113)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (11344566, N'OSDE', 1, 1111)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (11344577, N'OSDE', 5, 1119)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (12334211, N'UP', 2, 1112)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (12345271, N'OSDE', 5, 1120)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (12445677, N'OSDE', 5, 1121)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (15344566, N'OSDE', 6, 1122)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (30998776, N'OSESAC', 2, 1234)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (31554778, N'OSESAC', 2, 1129)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (31555123, N'OSESAC', 1, 1009)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (33778996, N'OSESAC', 2, 1123)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (34667888, N'OSESAC', 2, 1123)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (34998876, N'OSESAC', 1, 1887)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (35111999, N'OSESAC', 1, 1887)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (35443110, N'OSDE', 6, 1115)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (38333210, N'UP', 1, 1116)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (38775222, N'OSESAC', 2, 1129)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (39777456, N'OSESAC', 1, 1009)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (40443110, N'OSDE', 6, 1117)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (42996775, N'OSESAC', 2, 1234)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (43554667, N'OSDE', 6, 1114)
INSERT [dbo].[afiliados] ([dni], [sigla], [nroplan], [nroafiliado]) VALUES (43554668, N'OSDE', 1, 1118)
GO
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'OSDE', 1, 6, N'20')
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'OSDE', 2, 5, N'100')
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'OSDE', 2, 7, N'30')
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'OSDE', 3, 8, N'50')
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'UP', 1, 1, N'20')
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'UP', 1, 2, N'15')
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'UP', 1, 3, N'5')
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'UP', 2, 4, N'10')
INSERT [dbo].[coberturas] ([sigla], [nroplan], [idEstudio], [cobertura]) VALUES (N'UP', 2, 5, N'50')
GO
SET IDENTITY_INSERT [dbo].[especialidades] ON 

INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (1, N'Oftamologo')
INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (2, N'Kinesiologo')
INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (3, N'Cardiologo')
INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (4, N'Medico Clinico')
INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (5, N'Odontologo')
INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (6, N'Anesteciologo')
INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (7, N'Traumatologo')
INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (8, N'Gastroenterologo')
INSERT [dbo].[especialidades] ([idEspecialidad], [especialidad]) VALUES (9, N'Neurologo')
SET IDENTITY_INSERT [dbo].[especialidades] OFF
GO
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (1, 7)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (2, 3)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (3, 3)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (4, 9)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (5, 4)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (7, 7)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (9, 4)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (10, 1)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (11, 8)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (12, 7)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (13, 1)
INSERT [dbo].[espemedi] ([matricula], [idEspecialidad]) VALUES (14, 2)
GO
SET IDENTITY_INSERT [dbo].[estudios] ON 

INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (1, N'Molestias', 1)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (2, N'Dolores De Cabeza', 1)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (3, N'Malestares Estomacales', 1)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (4, N'Dolor en la pierna', 1)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (5, N'Migraña', 1)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (6, N'Gastritis', 1)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (7, N'Inflamacion de tobillo', 1)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (8, N'Infeccion intestinal', 1)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (9, N'Dolor de espalda', 0)
INSERT [dbo].[estudios] ([idEstudio], [estudio], [activo]) VALUES (10, N'Fractura de brazo', 0)
SET IDENTITY_INSERT [dbo].[estudios] OFF
GO
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (1, 4)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (2, 4)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (3, 8)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (4, 7)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (5, 9)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (6, 8)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (7, 7)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (8, 8)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (9, 2)
INSERT [dbo].[estuespe] ([idEstudio], [idEspecialidad]) VALUES (10, 7)
GO
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (11254661, 1, 5, CAST(N'2022-07-02' AS Date), 9, N'OSDE', 1, N'Dificultad para respirar', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (11254661, 3, 2, CAST(N'2012-05-12' AS Date), 2, N'OSDE', 1, N'Dificultad para respirar', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (11344566, 1, 1, CAST(N'2013-09-29' AS Date), 1, N'OSDE', 1, N'Dificultad al caminar', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (12334211, 2, 1, CAST(N'2022-06-20' AS Date), 2, N'UP', 1, N'Dificultad para caminar', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (30998776, 1, 3, CAST(N'2022-07-01' AS Date), 13, N'OSESAC', 1, N'Dolores Musculares', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (31554778, 3, 3, CAST(N'2022-07-03' AS Date), 3, N'OSESAC', 1, N'Tos y dolor de cabeza', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (31554778, 8, 3, CAST(N'2022-07-05' AS Date), 10, N'OSESAC', 1, N'Dolor de Cabeza', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (31555123, 9, 3, CAST(N'2022-07-05' AS Date), 10, N'OSESAC', 1, N'Contracturas en en la espalda', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (33778996, 2, 3, CAST(N'2022-07-02' AS Date), 14, N'OSESAC', 1, N'Dolores en el lumbar', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (34998876, 8, 5, CAST(N'2022-07-05' AS Date), 8, N'OSESAC', 1, N'Dolor de espalda', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (35111999, 4, 4, CAST(N'2022-07-04' AS Date), 1, N'OSESAC', 1, N'Dolor de Cabeza', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (35111999, 10, 3, CAST(N'2022-07-05' AS Date), 10, N'OSESAC', 1, N'Dificultad para moverse', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (35443110, 5, 2, CAST(N'2015-02-22' AS Date), 7, N'OSDE', 1, N'Gastritis', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (38333210, 2, 1, CAST(N'2022-06-18' AS Date), 2, N'UP', 1, N'Congestion Nasal', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (38333210, 6, 3, CAST(N'2015-01-25' AS Date), 9, N'UP', 1, N'Molestias', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (39777456, 6, 5, CAST(N'2022-06-01' AS Date), 8, N'OSESAC', 1, N'Fiebre y dolor de cabeza', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (42996775, 10, 4, CAST(N'2022-07-04' AS Date), 11, N'OSESAC', 1, N'Dolor de estomago', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (43554667, 4, 2, CAST(N'2016-02-10' AS Date), 7, N'OSDE', 1, N'Contracturas', 0)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (43554667, 5, 1, CAST(N'2022-07-05' AS Date), 4, N'OSDE', 1, N'Fuerte Malestar', 1)
INSERT [dbo].[historias] ([dni], [idEstudio], [idInstituto], [fecha], [matricula], [sigla], [activo], [observaciones], [pagado]) VALUES (43554667, 8, 3, CAST(N'2017-01-09' AS Date), 10, N'OSDE', 1, N'Dolor de Cabeza', 1)
GO
SET IDENTITY_INSERT [dbo].[institutos] ON 

INSERT [dbo].[institutos] ([idInstituto], [instituto], [activo]) VALUES (1, N'Hospital Rivadavia', 1)
INSERT [dbo].[institutos] ([idInstituto], [instituto], [activo]) VALUES (2, N'Hospital Belgrano', 1)
INSERT [dbo].[institutos] ([idInstituto], [instituto], [activo]) VALUES (3, N'Hospital Militar', 1)
INSERT [dbo].[institutos] ([idInstituto], [instituto], [activo]) VALUES (4, N'Hospital Maternal', 1)
INSERT [dbo].[institutos] ([idInstituto], [instituto], [activo]) VALUES (5, N'Hospital Finoccietto', 1)
INSERT [dbo].[institutos] ([idInstituto], [instituto], [activo]) VALUES (6, N'Hospital Familiar', 1)
INSERT [dbo].[institutos] ([idInstituto], [instituto], [activo]) VALUES (7, N'Hospital De Niños', 1)
INSERT [dbo].[institutos] ([idInstituto], [instituto], [activo]) VALUES (8, N'Hospital Juan Pablo', 1)
SET IDENTITY_INSERT [dbo].[institutos] OFF
GO
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (1, N'Roberto', N'Garcia', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (2, N'Victoria', N'Sanchez', 1, N'F')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (3, N'Alejandro', N'Martinez', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (4, N'Hugo', N'Fernandez', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (5, N'Martin', N'Fernandez', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (6, N'Federico', N'suarez', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (7, N'Tomas', N'Camaño', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (8, N'Gabriel', N'Arrieto', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (9, N'Pilar', N'Martinez', 1, N'F')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (10, N'Julieta', N'Gonzalez', 1, N'F')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (11, N'Nestor', N'Batista', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (12, N'Silvia', N'alvarenga', 1, N'F')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (13, N'Marta', N'Gonzalez', 1, N'F')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (14, N'Nestor', N'Gonzalez', 1, N'M')
INSERT [dbo].[medicos] ([matricula], [nombre], [apellido], [activo], [sexo]) VALUES (15, N'Miriam', N'alvarenga', 1, N'F')
GO
INSERT [dbo].[OOSS] ([sigla], [nombre], [categoria]) VALUES (N'OSDE', N'OSDE', N'Obra Social')
INSERT [dbo].[OOSS] ([sigla], [nombre], [categoria]) VALUES (N'OSESAC', N'OSESAC', N'Obra Social')
INSERT [dbo].[OOSS] ([sigla], [nombre], [categoria]) VALUES (N'UP', N'UP', N'Prepaga')
GO
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (11254661, N'Marta', N'Vilas', N'F', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (11344566, N'Tomas', N'Nuñez', N'M', CAST(N'2013-09-29' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (11344577, N'Hugo', N'Nuñez', N'M', CAST(N'2017-01-09' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (12334211, N'Martin', N'Mendez', N'M', CAST(N'2014-05-14' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (12345271, N'Roberto', N'Garcia', N'M', CAST(N'2017-01-10' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (12445677, N'Maria', N'Garcia', N'F', CAST(N'2017-01-10' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (15344566, N'Mauricio', N'Camaño', N'M', CAST(N'2017-01-10' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (30998776, N'Carlos', N'Garcia', N'M', CAST(N'2015-02-22' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (31554778, N'Mariana', N'Suarez', N'F', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (31555123, N'Valentino', N'Fernandez', N'M', CAST(N'2016-02-10' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (33778996, N'Luciano', N'Fernandez', N'M', CAST(N'2015-01-25' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (34667888, N'Roberto', N'Fernandez', N'M', CAST(N'2015-01-25' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (34998876, N'Valentina', N'Viale', N'F', CAST(N'2017-01-09' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (35111999, N'Pilar', N'Aguero', N'F', CAST(N'2017-01-09' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (35443110, N'Ulises', N'Garcia', N'M', CAST(N'2015-02-22' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (38333210, N'Nestor', N'Fernandez', N'M', CAST(N'2015-01-25' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (38775222, N'Florencia', N'Suarez', N'F', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (39777456, N'Ezequiel', N'Sanchez', N'M', CAST(N'2016-02-10' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (40443110, N'Luciana', N'Suarez', N'F', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (42996775, N'Mauricio', N'Gomez', N'M', CAST(N'2015-02-22' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (43554667, N'Gaston', N'Fernandez', N'M', CAST(N'2016-02-10' AS Date))
INSERT [dbo].[pacientes] ([dni], [nombre], [apellido], [sexo], [nacimiento]) VALUES (43554668, N'Victoria', N'Aguero', N'F', CAST(N'2017-01-09' AS Date))
GO
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'OSDE', 1, N'Binario', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'OSDE', 2, N'Estudiante', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'OSDE', 3, N'Black', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'OSDE', 4, N'Extranjero', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'OSDE', 5, N'Jubilado', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'OSDE', 6, N'Premium', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'OSESAC', 1, N'Familiar', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'OSESAC', 2, N'Plus', 0)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'UP', 1, N'Clasic', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'UP', 2, N'Familiar', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'UP', 3, N'Plus', 1)
INSERT [dbo].[planes] ([sigla], [nroplan], [nombre], [activo]) VALUES (N'UP', 4, N'Bonus', 0)
GO
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (1, 1, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (1, 2, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (2, 1, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (3, 1, CAST(50 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (3, 2, CAST(350 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (4, 2, CAST(890 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (5, 1, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (5, 2, CAST(150 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (6, 3, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (7, 3, CAST(299 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (8, 3, CAST(50 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (9, 3, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[precios] ([idEstudio], [idInstituto], [precio]) VALUES (10, 3, CAST(300 AS Decimal(18, 0)))
GO
ALTER TABLE [dbo].[historias] ADD  DEFAULT ((1)) FOR [pagado]
GO
ALTER TABLE [dbo].[afiliados]  WITH CHECK ADD  CONSTRAINT [FK_Afiliados_Pacientes] FOREIGN KEY([dni])
REFERENCES [dbo].[pacientes] ([dni])
GO
ALTER TABLE [dbo].[afiliados] CHECK CONSTRAINT [FK_Afiliados_Pacientes]
GO
ALTER TABLE [dbo].[afiliados]  WITH CHECK ADD  CONSTRAINT [FK_Afiliados_Planes] FOREIGN KEY([sigla], [nroplan])
REFERENCES [dbo].[planes] ([sigla], [nroplan])
GO
ALTER TABLE [dbo].[afiliados] CHECK CONSTRAINT [FK_Afiliados_Planes]
GO
ALTER TABLE [dbo].[coberturas]  WITH CHECK ADD  CONSTRAINT [FK_Coberturas_Estudios] FOREIGN KEY([idEstudio])
REFERENCES [dbo].[estudios] ([idEstudio])
GO
ALTER TABLE [dbo].[coberturas] CHECK CONSTRAINT [FK_Coberturas_Estudios]
GO
ALTER TABLE [dbo].[coberturas]  WITH CHECK ADD  CONSTRAINT [FK_Coberturas_Planes] FOREIGN KEY([sigla], [nroplan])
REFERENCES [dbo].[planes] ([sigla], [nroplan])
GO
ALTER TABLE [dbo].[coberturas] CHECK CONSTRAINT [FK_Coberturas_Planes]
GO
ALTER TABLE [dbo].[espemedi]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadesMatriculas_Especialidades] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[especialidades] ([idEspecialidad])
GO
ALTER TABLE [dbo].[espemedi] CHECK CONSTRAINT [FK_EspecialidadesMatriculas_Especialidades]
GO
ALTER TABLE [dbo].[espemedi]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadesMatriculas_Matriculas] FOREIGN KEY([matricula])
REFERENCES [dbo].[medicos] ([matricula])
GO
ALTER TABLE [dbo].[espemedi] CHECK CONSTRAINT [FK_EspecialidadesMatriculas_Matriculas]
GO
ALTER TABLE [dbo].[estuespe]  WITH CHECK ADD  CONSTRAINT [FK_EstudiosEspecialidades_Especialidades] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[especialidades] ([idEspecialidad])
GO
ALTER TABLE [dbo].[estuespe] CHECK CONSTRAINT [FK_EstudiosEspecialidades_Especialidades]
GO
ALTER TABLE [dbo].[estuespe]  WITH CHECK ADD  CONSTRAINT [FK_EstudiosEspecialidades_Estudios] FOREIGN KEY([idEstudio])
REFERENCES [dbo].[estudios] ([idEstudio])
GO
ALTER TABLE [dbo].[estuespe] CHECK CONSTRAINT [FK_EstudiosEspecialidades_Estudios]
GO
ALTER TABLE [dbo].[historias]  WITH CHECK ADD  CONSTRAINT [FK_Historias_Afiliados] FOREIGN KEY([dni], [sigla])
REFERENCES [dbo].[afiliados] ([dni], [sigla])
GO
ALTER TABLE [dbo].[historias] CHECK CONSTRAINT [FK_Historias_Afiliados]
GO
ALTER TABLE [dbo].[historias]  WITH CHECK ADD  CONSTRAINT [FK_Historias_Medicos] FOREIGN KEY([matricula])
REFERENCES [dbo].[medicos] ([matricula])
GO
ALTER TABLE [dbo].[historias] CHECK CONSTRAINT [FK_Historias_Medicos]
GO
ALTER TABLE [dbo].[historias]  WITH CHECK ADD  CONSTRAINT [FK_Historias_Pacientes] FOREIGN KEY([dni])
REFERENCES [dbo].[pacientes] ([dni])
GO
ALTER TABLE [dbo].[historias] CHECK CONSTRAINT [FK_Historias_Pacientes]
GO
ALTER TABLE [dbo].[planes]  WITH CHECK ADD  CONSTRAINT [FK_Planes_OOSS] FOREIGN KEY([sigla])
REFERENCES [dbo].[OOSS] ([sigla])
GO
ALTER TABLE [dbo].[planes] CHECK CONSTRAINT [FK_Planes_OOSS]
GO
ALTER TABLE [dbo].[precios]  WITH CHECK ADD  CONSTRAINT [FK_Precios_Estudios] FOREIGN KEY([idEstudio])
REFERENCES [dbo].[estudios] ([idEstudio])
GO
ALTER TABLE [dbo].[precios] CHECK CONSTRAINT [FK_Precios_Estudios]
GO
ALTER TABLE [dbo].[precios]  WITH CHECK ADD  CONSTRAINT [FK_Precios_Institutos] FOREIGN KEY([idInstituto])
REFERENCES [dbo].[institutos] ([idInstituto])
GO
ALTER TABLE [dbo].[precios] CHECK CONSTRAINT [FK_Precios_Institutos]
GO
ALTER TABLE [dbo].[medicos]  WITH CHECK ADD CHECK  (([sexo]='F' OR [sexo]='M'))
GO
ALTER TABLE [dbo].[pacientes]  WITH CHECK ADD CHECK  (([sexo]='F' OR [sexo]='M'))
GO
