USE [envanter]
GO
/****** Object:  Table [dbo].[GarantiBilgileri]    Script Date: 16.03.2024 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GarantiBilgileri](
	[GarantiId] [int] NOT NULL,
	[UrunId] [int] NULL,
	[TedarikciId] [int] NULL,
	[BaslangicTarihi] [date] NULL,
	[BitisTarihi] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[GarantiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HammaddeFiyatlari]    Script Date: 16.03.2024 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HammaddeFiyatlari](
	[HammaddeId] [int] NOT NULL,
	[UrunId] [int] NULL,
	[TedarikciId] [int] NULL,
	[Fiyat] [money] NULL,
	[Tarih] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[HammaddeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteriler]    Script Date: 16.03.2024 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteriler](
	[MusteriId] [int] NOT NULL,
	[MusteriAd] [varchar](70) NULL,
	[MusteriSoyad] [varchar](30) NULL,
	[Telefon] [varchar](20) NULL,
 CONSTRAINT [PK_musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stokdurumu]    Script Date: 16.03.2024 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stokdurumu](
	[StokDurumuId] [int] NOT NULL,
	[UrunId] [int] NULL,
	[TedarikciId] [int] NULL,
	[Miktar] [int] NULL,
 CONSTRAINT [PK_stokdurumu] PRIMARY KEY CLUSTERED 
(
	[StokDurumuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StokHareketleri]    Script Date: 16.03.2024 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StokHareketleri](
	[HareketID] [int] NOT NULL,
	[UrunId] [int] NULL,
	[TedarikciId] [int] NULL,
	[Miktar] [int] NULL,
	[Tarih] [datetime] NULL,
	[HareketTipi] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[HareketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tedarikciler]    Script Date: 16.03.2024 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tedarikciler](
	[TedarikciId] [int] NOT NULL,
	[TedarikciAd] [varchar](100) NULL,
	[Tel] [varchar](20) NULL,
	[Adres] [text] NULL,
 CONSTRAINT [PK_tedarikciler] PRIMARY KEY CLUSTERED 
(
	[TedarikciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urunler]    Script Date: 16.03.2024 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunler](
	[UrunId] [int] NOT NULL,
	[UrunAd] [varchar](100) NULL,
	[Kategori] [varchar](50) NULL,
	[Fiyat] [money] NULL,
	[MinStokMiktar] [int] NULL,
	[TedarikciId] [int] NULL,
 CONSTRAINT [PK_urunler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GarantiBilgileri]  WITH CHECK ADD FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[tedarikciler] ([TedarikciId])
GO
ALTER TABLE [dbo].[GarantiBilgileri]  WITH CHECK ADD FOREIGN KEY([UrunId])
REFERENCES [dbo].[urunler] ([UrunId])
GO
ALTER TABLE [dbo].[HammaddeFiyatlari]  WITH CHECK ADD FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[tedarikciler] ([TedarikciId])
GO
ALTER TABLE [dbo].[HammaddeFiyatlari]  WITH CHECK ADD FOREIGN KEY([UrunId])
REFERENCES [dbo].[urunler] ([UrunId])
GO
ALTER TABLE [dbo].[StokHareketleri]  WITH CHECK ADD FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[tedarikciler] ([TedarikciId])
GO
ALTER TABLE [dbo].[StokHareketleri]  WITH CHECK ADD FOREIGN KEY([UrunId])
REFERENCES [dbo].[urunler] ([UrunId])
GO
ALTER TABLE [dbo].[StokHareketleri]  WITH CHECK ADD CHECK  (([HareketTipi]='Cikis' OR [HareketTipi]='Giris'))
GO
