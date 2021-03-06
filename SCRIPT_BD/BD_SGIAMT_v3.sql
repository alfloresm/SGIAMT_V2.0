USE [master]
GO
/****** Object:  Database [BD_SGIAMTv1]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Asistencia]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Asistencia](
	[PK_IA_CodAsi] [int] IDENTITY(1,1) NOT NULL,
	[DTA_Fecha] [smalldatetime] NULL,
	[VA_EstadoAsistencia] [varchar](50) NULL,
	[VA_Periodo] [varchar](50) NULL,
	[FK_VU_DNI] [varchar](50) NULL,
 CONSTRAINT [PK_T_Asistencia] PRIMARY KEY CLUSTERED 
(
	[PK_IA_CodAsi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Categoria]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Categoria_Alumno]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Categoria_Alumno](
	[PK_ICA_CodCatAlumno] [int] NOT NULL,
	[VCA_NombreCatAlumno] [varchar](50) NULL,
 CONSTRAINT [PK_T_CategoriaAlumno] PRIMARY KEY CLUSTERED 
(
	[PK_ICA_CodCatAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Clase]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Clase](
	[FK_IC_CodNivel] [int] NOT NULL,
	[FK_IC_CodCatAlumno] [int] NOT NULL,
	[VC_Descripcion] [varchar](50) NULL,
	[IC_TotalClase] [int] NULL,
	[VC_Local] [varchar](50) NOT NULL,
	[FK_VP_Dni] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_Clase_1] PRIMARY KEY CLUSTERED 
(
	[FK_IC_CodNivel] ASC,
	[FK_IC_CodCatAlumno] ASC,
	[VC_Local] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Concepto_Pago]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Concepto_Pago](
	[PK_ICP_CodConP] [int] NOT NULL,
	[VCP_Descripcion] [varchar](50) NULL,
	[DCP_Monto] [varchar](50) NULL,
 CONSTRAINT [PK_T_Concepto_Pago] PRIMARY KEY CLUSTERED 
(
	[PK_ICP_CodConP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Concurso]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Concurso](
	[PK_IC_IdConcurso] [int] IDENTITY(1,1) NOT NULL,
	[VC_NombreCon] [varchar](50) NULL,
	[VC_LugarCon] [varchar](50) NULL,
	[DTC_FechaConcurso] [smalldatetime] NULL,
	[DC_PrecioSeriado] [decimal](18, 2) NULL,
	[DC_precioNovel] [decimal](18, 2) NULL,
	[VC_Estado] [varchar](50) NULL,
 CONSTRAINT [PK_T_Concurso] PRIMARY KEY CLUSTERED 
(
	[PK_IC_IdConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Concurso_Participado]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Dia]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Dia](
	[PK_ID_CodDia] [int] IDENTITY(1,1) NOT NULL,
	[VD_Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_T_Dia] PRIMARY KEY CLUSTERED 
(
	[PK_ID_CodDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Dia_X_Hora]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Dia_X_Hora](
	[FK_ID_CodDia] [int] NOT NULL,
	[FK_IH_CodHora] [int] NOT NULL,
	[VDH_Horario] [varchar](50) NULL,
	[FK_IC_CodNivel] [int] NULL,
	[FK_IC_CodCatAlumno] [int] NULL,
	[VC_Local] [varchar](50) NULL,
 CONSTRAINT [PK_T_Dia_X_Hora] PRIMARY KEY CLUSTERED 
(
	[FK_ID_CodDia] ASC,
	[FK_IH_CodHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Hora]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Hora](
	[PK_IH_CodHora] [int] IDENTITY(1,1) NOT NULL,
	[VH_HoraInicio] [varchar](50) NULL,
	[VH_HoraFin] [varchar](50) NULL,
 CONSTRAINT [PK_T_Hora] PRIMARY KEY CLUSTERED 
(
	[PK_IH_CodHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Inscripcion]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Marinera]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Modalidad_Concurso]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Nivel]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Nivel](
	[PK_IN_CodNivel] [int] NOT NULL,
	[VN_NombreNivel] [varchar](50) NULL,
 CONSTRAINT [PK_T_Nivel] PRIMARY KEY CLUSTERED 
(
	[PK_IN_CodNivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pago]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pago](
	[PK_IP_CodPago] [int] IDENTITY(1,1) NOT NULL,
	[DTP_Fecha] [smalldatetime] NULL,
	[DP_Monto] [decimal](18, 2) NULL,
	[VP_Estado] [varchar](50) NULL,
	[VP_Periodo] [varchar](50) NULL,
	[FK_VU_Dni] [varchar](50) NULL,
	[FK_ICP_CodCP] [int] NULL,
 CONSTRAINT [PK_T_Pago] PRIMARY KEY CLUSTERED 
(
	[PK_IP_CodPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Profesor]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Profesor](
	[PK_VP_Dni] [varchar](50) NOT NULL,
	[IP_Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_T_Profesor] PRIMARY KEY CLUSTERED 
(
	[PK_VP_Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Progreso]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Progreso](
	[PK_IP_CodProgreso] [int] IDENTITY(1,1) NOT NULL,
	[VP_NombreProgreso] [varchar](50) NULL,
	[DP_NotaPasos] [decimal](18, 2) NULL,
	[DP_NotaTecnica] [decimal](18, 2) NULL,
	[DP_NotaInteres] [decimal](18, 2) NULL,
	[DP_NotaHabilidad] [decimal](18, 2) NULL,
	[DP_TotalNota] [decimal](18, 2) NULL,
	[VP_Observacion] [varchar](50) NULL,
	[VP_Periodo] [varchar](50) NULL,
	[FK_IA_CodAsi] [int] NULL,
 CONSTRAINT [PK_T_Progreso] PRIMARY KEY CLUSTERED 
(
	[PK_IP_CodProgreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Puntaje]    Script Date: 14/06/2021 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Puntaje](
	[PK_IP_Cod] [int] IDENTITY(1,1) NOT NULL,
	[IP_Puntaje] [int] NULL,
	[IP_NumeroJurado] [int] NULL,
	[FK_IUMT_UsuModTan] [varchar](50) NULL,
 CONSTRAINT [PK_T_Puntaje] PRIMARY KEY CLUSTERED 
(
	[PK_IP_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Tanda]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Tipo_Usuario]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Usuario]    Script Date: 14/06/2021 19:35:09 ******/
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
	[VU_Estado] [varchar](50) NULL,
	[VU_AlumnoMes] [varchar](50) NULL,
	[VU_Direccion] [varchar](50) NULL,
	[VBU_ArchivoUsuario] [varbinary](max) NULL,
	[FK_ICA_CodCat] [int] NULL,
	[FK_ITU_TipoUsuario] [int] NULL,
	[FK_IC_CodNivel] [int] NULL,
	[FK_IC_CodCatAlumno] [int] NULL,
	[FK_VC_Local] [varchar](50) NULL,
 CONSTRAINT [PK_T_Usuario] PRIMARY KEY CLUSTERED 
