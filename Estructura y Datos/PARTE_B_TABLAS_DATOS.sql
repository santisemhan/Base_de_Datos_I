USE [TP2_Parte_B]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 6/7/2022 11:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 6/7/2022 11:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noticiaId] [int] NOT NULL,
	[texto] [varchar](max) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Noticias]    Script Date: 6/7/2022 11:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noticias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[autor] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privilegios]    Script Date: 6/7/2022 11:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privilegios](
	[usuarioId] [int] NOT NULL,
	[tipo] [varchar](50) NULL,
	[categoriaId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 6/7/2022 11:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[alias] [varchar](100) NOT NULL,
	[contraseña] [varchar](150) NOT NULL,
	[activo] [bit] NOT NULL,
	[correo_electronico] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votaciones]    Script Date: 6/7/2022 11:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noticiaId] [int] NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[fecha_fin] [datetime] NOT NULL,
	[pregunta] [varchar](max) NOT NULL,
	[respuesta_1] [varchar](max) NOT NULL,
	[respuesta_2] [varchar](max) NOT NULL,
	[respuesta_3] [varchar](max) NOT NULL,
	[votos_opcion_1] [int] NOT NULL,
	[votos_opcion_2] [int] NOT NULL,
	[votos_opcion_3] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (1, N'Politicas', N'Cuando tienen que ver con la vida política nacional o internacional.')
INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (2, N'Deportivas', N'Cuando relatan sucesos relevantes para las distintas comunidades deportivas del país.')
INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (3, N'Economicas', N'Cuando tienen que ver con la productividad, las finanzas o el mundo del dinero y del trabajo en general.')
INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (4, N'Culturales', N'Cuando se refieren a sucesos de la vida artística, literaria y cultural del país.')
INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (5, N'Sociales', N'Cuando relatan eventos de importancia comunitaria.')
INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (6, N'Farandula', N'O también de espectáculos, cuando abordan temáticas referidas a la moda, las estrellas de cine y televisión o la cultura pop.
')
INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (7, N'Policias', N'Cuando relatan sucesos vinculados con el crimen, la policía o el mundo detectivesco.
')
INSERT [dbo].[Categorias] ([id], [nombre], [descripcion]) VALUES (8, N'Cientifica', N'Cuando abordan temas de interés especializado en ciencia y tecnología.
')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Comentarios] ON 

INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (1, 7, N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 18, CAST(N'2021-06-25T11:25:04.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (2, 14, N'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 10, CAST(N'2021-12-15T01:01:35.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (3, 39, N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 32, CAST(N'2021-09-01T00:18:34.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (4, 14, N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 34, CAST(N'2019-04-05T15:52:34.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (5, 1, N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 35, CAST(N'2021-06-17T02:38:53.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (6, 26, N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 45, CAST(N'2021-04-27T01:05:13.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (7, 29, N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 20, CAST(N'2020-05-03T16:15:25.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (8, 12, N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 43, CAST(N'2022-05-29T18:58:42.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (9, 22, N'Fusce consequat. Nulla nisl. Nunc nisl.', 30, CAST(N'2021-12-07T07:41:09.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (10, 29, N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 20, CAST(N'2020-06-12T02:31:06.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (11, 31, N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 19, CAST(N'2019-10-19T13:00:39.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (12, 5, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 38, CAST(N'2019-07-07T06:14:53.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (13, 23, N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 26, CAST(N'2020-05-07T11:55:46.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (14, 29, N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 49, CAST(N'2020-03-22T03:12:45.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (15, 12, N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 36, CAST(N'2021-07-06T12:50:08.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (16, 12, N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 12, CAST(N'2021-06-15T01:58:49.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (17, 2, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 40, CAST(N'2022-03-04T03:05:36.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (18, 39, N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 7, CAST(N'2019-10-21T21:05:33.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (19, 39, N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 28, CAST(N'2020-11-15T09:31:32.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (20, 38, N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 14, CAST(N'2020-10-27T22:17:24.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (21, 31, N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 41, CAST(N'2021-01-21T02:02:52.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (22, 26, N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 54, CAST(N'2020-09-17T08:11:42.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (23, 20, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 48, CAST(N'2021-04-05T13:32:22.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (24, 20, N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 50, CAST(N'2021-01-07T14:26:19.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (25, 12, N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 29, CAST(N'2020-04-13T06:34:40.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (26, 13, N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 51, CAST(N'2020-09-06T21:37:16.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (27, 27, N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 14, CAST(N'2020-11-16T06:10:38.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (28, 2, N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 42, CAST(N'2019-03-24T07:46:02.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (29, 13, N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 21, CAST(N'2021-08-10T04:45:44.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (30, 8, N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 34, CAST(N'2021-05-08T01:29:42.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (31, 19, N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 43, CAST(N'2021-10-19T13:35:43.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (32, 9, N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 27, CAST(N'2020-10-16T00:05:26.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (33, 33, N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 53, CAST(N'2021-03-23T07:12:37.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (34, 2, N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 33, CAST(N'2021-05-04T07:22:36.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (35, 10, N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 46, CAST(N'2021-11-23T06:17:03.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (36, 18, N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 35, CAST(N'2020-10-10T18:21:08.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (37, 27, N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 12, CAST(N'2021-11-16T00:06:16.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (38, 20, N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 49, CAST(N'2022-03-12T14:22:31.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (39, 7, N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 7, CAST(N'2021-04-20T00:12:01.000' AS DateTime))
INSERT [dbo].[Comentarios] ([id], [noticiaId], [texto], [usuarioId], [fecha]) VALUES (40, 3, N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 48, CAST(N'2021-04-08T04:55:38.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comentarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Noticias] ON 

INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (1, N'magna bibendum imperdiet nullam orci pede venenatis', 1, 47, CAST(N'2022-03-11T06:54:55.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (2, N'sit amet eleifend pede libero quis orci nullam molestie', 3, 49, CAST(N'2021-11-18T09:09:47.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (3, N'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus', 3, 34, CAST(N'2019-10-17T04:52:13.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (4, N'sed magna at', 3, 32, CAST(N'2021-08-02T16:06:07.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (5, N'turpis adipiscing lorem vitae mattis nibh ligula nec sem', 8, 42, CAST(N'2019-05-29T03:22:23.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (6, N'in quam fringilla rhoncus mauris', 8, 11, CAST(N'2021-05-19T10:18:07.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (7, N'integer pede justo lacinia', 8, 6, CAST(N'2022-01-07T18:19:49.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (8, N'nonummy maecenas tincidunt lacus at velit vivamus', 1, 9, CAST(N'2021-07-25T18:32:07.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (9, N'augue vestibulum ante ipsum primis in faucibus', 5, 33, CAST(N'2021-07-25T02:00:52.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (10, N'orci mauris lacinia sapien quis libero nullam sit amet turpis', 5, 37, CAST(N'2022-02-23T11:55:01.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (11, N'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus', 3, 27, CAST(N'2019-10-25T02:46:34.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (12, N'sed vel enim sit amet nunc viverra dapibus nulla', 4, 36, CAST(N'2020-10-26T11:48:18.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (13, N'est lacinia nisi venenatis tristique fusce congue diam', 5, 40, CAST(N'2021-12-06T07:00:30.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (14, N'vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', 4, 43, CAST(N'2021-12-03T19:05:06.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (15, N'eu nibh quisque', 8, 18, CAST(N'2022-03-08T16:26:02.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (16, N'nibh ligula nec sem duis aliquam convallis nunc proin at', 5, 32, CAST(N'2021-06-27T19:09:10.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (17, N'lorem id ligula suspendisse ornare consequat', 7, 13, CAST(N'2021-03-24T12:53:54.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (18, N'eget rutrum at lorem integer tincidunt ante', 8, 28, CAST(N'2019-05-25T09:44:59.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (19, N'rhoncus aliquet pulvinar sed nisl nunc rhoncus dui', 8, 53, CAST(N'2020-10-05T00:48:41.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (20, N'dolor sit amet consectetuer adipiscing elit proin interdum', 1, 50, CAST(N'2022-01-19T09:36:43.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (21, N'nulla nisl nunc nisl duis bibendum', 5, 21, CAST(N'2022-06-11T14:46:10.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (22, N'et magnis dis', 2, 50, CAST(N'2021-12-26T09:17:47.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (23, N'phasellus id sapien in sapien', 4, 4, CAST(N'2019-10-28T16:12:58.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (24, N'convallis tortor risus dapibus', 2, 28, CAST(N'2021-02-14T11:23:10.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (25, N'parturient montes nascetur ridiculus mus vivamus vestibulum', 8, 45, CAST(N'2020-01-08T18:53:32.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (26, N'duis ac nibh fusce lacus purus aliquet', 6, 2, CAST(N'2022-04-05T08:09:47.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (27, N'accumsan tellus nisi eu orci mauris lacinia sapien', 2, 5, CAST(N'2021-08-15T15:43:29.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (28, N'justo nec condimentum', 1, 29, CAST(N'2020-03-03T09:02:44.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (29, N'ultrices libero non mattis pulvinar nulla pede ullamcorper', 1, 32, CAST(N'2019-03-02T23:16:37.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (30, N'integer ac neque duis bibendum morbi non quam nec dui', 8, 35, CAST(N'2020-12-02T13:16:18.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (31, N'lectus vestibulum quam sapien varius ut blandit', 3, 27, CAST(N'2020-07-18T09:13:07.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (32, N'sapien quis libero nullam', 4, 3, CAST(N'2022-03-24T02:43:28.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (33, N'felis sed lacus morbi sem mauris laoreet ut', 7, 30, CAST(N'2019-11-08T01:05:12.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (34, N'sapien ut nunc vestibulum ante ipsum primis in faucibus', 8, 47, CAST(N'2020-12-31T03:44:00.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (35, N'vitae mattis nibh ligula nec sem duis', 8, 17, CAST(N'2022-01-15T12:19:04.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (36, N'ac lobortis vel dapibus at diam nam tristique', 6, 30, CAST(N'2021-07-02T02:13:18.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (37, N'turpis enim blandit mi in porttitor', 6, 29, CAST(N'2019-04-23T09:40:03.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (38, N'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate', 5, 47, CAST(N'2021-05-06T21:06:35.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (39, N'mi integer ac', 5, 24, CAST(N'2021-08-16T05:07:26.000' AS DateTime))
INSERT [dbo].[Noticias] ([id], [titulo], [idCategoria], [autor], [fecha]) VALUES (40, N'elit proin risus praesent lectus vestibulum quam sapien varius', 5, 33, CAST(N'2019-11-23T14:40:45.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Noticias] OFF
GO
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (1, N'Crear Noticia', 8)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (2, N'Responsable', 8)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (3, N'Crear Noticia', 3)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (4, N'Responsable', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (5, N'Crear Noticia', 3)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (6, N'Crear Noticia', 3)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (7, N'Responsable', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (8, N'Responsable', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (9, N'Crear Noticia', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (10, N'Responsable', 5)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (11, N'Responsable', 2)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (12, N'Responsable', 3)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (13, N'Crear Noticia', 5)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (14, N'Crear Noticia', 6)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (15, N'Responsable', 8)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (16, N'Crear Noticia', 7)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (17, N'Responsable', 5)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (18, N'Crear Noticia', 6)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (19, N'Responsable', 1)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (20, N'Crear Noticia', 6)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (21, N'Crear Noticia', 6)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (22, N'Responsable', 6)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (23, N'Responsable', 5)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (24, N'Responsable', 6)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (25, N'Crear Noticia', 8)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (26, N'Crear Noticia', 5)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (27, N'Crear Noticia', 2)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (28, N'Crear Noticia', 1)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (29, N'Crear Noticia', 6)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (30, N'Crear Noticia', 3)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (31, N'Crear Noticia', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (32, N'Crear Noticia', 2)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (33, N'Crear Noticia', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (34, N'Crear Noticia', 1)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (35, N'Crear Noticia', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (36, N'Crear Noticia', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (37, N'Crear Noticia', 6)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (38, N'Crear Noticia', 8)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (39, N'Crear Noticia', 4)
INSERT [dbo].[Privilegios] ([usuarioId], [tipo], [categoriaId]) VALUES (40, N'Crear Noticia', 8)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (1, N'Santiago Semhan', N'santisemhan', N'123', 1, N'santisemhan2@gmail.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (2, N'Jenny Ends', N'jends0', N'password', 1, N'jends0@cisco.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (3, N'Marlo Fairbourne', N'mfairbourne1', N'mfairbourne1@php.net', 0, N'mfairbourne1@php.net')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (4, N'Kaycee', N'Felten', N'kfelten2', 1, N'kfelten2@dyndns.org')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (5, N'Lanie Jonuzi', N'ljonuzi1d', N'ZW3Qm5nk2j', 1, N'ljonuzi1d@ft.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (6, N'Natale Mitchard', N'nmitchard0', N'MXqXqVTvpyIN', 1, N'nmitchard0@jigsy.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (7, N'Marthe Beldham', N'mbeldham1', N'zLBoAww', 1, N'mbeldham1@scribd.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (8, N'Adore Kop', N'akop2', N'pttQ6F', 0, N'akop2@intel.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (9, N'Karlan Flasby', N'kflasby3', N'kxUDFhx5wL', 1, N'kflasby3@dot.gov')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (10, N'Keefe Richley', N'krichley4', N'dt46PRK', 1, N'krichley4@senate.gov')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (11, N'Lottie Kase', N'lkase5', N'sDMoxiC2FLL', 1, N'lkase5@opensource.org')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (12, N'Alfonso Ofen', N'aofen6', N'mCyf5IS', 1, N'aofen6@xrea.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (13, N'Base Tidbold', N'btidbold7', N'94XTBjgn', 1, N'btidbold7@free.fr')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (14, N'Tabbatha Maier', N'tmaier8', N's6y2IwtNB32d', 1, N'tmaier8@gmpg.org')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (15, N'Stefan Abrahmson', N'sabrahmson9', N'qRHUKKHXg1', 0, N'sabrahmson9@biglobe.ne.jp')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (16, N'Leonora Quinevan', N'lquinevana', N'Cykp2F', 1, N'lquinevana@acquirethisname.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (17, N'Feodora Creagh', N'fcreaghb', N'xHVPUJ7v', 0, N'fcreaghb@apache.org')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (18, N'Beale Capstake', N'bcapstakec', N'X045EVWbe', 1, N'bcapstakec@amazon.co.jp')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (19, N'Ermin Traviss', N'etravissd', N'1V9qoq', 1, N'etravissd@ed.gov')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (20, N'Tine Pheby', N'tphebye', N'LmDaWo7YANOl', 1, N'tphebye@bravesites.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (21, N'Reilly Ousby', N'rousbyf', N'zx4tcYfU0', 1, N'rousbyf@yahoo.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (22, N'Garrek Impett', N'gimpettg', N'okkOQuOKvy', 0, N'gimpettg@flickr.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (23, N'Marilin Cardenas', N'mcardenash', N'VE85pskXpJz', 1, N'mcardenash@sitemeter.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (24, N'Aubree Tong', N'atongi', N'rcsAIU', 1, N'atongi@blogspot.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (25, N'Lucine Cesaric', N'lcesaricj', N's6GjPhrDJ3U', 0, N'lcesaricj@desdev.cn')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (26, N'Laney Kirrage', N'lkirragek', N'QPEVhHR', 1, N'lkirragek@cloudflare.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (27, N'Early Mortlock', N'emortlockl', N'OvoQZL2puzU', 1, N'emortlockl@bbb.org')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (28, N'Dyanna Vearnals', N'dvearnalsm', N'rBn0Ku1', 1, N'dvearnalsm@weebly.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (29, N'Alexandros Northage', N'anorthagen', N'3QhAj5DNwINj', 1, N'anorthagen@weibo.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (30, N'Gaspard Mongan', N'gmongano', N'f94BO2PZjC71', 1, N'gmongano@edublogs.org')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (31, N'Lanie Sorensen', N'lsorensenp', N'DubQAZM4', 0, N'lsorensenp@ca.gov')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (32, N'Goldarina Milvarnie', N'gmilvarnieq', N'ZPmAZ4VxPZ', 0, N'gmilvarnieq@ocn.ne.jp')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (33, N'Enrique Sugar', N'esugarr', N'OZSnik', 1, N'esugarr@tripod.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (34, N'Lowell McVitty', N'lmcvittys', N'fVYiMcN', 1, N'lmcvittys@ca.gov')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (35, N'Pauly Franies', N'pfraniest', N'yTaXrdwp2xsC', 1, N'pfraniest@qq.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (36, N'Avrit Faithorn', N'afaithornu', N'RP3giIQ', 0, N'afaithornu@ft.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (37, N'Janie Wyper', N'jwyperv', N'maM0dV', 0, N'jwyperv@army.mil')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (38, N'Craig Wasbrough', N'cwasbroughw', N'dRMUAQ2', 1, N'cwasbroughw@usatoday.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (39, N'Tallou Gerrie', N'tgerriex', N'sj2p3Jzk', 1, N'tgerriex@macromedia.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (40, N'Gertrud Jaram', N'gjaramy', N'oFP46MM2Bhq', 1, N'gjaramy@wikispaces.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (41, N'Waylan Snowdon', N'wsnowdonz', N'9Rr9cXr', 1, N'wsnowdonz@indiegogo.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (42, N'Andra Thresher', N'athresher10', N's4sBRp', 1, N'athresher10@t.co')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (43, N'Eleonora Daspar', N'edaspar11', N'J92XnfP3sq', 1, N'edaspar11@usgs.gov')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (44, N'Ruy Stansbury', N'rstansbury12', N'f3MQ1oAI', 1, N'rstansbury12@bbc.co.uk')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (45, N'Budd Wimpeney', N'bwimpeney13', N'L9FU7jgrTD', 0, N'bwimpeney13@ox.ac.uk')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (46, N'Dion Draper', N'ddraper14', N'MItCe2z7niV', 0, N'ddraper14@imgur.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (47, N'Mallissa Legerton', N'mlegerton15', N'UoVp7M6', 0, N'mlegerton15@mtv.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (48, N'Eberto Antoniades', N'eantoniades16', N'fjBrFFMp1', 1, N'eantoniades16@shinystat.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (49, N'Marylou Duplock', N'mduplock17', N'4A6bEOZZ', 0, N'mduplock17@webeden.co.uk')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (50, N'Tiffy Plascott', N'tplascott18', N'05yxI3', 0, N'tplascott18@wunderground.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (51, N'Maximo Gobolos', N'mgobolos19', N'6oi0N9Ri4pQ', 1, N'mgobolos19@blinklist.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (52, N'Shalne Cuss', N'scuss1a', N'WfPIpKKNN', 1, N'scuss1a@t-online.de')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (53, N'Kylila Dederick', N'kdederick1b', N'OIqoIapq', 0, N'kdederick1b@answers.com')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (54, N'Reuben Jiles', N'rjiles1c', N'zOPYLxN', 0, N'rjiles1c@google.com.au')
INSERT [dbo].[Usuarios] ([id], [nombre], [alias], [contraseña], [activo], [correo_electronico]) VALUES (55, N'Rollo Poluzzi', N'rpoluzzi1d', N'iAOQADS4fN', 1, N'rpoluzzi1d@drupal.org')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Votaciones] ON 

INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (41, 1, CAST(N'2021-04-20T04:51:41.000' AS DateTime), CAST(N'2022-03-04T11:22:26.000' AS DateTime), N'odio cras mi pede malesuada in', N'faucibus accumsan odio curabitur convallis duis consequat dui nec', N'nonummy integer non velit donec diam neque vestibulum', N'vel nulla eget eros elementum pellentesque quisque porta volutpat erat', 11, 11, 40)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (42, 2, CAST(N'2021-04-17T09:35:53.000' AS DateTime), CAST(N'2021-10-31T21:53:40.000' AS DateTime), N'nisi nam ultrices libero non', N'quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in', N'tellus in sagittis dui vel nisl duis', N'quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis', 31, 49, 4)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (43, 3, CAST(N'2021-04-13T15:38:11.000' AS DateTime), CAST(N'2021-11-27T15:53:44.000' AS DateTime), N'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui', N'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', N'iaculis justo in hac habitasse platea dictumst etiam faucibus', N'leo odio condimentum id luctus', 33, 31, 22)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (44, 4, CAST(N'2021-04-21T01:52:12.000' AS DateTime), CAST(N'2021-11-18T21:32:09.000' AS DateTime), N'praesent id massa id nisl venenatis', N'adipiscing molestie hendrerit at vulputate vitae nisl aenean', N'et tempus semper est quam pharetra magna ac', N'tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat', 8, 13, 33)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (45, 5, CAST(N'2021-04-18T12:52:45.000' AS DateTime), CAST(N'2022-04-15T15:24:50.000' AS DateTime), N'massa tempor convallis nulla neque libero convallis eget', N'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in', N'ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus', N'cubilia curae nulla dapibus dolor vel est donec odio', 21, 19, 19)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (46, 6, CAST(N'2021-04-22T22:26:08.000' AS DateTime), CAST(N'2021-09-02T13:38:38.000' AS DateTime), N'id nulla ultrices aliquet maecenas leo odio', N'eget congue eget semper rutrum nulla nunc purus phasellus in felis', N'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla', N'eget semper rutrum nulla nunc purus phasellus in', 20, 23, 29)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (47, 7, CAST(N'2021-04-12T05:55:47.000' AS DateTime), CAST(N'2022-02-26T09:33:50.000' AS DateTime), N'vulputate nonummy maecenas tincidunt lacus at velit vivamus', N'rhoncus aliquam lacus morbi quis tortor', N'sed nisl nunc rhoncus dui vel sem sed', N'ut odio cras mi pede malesuada', 4, 25, 43)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (48, 8, CAST(N'2021-04-10T13:24:10.000' AS DateTime), CAST(N'2021-11-24T01:33:16.000' AS DateTime), N'tellus nisi eu orci mauris lacinia sapien quis libero', N'ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', N'dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus', N'ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo', 25, 8, 9)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (49, 9, CAST(N'2021-04-27T02:35:48.000' AS DateTime), CAST(N'2022-04-11T09:39:53.000' AS DateTime), N'elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor', N'odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae', N'potenti nullam porttitor lacus at turpis donec posuere metus vitae', N'porta volutpat erat quisque erat eros viverra eget', 23, 19, 10)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (50, 10, CAST(N'2021-04-26T14:47:01.000' AS DateTime), CAST(N'2021-07-07T02:56:45.000' AS DateTime), N'eu magna vulputate luctus cum sociis natoque penatibus et magnis', N'dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris', N'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum', N'augue vestibulum rutrum rutrum neque aenean auctor gravida', 21, 22, 25)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (51, 11, CAST(N'2021-04-22T17:53:34.000' AS DateTime), CAST(N'2022-05-11T02:22:37.000' AS DateTime), N'enim sit amet nunc viverra dapibus nulla suscipit', N'sed vestibulum sit amet cursus id turpis integer aliquet massa id', N'eget semper rutrum nulla nunc purus phasellus in felis donec', N'consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae', 28, 28, 25)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (52, 12, CAST(N'2021-04-19T08:04:27.000' AS DateTime), CAST(N'2021-08-12T21:48:55.000' AS DateTime), N'interdum eu tincidunt in leo maecenas pulvinar lobortis', N'pretium quis lectus suspendisse potenti in eleifend quam a odio in', N'primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel', N'quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus', 5, 45, 22)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (53, 13, CAST(N'2021-04-23T01:11:40.000' AS DateTime), CAST(N'2022-05-30T17:30:57.000' AS DateTime), N'nisl aenean lectus pellentesque eget nunc donec quis', N'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a', N'sapien arcu sed augue aliquam erat volutpat', N'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id', 16, 36, 43)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (54, 14, CAST(N'2021-04-10T13:04:21.000' AS DateTime), CAST(N'2021-09-27T03:14:48.000' AS DateTime), N'felis sed interdum venenatis turpis enim', N'eu massa donec dapibus duis at velit eu est congue elementum', N'faucibus orci luctus et ultrices posuere', N'volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim', 32, 40, 22)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (55, 15, CAST(N'2021-04-04T08:35:18.000' AS DateTime), CAST(N'2021-06-24T01:15:47.000' AS DateTime), N'lacus purus aliquet at feugiat', N'in purus eu magna vulputate luctus cum sociis', N'aliquam augue quam sollicitudin vitae consectetuer eget', N'nulla elit ac nulla sed vel enim sit amet nunc viverra', 38, 22, 33)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (56, 16, CAST(N'2021-04-20T23:33:11.000' AS DateTime), CAST(N'2021-12-07T03:19:00.000' AS DateTime), N'erat id mauris vulputate elementum nullam varius nulla facilisi cras', N'quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi', N'nisi volutpat eleifend donec ut dolor morbi vel', N'venenatis turpis enim blandit mi in porttitor pede justo', 26, 36, 30)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (57, 17, CAST(N'2021-04-28T11:48:34.000' AS DateTime), CAST(N'2021-06-12T11:32:40.000' AS DateTime), N'ultrices aliquet maecenas leo odio condimentum', N'amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum', N'adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc', N'elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 14, 9, 30)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (58, 18, CAST(N'2021-04-12T11:02:33.000' AS DateTime), CAST(N'2021-12-17T22:38:03.000' AS DateTime), N'ipsum aliquam non mauris morbi non lectus aliquam', N'tempor turpis nec euismod scelerisque quam turpis', N'nulla dapibus dolor vel est donec odio', N'eros elementum pellentesque quisque porta volutpat erat quisque erat eros', 10, 11, 41)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (59, 19, CAST(N'2021-04-24T06:12:09.000' AS DateTime), CAST(N'2022-03-03T16:18:57.000' AS DateTime), N'condimentum curabitur in libero ut massa volutpat', N'in ante vestibulum ante ipsum primis in faucibus orci luctus et', N'erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer', N'massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar', 42, 41, 28)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (60, 20, CAST(N'2021-04-14T12:07:42.000' AS DateTime), CAST(N'2022-03-13T13:33:36.000' AS DateTime), N'ipsum praesent blandit lacinia erat vestibulum sed magna', N'vestibulum rutrum rutrum neque aenean auctor gravida', N'accumsan tortor quis turpis sed', N'non mauris morbi non lectus aliquam sit amet diam in magna bibendum', 40, 44, 34)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (61, 21, CAST(N'2021-04-14T10:05:02.000' AS DateTime), CAST(N'2021-07-11T20:20:23.000' AS DateTime), N'amet consectetuer adipiscing elit proin', N'a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', N'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec', N'sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris', 44, 38, 30)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (62, 22, CAST(N'2021-04-13T16:18:33.000' AS DateTime), CAST(N'2022-05-25T08:50:50.000' AS DateTime), N'curae duis faucibus accumsan odio', N'eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis', N'nunc proin at turpis a pede posuere', N'vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', 36, 3, 8)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (63, 23, CAST(N'2021-04-06T13:29:55.000' AS DateTime), CAST(N'2021-11-02T08:19:51.000' AS DateTime), N'orci luctus et ultrices posuere cubilia curae mauris', N'consequat metus sapien ut nunc vestibulum ante ipsum', N'ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque', N'nulla ut erat id mauris', 4, 4, 25)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (64, 24, CAST(N'2021-04-07T09:04:24.000' AS DateTime), CAST(N'2021-06-29T14:08:53.000' AS DateTime), N'lorem vitae mattis nibh ligula nec sem', N'vestibulum ac est lacinia nisi venenatis tristique', N'blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing', N'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus', 48, 2, 40)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (65, 25, CAST(N'2021-04-13T00:36:36.000' AS DateTime), CAST(N'2021-09-21T23:31:44.000' AS DateTime), N'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus', N'massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi', N'commodo placerat praesent blandit nam nulla integer pede justo lacinia', N'habitasse platea dictumst etiam faucibus', 46, 22, 48)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (66, 26, CAST(N'2021-04-27T16:46:16.000' AS DateTime), CAST(N'2022-04-23T04:05:17.000' AS DateTime), N'volutpat convallis morbi odio odio elementum', N'at turpis a pede posuere nonummy integer', N'in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum', N'viverra eget congue eget semper rutrum nulla nunc purus phasellus in', 13, 9, 30)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (67, 27, CAST(N'2021-04-11T13:53:21.000' AS DateTime), CAST(N'2021-07-23T00:52:20.000' AS DateTime), N'ipsum primis in faucibus orci luctus et ultrices posuere cubilia', N'sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus', N'tempus vivamus in felis eu sapien cursus vestibulum proin eu mi', N'posuere cubilia curae nulla dapibus', 34, 37, 21)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (68, 28, CAST(N'2021-04-14T16:22:14.000' AS DateTime), CAST(N'2021-05-23T19:30:07.000' AS DateTime), N'nulla elit ac nulla sed vel', N'lectus pellentesque at nulla suspendisse potenti cras in purus eu', N'volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam', N'nunc proin at turpis a pede', 23, 33, 11)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (69, 29, CAST(N'2021-04-24T08:15:41.000' AS DateTime), CAST(N'2022-03-07T04:30:46.000' AS DateTime), N'nec dui luctus rutrum nulla', N'interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices', N'vitae quam suspendisse potenti nullam porttitor lacus at', N'nam nulla integer pede justo', 24, 29, 22)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (70, 30, CAST(N'2021-04-09T15:32:33.000' AS DateTime), CAST(N'2022-04-15T20:17:10.000' AS DateTime), N'quisque erat eros viverra eget congue eget semper', N'semper interdum mauris ullamcorper purus sit amet nulla quisque', N'in sagittis dui vel nisl duis', N'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna', 3, 36, 20)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (71, 31, CAST(N'2021-04-28T14:11:38.000' AS DateTime), CAST(N'2021-05-29T15:49:22.000' AS DateTime), N'donec posuere metus vitae ipsum aliquam non mauris morbi non', N'nam congue risus semper porta volutpat quam pede', N'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci', N'a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id', 23, 38, 49)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (72, 32, CAST(N'2021-04-24T22:42:32.000' AS DateTime), CAST(N'2021-07-06T21:11:16.000' AS DateTime), N'posuere nonummy integer non velit', N'in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae', N'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus', N'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in', 35, 48, 33)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (73, 33, CAST(N'2021-04-09T10:23:39.000' AS DateTime), CAST(N'2021-12-10T04:13:06.000' AS DateTime), N'a suscipit nulla elit ac nulla sed vel enim sit', N'sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante', N'leo maecenas pulvinar lobortis est phasellus', N'ipsum praesent blandit lacinia erat vestibulum sed magna', 40, 5, 15)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (74, 34, CAST(N'2021-04-24T18:58:23.000' AS DateTime), CAST(N'2021-06-01T05:46:56.000' AS DateTime), N'ac diam cras pellentesque volutpat dui maecenas tristique', N'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse', N'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio', N'quam pede lobortis ligula sit amet eleifend pede', 39, 30, 23)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (75, 35, CAST(N'2021-04-17T07:57:43.000' AS DateTime), CAST(N'2022-03-07T10:18:02.000' AS DateTime), N'quisque arcu libero rutrum ac lobortis vel', N'nam nulla integer pede justo lacinia', N'dolor sit amet consectetuer adipiscing elit', N'faucibus orci luctus et ultrices posuere cubilia curae', 7, 3, 1)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (76, 36, CAST(N'2021-04-23T11:29:57.000' AS DateTime), CAST(N'2021-07-07T16:03:31.000' AS DateTime), N'maecenas tristique est et tempus semper est quam', N'pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor', N'odio donec vitae nisi nam ultrices libero non mattis', N'libero quis orci nullam molestie nibh', 19, 5, 45)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (77, 37, CAST(N'2021-04-07T13:09:34.000' AS DateTime), CAST(N'2021-09-21T19:19:34.000' AS DateTime), N'ut erat id mauris vulputate', N'velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla', N'quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a', N'massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede', 11, 23, 34)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (78, 38, CAST(N'2021-04-16T17:21:25.000' AS DateTime), CAST(N'2022-02-10T19:28:35.000' AS DateTime), N'dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum', N'quisque porta volutpat erat quisque erat eros viverra eget congue eget', N'ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', N'nam congue risus semper porta volutpat quam pede lobortis ligula sit', 4, 32, 9)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (79, 39, CAST(N'2021-04-07T20:31:32.000' AS DateTime), CAST(N'2022-05-19T23:26:12.000' AS DateTime), N'et magnis dis parturient montes nascetur', N'tellus nisi eu orci mauris lacinia sapien quis libero nullam', N'cras mi pede malesuada in imperdiet et', N'sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque', 37, 34, 4)
INSERT [dbo].[Votaciones] ([id], [noticiaId], [fecha_inicio], [fecha_fin], [pregunta], [respuesta_1], [respuesta_2], [respuesta_3], [votos_opcion_1], [votos_opcion_2], [votos_opcion_3]) VALUES (80, 40, CAST(N'2021-04-10T02:37:03.000' AS DateTime), CAST(N'2022-01-02T02:53:49.000' AS DateTime), N'congue risus semper porta volutpat quam pede lobortis ligula sit', N'nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper', N'ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id', N'nullam orci pede venenatis non sodales sed tincidunt', 17, 11, 3)
SET IDENTITY_INSERT [dbo].[Votaciones] OFF
GO
ALTER TABLE [dbo].[Noticias] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD FOREIGN KEY([noticiaId])
REFERENCES [dbo].[Noticias] ([id])
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Noticias]  WITH CHECK ADD FOREIGN KEY([autor])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Noticias]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Privilegios]  WITH CHECK ADD FOREIGN KEY([categoriaId])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Privilegios]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Votaciones]  WITH CHECK ADD FOREIGN KEY([noticiaId])
REFERENCES [dbo].[Noticias] ([id])
GO
ALTER TABLE [dbo].[Privilegios]  WITH CHECK ADD CHECK  (([tipo]='Responsable' OR [tipo]='Crear Noticia'))
GO
