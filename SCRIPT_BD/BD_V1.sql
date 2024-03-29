USE [master]
GO
/****** Object:  Database [BD_SGIAMTv1]    Script Date: 26/07/2022 22:39:33 ******/
CREATE DATABASE [BD_SGIAMTv1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_SGIAMTv1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_SGIAMTv1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_SGIAMTv1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_SGIAMTv1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_SGIAMTv1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_SGIAMTv1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_SGIAMTv1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_SGIAMTv1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_SGIAMTv1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_SGIAMTv1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_SGIAMTv1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_SGIAMTv1] SET  MULTI_USER 
GO
ALTER DATABASE [BD_SGIAMTv1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_SGIAMTv1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_SGIAMTv1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_SGIAMTv1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_SGIAMTv1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_SGIAMTv1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_SGIAMTv1', N'ON'
GO
ALTER DATABASE [BD_SGIAMTv1] SET QUERY_STORE = OFF
GO
USE [BD_SGIAMTv1]
GO
/****** Object:  Table [dbo].[E_Espectador]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[E_Espectador](
	[PK_VES_Dni] [nvarchar](50) NOT NULL,
	[VES_NombreCompleto] [nvarchar](50) NULL,
	[VES_Email] [nvarchar](50) NULL,
	[FK_IC_IdConcurso] [int] NULL,
 CONSTRAINT [PK_E_Espectador] PRIMARY KEY CLUSTERED 
(
	[PK_VES_Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Categoria]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Categoria](
	[PK_ICA_CodCat] [int] IDENTITY(1,1) NOT NULL,
	[VCA_NomCategoria] [varchar](50) NULL,
	[ICA_AnioInicio] [int] NULL,
	[ICA_AnioFin] [int] NULL,
 CONSTRAINT [PK_T_Categoria] PRIMARY KEY CLUSTERED 
(
	[PK_ICA_CodCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Concurso]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Concurso](
	[PK_IC_IdConcurso] [int] IDENTITY(1,1) NOT NULL,
	[VC_NombreCon] [varchar](50) NULL,
	[VC_LugarCon] [varchar](50) NULL,
	[DTC_FechaInicio] [smalldatetime] NULL,
	[VC_Estado] [varchar](50) NULL,
	[DTC_FechaFin] [smalldatetime] NULL,
	[IC_Capacidad] [int] NULL,
 CONSTRAINT [PK_T_Concurso] PRIMARY KEY CLUSTERED 
(
	[PK_IC_IdConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Concurso_Participado]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Concurso_Participado](
	[PK_ICPA_Cod] [int] NOT NULL,
	[VCPA_NombreConcurso] [varchar](50) NULL,
	[VCPA_Periodo] [varchar](50) NULL,
	[VCPA_NombreAcademia] [varchar](50) NULL,
 CONSTRAINT [PK_T_Concurso_Participado] PRIMARY KEY CLUSTERED 
(
	[PK_ICPA_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Concurso_Precio]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Concurso_Precio](
	[PK_ICP_IdConcurso] [int] NOT NULL,
	[PK_ICP_CodPrecio] [int] NOT NULL,
	[DCP_Monto] [decimal](18, 2) NULL,
 CONSTRAINT [PK_T_Concurso_Precio] PRIMARY KEY CLUSTERED 
(
	[PK_ICP_IdConcurso] ASC,
	[PK_ICP_CodPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Inscripcion]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Inscripcion](
	[PK_II_Cod] [int] IDENTITY(1,1) NOT NULL,
	[DI_Monto] [decimal](18, 2) NULL,
	[DTI_Fecha] [smalldatetime] NULL,
	[VB_ArchivoPago] [varbinary](max) NULL,
	[FK_IUM_CodUm] [int] NULL,
 CONSTRAINT [PK_T_Inscripcion] PRIMARY KEY CLUSTERED 
(
	[PK_II_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Marinera]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Marinera](
	[PK_IM_CodMar] [int] NOT NULL,
	[VM_Nombre] [varchar](100) NULL,
	[IM_FlagDificultad] [int] NULL,
 CONSTRAINT [PK_T_Marinera] PRIMARY KEY CLUSTERED 
(
	[PK_IM_CodMar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Modalidad_Concurso]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Modalidad_Concurso](
	[PK_IM_CodigoMod] [int] NOT NULL,
	[VM_NombreMod] [varchar](50) NULL,
 CONSTRAINT [PK_T_ModalidadCon] PRIMARY KEY CLUSTERED 
(
	[PK_IM_CodigoMod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Precio]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Precio](
	[PK_IPRE_CodPrecio] [int] NOT NULL,
	[VPRE_Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_Precio] PRIMARY KEY CLUSTERED 
(
	[PK_IPRE_CodPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Puntaje]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Puntaje](
	[PK_IP_Cod] [int] IDENTITY(1,1) NOT NULL,
	[IP_Puntaje] [int] NULL,
	[VP_NumeroJurado] [nvarchar](100) NULL,
	[FK_IUMT_UsuModTan] [varchar](50) NULL,
 CONSTRAINT [PK_T_Puntaje] PRIMARY KEY CLUSTERED 
(
	[PK_IP_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Tanda]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Tanda](
	[PK_IT_CodTan] [int] IDENTITY(1,1) NOT NULL,
	[IT_Ganador] [int] NULL,
	[VT_Tipo_Tanda] [int] NULL,
	[VT_Estado] [varchar](50) NULL,
	[VT_Descripcion] [varchar](50) NULL,
	[IT_CodigoConcurso] [int] NULL,
	[FK_IM_CodMar] [int] NULL,
 CONSTRAINT [PK_T_Tanda] PRIMARY KEY CLUSTERED 
(
	[PK_IT_CodTan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Tipo_Usuario]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Tipo_Usuario](
	[PK_ITU_TipoUsuario] [int] NOT NULL,
	[VTU_nombreTipoUsuario] [varchar](50) NULL,
 CONSTRAINT [PK_T_tipoUsuario] PRIMARY KEY CLUSTERED 
(
	[PK_ITU_TipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Usuario]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Usuario](
	[PK_VU_Dni] [varchar](50) NOT NULL,
	[VU_Nombre] [varchar](50) NULL,
	[VU_APaterno] [varchar](50) NULL,
	[VU_AMaterno] [varchar](50) NULL,
	[DTU_FechaNacimiento] [smalldatetime] NULL,
	[VU_Contrasenia] [varchar](50) NULL,
	[VU_Sexo] [varchar](50) NULL,
	[VU_NAcademia] [varchar](50) NULL,
	[VU_Correo] [varchar](50) NULL,
	[VU_Celular] [varchar](50) NULL,
	[VBU_ArchivoUsuario] [varbinary](max) NULL,
	[FK_ICA_CodCat] [int] NULL,
	[FK_ITU_TipoUsuario] [int] NULL,
 CONSTRAINT [PK_T_Usuario] PRIMARY KEY CLUSTERED 
(
	[PK_VU_Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Usuario_Modalidad]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Usuario_Modalidad](
	[PK_IUM_CodPart] [int] NOT NULL,
	[VUM_Fase] [varchar](50) NULL,
	[DTUM_FechaIns] [smalldatetime] NULL,
	[IUM_Estado] [int] NULL,
	[FK_IM_IdModalidad] [int] NULL,
	[FK_IC_IdConcurso] [int] NULL,
	[FK_VU_Dni] [varchar](50) NULL,
	[FK_VU_DniPareja] [varchar](50) NULL,
 CONSTRAINT [PK_T_Usuario_Modalidad] PRIMARY KEY CLUSTERED 
(
	[PK_IUM_CodPart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Usuario_Modalidad_Tanda]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Usuario_Modalidad_Tanda](
	[PK_IUMT_CodUsuModTan] [varchar](50) NOT NULL,
	[IUMT_PuntajeTotal] [int] NULL,
	[IUMT_Pista] [int] NULL,
	[IUMT_Estado] [int] NULL,
	[FK_IUM_CodUM] [int] NULL,
	[FK_IT_CodTan] [int] NULL,
 CONSTRAINT [PK_T_Usuario_Modalidad_Tanda] PRIMARY KEY CLUSTERED 
(
	[PK_IUMT_CodUsuModTan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Usuario_X_Concurso_Participado]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Usuario_X_Concurso_Participado](
	[PK_IUCP_Cod] [varchar](50) NOT NULL,
	[IUCP_PuntajeTotal] [int] NULL,
	[IUCP_Puesto] [int] NULL,
	[IUCP_Modalidad] [int] NULL,
	[FK_VU_Dni] [varchar](50) NULL,
	[FK_ICPA_Cod] [int] NULL,
 CONSTRAINT [PK_T_Usuario_X_Concurso_Participado] PRIMARY KEY CLUSTERED 
(
	[PK_IUCP_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Categoria] ON 

INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (-1, N'Ninguna', NULL, NULL)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (1, N'Pre Infante', 2017, 2019)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (2, N'Infante', 2013, 2016)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (3, N'Infantil', 2009, 2012)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (4, N'Junior', 2005, 2008)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (5, N'Juvenil', 2001, 2004)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (6, N'Adulto', 1988, 2000)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (7, N'Senior', 1973, 1987)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (8, N'Master', 1959, 1972)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (9, N'Oro', 1900, 1958)
SET IDENTITY_INSERT [dbo].[T_Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Concurso] ON 

INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaInicio], [VC_Estado], [DTC_FechaFin], [IC_Capacidad]) VALUES (1, N'I Concurso TusuyPeru', N'Coliseo Ricardo Bentin', CAST(N'2019-11-10T00:00:00' AS SmallDateTime), N'No Realizado', NULL, NULL)
INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaInicio], [VC_Estado], [DTC_FechaFin], [IC_Capacidad]) VALUES (2, N'II Concurso Tusuy Peru', N'Colegio Antenor Orrego', CAST(N'2020-08-19T00:00:00' AS SmallDateTime), N'No Realizado', NULL, NULL)
INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaInicio], [VC_Estado], [DTC_FechaFin], [IC_Capacidad]) VALUES (3, N'III Concurso Tusuy Peru', N'Coliseo 1', CAST(N'2020-07-21T00:00:00' AS SmallDateTime), N'Realizado', NULL, NULL)
INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaInicio], [VC_Estado], [DTC_FechaFin], [IC_Capacidad]) VALUES (4, N'IV CONCURSO', N'Coliseo 3', CAST(N'2020-09-02T00:00:00' AS SmallDateTime), N'No Realizado', NULL, NULL)
INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaInicio], [VC_Estado], [DTC_FechaFin], [IC_Capacidad]) VALUES (5, N'6° concurso', N'Coliseo Ricardo Bentin', CAST(N'2020-08-06T00:00:00' AS SmallDateTime), N'No Realizado', NULL, NULL)
SET IDENTITY_INSERT [dbo].[T_Concurso] OFF
GO
INSERT [dbo].[T_Modalidad_Concurso] ([PK_IM_CodigoMod], [VM_NombreMod]) VALUES (1, N'Seriado')
INSERT [dbo].[T_Modalidad_Concurso] ([PK_IM_CodigoMod], [VM_NombreMod]) VALUES (2, N'Novel')
GO
INSERT [dbo].[T_Tipo_Usuario] ([PK_ITU_TipoUsuario], [VTU_nombreTipoUsuario]) VALUES (1, N'Participante')
INSERT [dbo].[T_Tipo_Usuario] ([PK_ITU_TipoUsuario], [VTU_nombreTipoUsuario]) VALUES (2, N'Gerente')
INSERT [dbo].[T_Tipo_Usuario] ([PK_ITU_TipoUsuario], [VTU_nombreTipoUsuario]) VALUES (3, N'Recepcionista')
INSERT [dbo].[T_Tipo_Usuario] ([PK_ITU_TipoUsuario], [VTU_nombreTipoUsuario]) VALUES (4, N'Jurado')
INSERT [dbo].[T_Tipo_Usuario] ([PK_ITU_TipoUsuario], [VTU_nombreTipoUsuario]) VALUES (5, N'Staff')
INSERT [dbo].[T_Tipo_Usuario] ([PK_ITU_TipoUsuario], [VTU_nombreTipoUsuario]) VALUES (6, N'Presentador')
GO
ALTER TABLE [dbo].[E_Espectador]  WITH CHECK ADD  CONSTRAINT [FK_E_Espectador_T_Concurso] FOREIGN KEY([FK_IC_IdConcurso])
REFERENCES [dbo].[T_Concurso] ([PK_IC_IdConcurso])
GO
ALTER TABLE [dbo].[E_Espectador] CHECK CONSTRAINT [FK_E_Espectador_T_Concurso]
GO
ALTER TABLE [dbo].[T_Concurso_Precio]  WITH CHECK ADD  CONSTRAINT [FK_T_Concurso_Precio_T_Concurso] FOREIGN KEY([PK_ICP_IdConcurso])
REFERENCES [dbo].[T_Concurso] ([PK_IC_IdConcurso])
GO
ALTER TABLE [dbo].[T_Concurso_Precio] CHECK CONSTRAINT [FK_T_Concurso_Precio_T_Concurso]
GO
ALTER TABLE [dbo].[T_Concurso_Precio]  WITH CHECK ADD  CONSTRAINT [FK_T_Concurso_Precio_T_Precio] FOREIGN KEY([PK_ICP_IdConcurso])
REFERENCES [dbo].[T_Precio] ([PK_IPRE_CodPrecio])
GO
ALTER TABLE [dbo].[T_Concurso_Precio] CHECK CONSTRAINT [FK_T_Concurso_Precio_T_Precio]
GO
ALTER TABLE [dbo].[T_Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_T_Inscripcion_T_Usuario_Modalidad] FOREIGN KEY([FK_IUM_CodUm])
REFERENCES [dbo].[T_Usuario_Modalidad] ([PK_IUM_CodPart])
GO
ALTER TABLE [dbo].[T_Inscripcion] CHECK CONSTRAINT [FK_T_Inscripcion_T_Usuario_Modalidad]
GO
ALTER TABLE [dbo].[T_Puntaje]  WITH CHECK ADD  CONSTRAINT [FK_T_Puntaje_T_Usuario_Modalidad_Tanda] FOREIGN KEY([FK_IUMT_UsuModTan])
REFERENCES [dbo].[T_Usuario_Modalidad_Tanda] ([PK_IUMT_CodUsuModTan])
GO
ALTER TABLE [dbo].[T_Puntaje] CHECK CONSTRAINT [FK_T_Puntaje_T_Usuario_Modalidad_Tanda]
GO
ALTER TABLE [dbo].[T_Tanda]  WITH CHECK ADD  CONSTRAINT [FK_T_Tanda_T_Marinera] FOREIGN KEY([FK_IM_CodMar])
REFERENCES [dbo].[T_Marinera] ([PK_IM_CodMar])
GO
ALTER TABLE [dbo].[T_Tanda] CHECK CONSTRAINT [FK_T_Tanda_T_Marinera]
GO
ALTER TABLE [dbo].[T_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_T_Categoria] FOREIGN KEY([FK_ICA_CodCat])
REFERENCES [dbo].[T_Categoria] ([PK_ICA_CodCat])
GO
ALTER TABLE [dbo].[T_Usuario] CHECK CONSTRAINT [FK_T_Usuario_T_Categoria]
GO
ALTER TABLE [dbo].[T_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_T_tipoUsuario] FOREIGN KEY([FK_ITU_TipoUsuario])
REFERENCES [dbo].[T_Tipo_Usuario] ([PK_ITU_TipoUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Usuario] CHECK CONSTRAINT [FK_T_Usuario_T_tipoUsuario]
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_Modalidad_T_Concurso] FOREIGN KEY([FK_IC_IdConcurso])
REFERENCES [dbo].[T_Concurso] ([PK_IC_IdConcurso])
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad] CHECK CONSTRAINT [FK_T_Usuario_Modalidad_T_Concurso]
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_Modalidad_T_ModalidadCon] FOREIGN KEY([FK_IM_IdModalidad])
REFERENCES [dbo].[T_Modalidad_Concurso] ([PK_IM_CodigoMod])
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad] CHECK CONSTRAINT [FK_T_Usuario_Modalidad_T_ModalidadCon]
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_Modalidad_T_Usuario] FOREIGN KEY([FK_VU_Dni])
REFERENCES [dbo].[T_Usuario] ([PK_VU_Dni])
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad] CHECK CONSTRAINT [FK_T_Usuario_Modalidad_T_Usuario]
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_Modalidad_T_Usuario1] FOREIGN KEY([FK_VU_DniPareja])
REFERENCES [dbo].[T_Usuario] ([PK_VU_Dni])
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad] CHECK CONSTRAINT [FK_T_Usuario_Modalidad_T_Usuario1]
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad_Tanda]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_Modalidad_Tanda_T_Tanda] FOREIGN KEY([FK_IT_CodTan])
REFERENCES [dbo].[T_Tanda] ([PK_IT_CodTan])
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad_Tanda] CHECK CONSTRAINT [FK_T_Usuario_Modalidad_Tanda_T_Tanda]
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad_Tanda]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_Modalidad_Tanda_T_Usuario_Modalidad] FOREIGN KEY([FK_IUM_CodUM])
REFERENCES [dbo].[T_Usuario_Modalidad] ([PK_IUM_CodPart])
GO
ALTER TABLE [dbo].[T_Usuario_Modalidad_Tanda] CHECK CONSTRAINT [FK_T_Usuario_Modalidad_Tanda_T_Usuario_Modalidad]
GO
ALTER TABLE [dbo].[T_Usuario_X_Concurso_Participado]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_X_Concurso_Participado_T_Concurso_Participado] FOREIGN KEY([FK_ICPA_Cod])
REFERENCES [dbo].[T_Concurso_Participado] ([PK_ICPA_Cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Usuario_X_Concurso_Participado] CHECK CONSTRAINT [FK_T_Usuario_X_Concurso_Participado_T_Concurso_Participado]
GO
ALTER TABLE [dbo].[T_Usuario_X_Concurso_Participado]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_X_Concurso_Participado_T_Usuario] FOREIGN KEY([FK_VU_Dni])
REFERENCES [dbo].[T_Usuario] ([PK_VU_Dni])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Usuario_X_Concurso_Participado] CHECK CONSTRAINT [FK_T_Usuario_X_Concurso_Participado_T_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Concurso]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Actualizar_Concurso]
@id int,
@nombre varchar(50),
@direccion varchar(50),
@fechac datetime,
@cantS decimal(18,2),
@cantN decimal(18,2),
@est int
as
Begin
update T_Concurso
set VC_NombreCon=@nombre,VC_LugarCon=@direccion,DTC_FechaConcurso=@fechac,DC_PrecioSeriado=@cantS,DC_PrecioNovel=@cantN,VC_Estado=@est
where PK_IC_IdConcurso=@id
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Desplegable_Concurso]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Desplegable_Concurso]
as
select * from T_Concurso where VC_Estado='No Realizado'
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Concursos]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_Listar_Concursos]
as
begin
select a.PK_IC_IdConcurso,a.VC_NombreCon,a.DC_PrecioSeriado,a.DC_PrecioNovel,a.VC_Estado
from T_Concurso a
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Concurso]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Obtener_Concurso]
@id int
as
begin
select * from T_Concurso where PK_IC_IdConcurso=@id
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Registrar_Concurso]    Script Date: 26/07/2022 22:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Registrar_Concurso]
@nombre varchar(50),
@direccion varchar(50),
@fechac datetime,
@cantS decimal(18,2),
@cantN decimal(18,2)
as
Begin
insert into T_Concurso values(@nombre,@direccion,@fechac,@cantS,@cantN,1)
end
GO
USE [master]
GO
ALTER DATABASE [BD_SGIAMTv1] SET  READ_WRITE 
GO