(
	[PK_VU_Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Usuario_Modalidad]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Usuario_Modalidad_Tanda]    Script Date: 14/06/2021 19:35:09 ******/
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
/****** Object:  Table [dbo].[T_Usuario_X_Concurso_Participado]    Script Date: 14/06/2021 19:35:09 ******/
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
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (1, N'Pre Infante', 2014, 2016)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (2, N'Infante', 2010, 2013)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (3, N'Infantil', 2006, 2009)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (4, N'Junior', 2002, 2005)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (5, N'Juvenil', 1998, 2001)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (6, N'Adulto', 1985, 1997)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (7, N'Senior', 1970, 1984)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (8, N'Master', 1956, 1969)
INSERT [dbo].[T_Categoria] ([PK_ICA_CodCat], [VCA_NomCategoria], [ICA_AnioInicio], [ICA_AnioFin]) VALUES (9, N'Oro', 1900, 1955)
SET IDENTITY_INSERT [dbo].[T_Categoria] OFF
GO
INSERT [dbo].[T_Categoria_Alumno] ([PK_ICA_CodCatAlumno], [VCA_NombreCatAlumno]) VALUES (1, N'Kids')
INSERT [dbo].[T_Categoria_Alumno] ([PK_ICA_CodCatAlumno], [VCA_NombreCatAlumno]) VALUES (2, N'Junior')
INSERT [dbo].[T_Categoria_Alumno] ([PK_ICA_CodCatAlumno], [VCA_NombreCatAlumno]) VALUES (3, N'Jovenes/Adulto')
GO
INSERT [dbo].[T_Concepto_Pago] ([PK_ICP_CodConP], [VCP_Descripcion], [DCP_Monto]) VALUES (1, N'Primer Pago', N'110.00')
INSERT [dbo].[T_Concepto_Pago] ([PK_ICP_CodConP], [VCP_Descripcion], [DCP_Monto]) VALUES (2, N'Matricula', N'30.00')
INSERT [dbo].[T_Concepto_Pago] ([PK_ICP_CodConP], [VCP_Descripcion], [DCP_Monto]) VALUES (3, N'Mensualidad', N'80.00')
GO
SET IDENTITY_INSERT [dbo].[T_Concurso] ON 

INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaConcurso], [DC_PrecioSeriado], [DC_precioNovel], [VC_Estado]) VALUES (1, N'I Concurso TusuyPeru', N'Coliseo Ricardo Bentin', CAST(N'2019-11-10T00:00:00' AS SmallDateTime), CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'No Realizado')
INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaConcurso], [DC_PrecioSeriado], [DC_precioNovel], [VC_Estado]) VALUES (2, N'II Concurso Tusuy Peru', N'Colegio Antenor Orrego', CAST(N'2020-08-19T00:00:00' AS SmallDateTime), CAST(10.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'No Realizado')
INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaConcurso], [DC_PrecioSeriado], [DC_precioNovel], [VC_Estado]) VALUES (3, N'III Concurso Tusuy Peru', N'Coliseo 1', CAST(N'2020-07-21T00:00:00' AS SmallDateTime), CAST(9.00 AS Decimal(18, 2)), CAST(19.00 AS Decimal(18, 2)), N'Realizado')
INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaConcurso], [DC_PrecioSeriado], [DC_precioNovel], [VC_Estado]) VALUES (4, N'IV CONCURSO', N'Coliseo 3', CAST(N'2020-09-02T00:00:00' AS SmallDateTime), CAST(12.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)), N'No Realizado')
INSERT [dbo].[T_Concurso] ([PK_IC_IdConcurso], [VC_NombreCon], [VC_LugarCon], [DTC_FechaConcurso], [DC_PrecioSeriado], [DC_precioNovel], [VC_Estado]) VALUES (5, N'6° concurso', N'Coliseo Ricardo Bentin', CAST(N'2020-08-06T00:00:00' AS SmallDateTime), CAST(10.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'No Realizado')
SET IDENTITY_INSERT [dbo].[T_Concurso] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Dia] ON 

