USE [KitapSitesi]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 11.06.2020 00:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 11.06.2020 00:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 11.06.2020 00:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCategories]    Script Date: 11.06.2020 00:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_BookCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 11.06.2020 00:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Year] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Stock] [smallint] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11.06.2020 00:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11.06.2020 00:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[CommentTo] [int] NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11.06.2020 00:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 11.06.2020 00:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[PictureUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.06.2020 00:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[Phone] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([Id], [Username], [PasswordHash], [PasswordSalt]) VALUES (1, N'admin', 0x4FBD170B010D49C27D846EEF91D4B8E9A59E67D4C5014C24FFECE17CF131326F9ED3BDA570CCE1A0467E09CFAA3CECBEBB74484E0EBA5CB79480C10EE1BF68A7, 0x5EA8A9A3BD3B8030663E89D5DF52A2DD56FCF58ABFD327BC8C0D1C5F455F081A4561D6C8D96CEAC69C4944C776761DC05D1574C15E0E9F3B87ACA22084EC4D45A4BD7D2C740149581A3FBC086A1CAA1A30F96662496FDACA99E783E57C1EB74A6F4290B7853AE31B00BC112B71DCF219260B6FA5952BBEEF01D7B49799F8D69B)
SET IDENTITY_INSERT [dbo].[Admins] OFF
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1, N'İlber Ortaylı')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (2, N'Zülfü Livaneli')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (3, N'Jack London')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (4, N'Barış Pehlivan')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (5, N'Barış Terkoğlu')
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[BookAuthors] ON 

INSERT [dbo].[BookAuthors] ([Id], [BookId], [AuthorId]) VALUES (1, 1, 3)
INSERT [dbo].[BookAuthors] ([Id], [BookId], [AuthorId]) VALUES (2, 2, 3)
INSERT [dbo].[BookAuthors] ([Id], [BookId], [AuthorId]) VALUES (3, 3, 1)
INSERT [dbo].[BookAuthors] ([Id], [BookId], [AuthorId]) VALUES (4, 4, 1)
INSERT [dbo].[BookAuthors] ([Id], [BookId], [AuthorId]) VALUES (5, 5, 2)
INSERT [dbo].[BookAuthors] ([Id], [BookId], [AuthorId]) VALUES (6, 6, 2)
INSERT [dbo].[BookAuthors] ([Id], [BookId], [AuthorId]) VALUES (7, 7, 4)
INSERT [dbo].[BookAuthors] ([Id], [BookId], [AuthorId]) VALUES (8, 7, 5)
SET IDENTITY_INSERT [dbo].[BookAuthors] OFF
SET IDENTITY_INSERT [dbo].[BookCategories] ON 

INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId]) VALUES (1, 1, 5)
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId]) VALUES (2, 2, 5)
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId]) VALUES (3, 3, 11)
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId]) VALUES (4, 4, 14)
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId]) VALUES (5, 5, 5)
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId]) VALUES (6, 5, 5)
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId]) VALUES (7, 7, 5)
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId]) VALUES (8, 7, 8)
SET IDENTITY_INSERT [dbo].[BookCategories] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [Price], [Year], [Description], [Stock]) VALUES (1, N'Beyaz Diş', CAST(15.00 AS Decimal(18, 2)), 2018, N'Jack London''ın Issız Diyarı, yabanı, buz kalpli Kuzey Toprakları''ndaki hayatı konu edindiği ikinci romanı Beyaz Diş''tir. Vahşetin Çağrısı''na kendini bırakmış bir annenin yavrusu Beyaz Diş''in diyarıdır anlatılan. Onun hayranlık uyandırıcı zekası ve içgüdüleriyle kendini var edişinin ve "insan tanrılar"ın yaşamına geri dönüşünün enfes hikayesi...', 1000)
INSERT [dbo].[Books] ([Id], [Name], [Price], [Year], [Description], [Stock]) VALUES (2, N'İntihar', CAST(20.00 AS Decimal(18, 2)), 2018, N'Şansları iyi giderse içerler, kötü giderse de, bir gün düzeleceği umuduyla içerler. İşleri kötüye giderse bu sefer de bunu unutmak için içerler. Dostlarına rastlarlarsa içerler. Bir dostuyla kavga edip ondan uzaklaşmışsa yine içerler. Aşıkken, mutluluktan uçtukları için içerler. Sevgilileri kendilerine yüz vermeyince, üzüntüden içerler.

Yapacak bir şey bulamadıkları zaman yine içerler, çünkü içtikten sonra beyinlerinde kurtların dolaşmayabaşlayacağını ve ellerinin yapacak bir sürü iş bulacağını bilirler. Ayık oldukları zaman içmek isteyecek, içtikçe de daha çoğunu içeceklerdir.
İntihar''da gerçeği tüm çıplaklığıyla yazmadım. Yazamadım, çünkü bu kadarına cesaretim yoktu.', 1000)
INSERT [dbo].[Books] ([Id], [Name], [Price], [Year], [Description], [Stock]) VALUES (3, N'Bir Ömür Nasıl Yaşanır?
', CAST(18.00 AS Decimal(18, 2)), 2019, N'Daha anlamlı yaşamak için İlber Ortaylı''dan tavsiyeler…

"Cesur olun. Kendinizi rahat hissettiğiniz alanın dışında pencereler açın. Farklı dünyalarla ancak böyle tanışırsınız. Ben hep yerimde dursaydım, dünyamı değiştirecek insanları aramasaydım, bugün tanıdığınız ben olmazdım. Bir insanın bittiği an, miskinliğe esir olduğu andır. İnsan, konforundan vazgeçmeyi göze almalıdır. Kendi dünyasını yerinden kendisi oynatmalıdır."

- İlber Ortaylı

İlber Ortaylı, yediden yetmişe herkesin faydalanacağı, bilge şahsiyetinden ve yaşam tecrübesinden süzülen tavsiyelerden oluşan bir eserle karşımızda. İlber Hoca bu kitapta, bir insanın, çocukluktan itibaren hayatın hemen her alanında ihtiyaç duyacağı çözümleri nasıl bulabileceğini örnekler vererek anlatıyor. "Herkes kendi talihinin mimarıdır" sözünü hatırlatarak, kendi yolunu çizmenin ne anlama geldiğini tüm kritik noktalarıyla yorumluyor.

Bir ömrü hakkıyla yaşayabilmek ve yaşanan her andan tat alabilmek için önce ne lazımdır? 
İnsan hayatı kaç dönemden oluşur ve her bir dönemde neleri tecrübe etmek gerekir? 15, 25, 40 ve 55 yaşları neden birer eşiktir?
İnsan kimden, ne öğrenebilir? Kendi kendini yetiştirmek nasıl mümkün olur? 
Kişi mesleğini neye göre seçmelidir?
Bir işin uzmanı olmak ve o uzmanlık bilgisiyle çalışmak için nelere ihtiyaç vardır? 
Bir dil, en iyi nasıl ve ne zaman öğrenilir? 
En verimli sonucu alabilmek için nasıl çalışmak gerekir?
Sorumluluk sahibi bir insan, kendisi veya çocukları için nasıl bir eğitim modeli aramalıdır?
Hayata değer katmak için ne tür insanları arayıp bulmak gerekir? 
Doğru kararları alabilmek için en çok kimleri dinlemek gerekir? 
En iyi nasıl seyahat edilir; bir şehir nasıl dolaşılır? Hangi müze, hangi meydan, hangi sokakları görmek için dünyanın bir ucuna kadar gidilebilir?
İyi film, güzel müzik, doğru kitap nedir? Hangi temel eserleri dinlemeli, okumalı ve seyretmeliyiz?
İnsan yaşadığı şehirden tam manasıyla nasıl yararlanabilir?
"Bir Ömür Nasıl Yaşanır?", ülkemizin medarıiftiharı olmuş bir tarihçinin gözünden, insanın hayattaki anlam arayışına, bu arayışın tadını nasıl çıkaracağına ve süreç boyunca karşılaşacağı zorluklarla nasıl baş etmesi gerektiğine dair çok özel bir kılavuz…', 1000)
INSERT [dbo].[Books] ([Id], [Name], [Price], [Year], [Description], [Stock]) VALUES (4, N'Türkiye''nin Yakın Tarihi', CAST(30.00 AS Decimal(18, 2)), 2018, N'
"Osmanlı İmparatorluğu gürültüyle ve aniden ortadan kalktı. Büyük imparatorluklar artlarında üç-beş yıllık değil, yüz yıllık sancılar bırakır."

"İttihatçılar vatanseverdi, bu onların hem gücüydü hem de hatalarının bir nedeni."
"Türkiye''de iktidar çevreleri Atatürk''ün büyük iddia ve heyecanını anlayamamıştır. Hâlâ da Türk akademi dünyası bu yolda topal adımlarla ilerlemektedir."
"Türk toplumu yeryüzü tarihinin en büyük devrimini yaşayan yerkürenin devlerine karşı varlık mücadelesi vermiştir."
"6-7 Eylül olayları, Varlık Vergisi ile birlikte yakın tarihin en büyük sorun çıkaran iki tertibidir. Tertiplerin akışına sorumlular bile hâkim olamamıştır."
"Türkiye anayasaları boyuna yenileniyor. Yenilenmeyen politikanın örgütlenme biçimi ve eğitimidir."', 1000)
INSERT [dbo].[Books] ([Id], [Name], [Price], [Year], [Description], [Stock]) VALUES (5, N'Huzursuzluk', CAST(30.00 AS Decimal(18, 2)), 2017, N'Merhamet zulmün merhemi olamaz!

İstanbul''un kargaşası içinde sıradan bir yaşam süren İbrahim, çocukluk arkadaşı Hüseyin''in ölüm haberi üzerine doğduğu kadim kent Mardin''e gider. Onun, önce sevdaya sonra ölüme yazılmış, Mardin''de başlayıp Amerika''da sona ermiş hayatını araştırmaya koyulur. Böylece âdeta bir girdabın içine çekilir, tutkuyla ve hırsla gizemli bir kadının peşine düşer.

Harese nedir, bilir misin? Develerin çölde çok sevdiği bir diken var. Deve dikeni yedikçe ağzı kanar. Tuzlu kanın tadı dikeninkiyle karışınca bu, devenin daha çok hoşuna gider. Kanadıkça yer, bir türlü kendi kanına doyamaz… Ortadoğu''nun âdeti budur, tarih boyunca birbirini öldürür ama aslında kendini öldürdüğünü anlamaz. Kendi kanının tadından sarhoş olur.

Mardinli Hüseyin ile IŞİD zulmünü misliyle yaşamış Ezidi kızı Meleknaz''ın ve kelamın çocuklarının hikâyesi... Livaneli okuru, sevda ile acının iç içe geçtiği bir Ortadoğu gerçeğiyle buluşturuyor.', 1000)
INSERT [dbo].[Books] ([Id], [Name], [Price], [Year], [Description], [Stock]) VALUES (6, N'Serenad', CAST(20.00 AS Decimal(18, 2)), 2017, N'Roman okumak istiyorsanız... Her şey, 2001 yılının Şubat ayında soğuk bir gün, İstanbul Üniversitesi''nde halkla ilişkiler görevini yürüten Maya Duran''ın (36) ABD''den gelen Alman asıllı Profesör Maximilian Wagner''i (87) karşılamasıyla başlar. 1930''lu yıllarda İstanbul Üniversitesi''nde hocalık yapmış olan profesörün isteği üzerine, Maya bir gün onu Şile''ye götürür. Böylece, katları yavaş yavaş açılan dokunaklı bir aşk hikâyesine karışmakla kalmaz, dünya tarihine ve kendi ailesine ilişkin birtakım sırları da öğrenir. Serenad, 60 yıldır süren bir aşkı ele alırken, ister herkesin bildiği Yahudi Soykırımı olsun isterse çok az kimsenin bildiği Mavi Alay, bütün siyasi sorunlarda asıl harcananın, gürültüye gidenin hep insan olduğu gerçeğini de göz önüne seriyor. Okurunu sımsıkı kavrayan Serenad''da Zülfü Livaneli''nin romancılığının en temel niteliklerinden biri yine başrolde: İç içe geçmiş, kaynaşmış kişisel ve toplumsal tarihlerin kusursuz Dengesi.', 500)
INSERT [dbo].[Books] ([Id], [Name], [Price], [Year], [Description], [Stock]) VALUES (7, N'Metastaz', CAST(20.00 AS Decimal(18, 2)), 2018, N'Fetö kitabı', 1000)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Akademik')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Bilişim & Bilgisayar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Çizgi Roman & Mizah')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Çocuk & Gençlik')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Edebiyat')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Felsefe')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Gezi & Turizm')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Hobi Kitapları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Hukuk')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'İş, Ekonomi & Pazarlama')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Kişisel Gelişim')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'Manga')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (13, N'Sağlık, Beslenme & Spor')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (14, N'Siyaset - Politika')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (15, N'Yabancı Dilde Kitaplar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (16, N'Yemek Kitapları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (17, N'Dini Kitaplar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (18, N'Roman')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Name], [Surname], [Email], [PasswordHash], [PasswordSalt], [Phone], [Address]) VALUES (1, N'test', N'kursat', N'altunay', N'test@test.com', 0xCDE0C394BCAEFA86D3903D799539A0370DFD29DF63ABD72C6ED1DCDDE12DC64D256CF84CE940B7BEC9BF63C8D251873F3031A5C793A8E7E895903B47F0167FE8, 0xAB319901B63A96887EA0C9C47E7C70F4497D74D7819530AEE8C229946F5B2070D7048AE4C07938339E0923566139F9D7AD47B3DF2188D096EFE87F7D39858BA2CAB69A87E7B7929151922D5A7991CD6A7D276A62E3F3501C0EFE6C3B927135C6915C9BE803FC9B4B899ACD4746BCF046517FCA72DAE827F42576B8ECB4AA7DAB, 123456789, N'testadress1')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthor_Author]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthor_Book]
GO
ALTER TABLE [dbo].[BookCategories]  WITH CHECK ADD  CONSTRAINT [FK_BookCategories_Categories1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[BookCategories] CHECK CONSTRAINT [FK_BookCategories_Categories1]
GO
ALTER TABLE [dbo].[BookCategories]  WITH CHECK ADD  CONSTRAINT [FK_BookCategory_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[BookCategories] CHECK CONSTRAINT [FK_BookCategory_Book]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_Book]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Book]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_User]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Books]
GO