INSERT [dbo].[T_Dia] ([PK_ID_CodDia], [VD_Nombre]) VALUES (1, N'Lunes')
INSERT [dbo].[T_Dia] ([PK_ID_CodDia], [VD_Nombre]) VALUES (2, N'Martes')
INSERT [dbo].[T_Dia] ([PK_ID_CodDia], [VD_Nombre]) VALUES (3, N'Miércoles')
INSERT [dbo].[T_Dia] ([PK_ID_CodDia], [VD_Nombre]) VALUES (4, N'Jueves')
INSERT [dbo].[T_Dia] ([PK_ID_CodDia], [VD_Nombre]) VALUES (5, N'Viernes')
INSERT [dbo].[T_Dia] ([PK_ID_CodDia], [VD_Nombre]) VALUES (6, N'Sábado')
INSERT [dbo].[T_Dia] ([PK_ID_CodDia], [VD_Nombre]) VALUES (7, N'Domingo')
SET IDENTITY_INSERT [dbo].[T_Dia] OFF
GO
INSERT [dbo].[T_Modalidad_Concurso] ([PK_IM_CodigoMod], [VM_NombreMod]) VALUES (1, N'Seriado')
INSERT [dbo].[T_Modalidad_Concurso] ([PK_IM_CodigoMod], [VM_NombreMod]) VALUES (2, N'Novel')
GO
INSERT [dbo].[T_Nivel] ([PK_IN_CodNivel], [VN_NombreNivel]) VALUES (1, N'BASICO')
INSERT [dbo].[T_Nivel] ([PK_IN_CodNivel], [VN_NombreNivel]) VALUES (2, N'INTERMEDIO')
INSERT [dbo].[T_Nivel] ([PK_IN_CodNivel], [VN_NombreNivel]) VALUES (3, N'AVANZADO')
GO
/****** Object:  Index [IX_T_Progreso]    Script Date: 14/06/2021 19:35:10 ******/
ALTER TABLE [dbo].[T_Progreso] ADD  CONSTRAINT [IX_T_Progreso] UNIQUE NONCLUSTERED 
(
	[FK_IA_CodAsi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_T_Asistencia_T_Usuario1] FOREIGN KEY([FK_VU_DNI])
REFERENCES [dbo].[T_Usuario] ([PK_VU_Dni])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Asistencia] CHECK CONSTRAINT [FK_T_Asistencia_T_Usuario1]
GO
ALTER TABLE [dbo].[T_Clase]  WITH CHECK ADD  CONSTRAINT [FK_T_Clase_T_CategoriaAlumno] FOREIGN KEY([FK_IC_CodCatAlumno])
REFERENCES [dbo].[T_Categoria_Alumno] ([PK_ICA_CodCatAlumno])
GO
ALTER TABLE [dbo].[T_Clase] CHECK CONSTRAINT [FK_T_Clase_T_CategoriaAlumno]
GO
ALTER TABLE [dbo].[T_Clase]  WITH CHECK ADD  CONSTRAINT [FK_T_Clase_T_Nivel] FOREIGN KEY([FK_IC_CodNivel])
REFERENCES [dbo].[T_Nivel] ([PK_IN_CodNivel])
GO
ALTER TABLE [dbo].[T_Clase] CHECK CONSTRAINT [FK_T_Clase_T_Nivel]
GO
ALTER TABLE [dbo].[T_Clase]  WITH CHECK ADD  CONSTRAINT [FK_T_Clase_T_Profesor] FOREIGN KEY([FK_VP_Dni])
REFERENCES [dbo].[T_Profesor] ([PK_VP_Dni])
GO
ALTER TABLE [dbo].[T_Clase] CHECK CONSTRAINT [FK_T_Clase_T_Profesor]
GO
ALTER TABLE [dbo].[T_Dia_X_Hora]  WITH CHECK ADD  CONSTRAINT [FK_T_Dia_X_Hora_T_Clase] FOREIGN KEY([FK_IC_CodNivel], [FK_IC_CodCatAlumno], [VC_Local])
REFERENCES [dbo].[T_Clase] ([FK_IC_CodNivel], [FK_IC_CodCatAlumno], [VC_Local])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Dia_X_Hora] CHECK CONSTRAINT [FK_T_Dia_X_Hora_T_Clase]
GO
ALTER TABLE [dbo].[T_Dia_X_Hora]  WITH CHECK ADD  CONSTRAINT [FK_T_Dia_X_Hora_T_Dia] FOREIGN KEY([FK_ID_CodDia])
REFERENCES [dbo].[T_Dia] ([PK_ID_CodDia])
GO
ALTER TABLE [dbo].[T_Dia_X_Hora] CHECK CONSTRAINT [FK_T_Dia_X_Hora_T_Dia]
GO
ALTER TABLE [dbo].[T_Dia_X_Hora]  WITH CHECK ADD  CONSTRAINT [FK_T_Dia_X_Hora_T_Hora] FOREIGN KEY([FK_IH_CodHora])
REFERENCES [dbo].[T_Hora] ([PK_IH_CodHora])
GO
ALTER TABLE [dbo].[T_Dia_X_Hora] CHECK CONSTRAINT [FK_T_Dia_X_Hora_T_Hora]
GO
ALTER TABLE [dbo].[T_Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_T_Inscripcion_T_Usuario_Modalidad] FOREIGN KEY([FK_IUM_CodUm])
REFERENCES [dbo].[T_Usuario_Modalidad] ([PK_IUM_CodPart])
GO
ALTER TABLE [dbo].[T_Inscripcion] CHECK CONSTRAINT [FK_T_Inscripcion_T_Usuario_Modalidad]
GO
ALTER TABLE [dbo].[T_Pago]  WITH CHECK ADD  CONSTRAINT [FK_T_Pago_T_Concepto_Pago] FOREIGN KEY([FK_ICP_CodCP])
REFERENCES [dbo].[T_Concepto_Pago] ([PK_ICP_CodConP])
GO
ALTER TABLE [dbo].[T_Pago] CHECK CONSTRAINT [FK_T_Pago_T_Concepto_Pago]
GO
ALTER TABLE [dbo].[T_Pago]  WITH CHECK ADD  CONSTRAINT [FK_T_Pago_T_Usuario] FOREIGN KEY([FK_VU_Dni])
REFERENCES [dbo].[T_Usuario] ([PK_VU_Dni])
GO
ALTER TABLE [dbo].[T_Pago] CHECK CONSTRAINT [FK_T_Pago_T_Usuario]
GO
ALTER TABLE [dbo].[T_Progreso]  WITH CHECK ADD  CONSTRAINT [FK_T_Progreso_T_Asistencia] FOREIGN KEY([FK_IA_CodAsi])
REFERENCES [dbo].[T_Asistencia] ([PK_IA_CodAsi])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Progreso] CHECK CONSTRAINT [FK_T_Progreso_T_Asistencia]
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
ALTER TABLE [dbo].[T_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_T_Clase1] FOREIGN KEY([FK_IC_CodNivel], [FK_IC_CodCatAlumno], [FK_VC_Local])
REFERENCES [dbo].[T_Clase] ([FK_IC_CodNivel], [FK_IC_CodCatAlumno], [VC_Local])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Usuario] CHECK CONSTRAINT [FK_T_Usuario_T_Clase1]
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
/****** Object:  StoredProcedure [dbo].[SP_Listar_Concursos]    Script Date: 14/06/2021 19:35:10 ******/
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
USE [master]
GO
ALTER DATABASE [BD_SGIAMTv1] SET  READ_WRITE 
GO
