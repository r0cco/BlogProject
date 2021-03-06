USE [master]
GO

IF  EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'TestPetShopBlog')
DROP DATABASE [TestPetShopBlog]
GO

/****** Object:  Database [PetShopBlog]    Script Date: 12/10/2015 2:15:25 PM ******/
CREATE DATABASE [TestPetShopBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetShopBlog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\PetShopBlog.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PetShopBlog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\PetShopBlog_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestPetShopBlog] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestPetShopBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestPetShopBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TestPetShopBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestPetShopBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestPetShopBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestPetShopBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestPetShopBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestPetShopBlog] SET  MULTI_USER 
GO
ALTER DATABASE [TestPetShopBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestPetShopBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestPetShopBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestPetShopBlog] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TestPetShopBlog] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TestPetShopBlog]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PostTitle] [nvarchar](100) NULL,
	[PostDate] [date] NULL,
	[PostContent] [text] NULL,
	[Author] [nvarchar](50) NULL,
	[PostStatus] [int] NULL,
	[IsStickyPost] [bit] NULL,
	[PublishDate] [date] NULL,
	[ExpirationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostsTags]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsTags](
	[PostID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [pk_PostsTags] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaticPages]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticPages](
	[StaticPageID] [int] IDENTITY(1,1) NOT NULL,
	[StaticPageDate] [date] NULL,
	[StaticPageTitle] [nvarchar](50) NULL,
	[StaticPageContent] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaticPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserComments]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserComments](
	[UserCommentID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserCommentUserName] [nvarchar](50) NULL,
	[UserCommentContent] [text] NULL,
	[UserCommentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Pet Health')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Pet Wellness')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Pet Products')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Pet Fun')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Getting to Know Your Pet')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'Specials')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (1, 2, N'Yet another Blog Post Title', CAST(N'2015-11-01' AS Date), N'<p>Lorem ipsum dolor sit amet paws drool play slobber bird food. Window kisses purr kitty wag tail stick window catch water birds play dead feathers running chow field fur aquarium feathers. Feathers pet gate scratcher furry kitten food cockatiel cage vaccination ball tooth toys Mittens walk run fast pet supplies bird food finch throw.</p> <p>Cat picture!!</p> <p><img src="http://placekitten.com.s3.amazonaws.com/homepage-samples/200/140.jpg" alt="" /></p>', N'Nikola Tesla', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (2, 4, N'SampleTitle4', CAST(N'2015-11-14' AS Date), N'<p>Lorem ipsum dolor sit amet window leash polydactyl groom walk dog running turtle dog house walk bed. Nap heel chow park polydactyl meow lazy dog litter box fish. Slobber Tigger Fido harness house train window furry harness catch dog left paw fetch twine lazy cat walk Scooby snacks critters. Parrot right paw Spike sit field canary litter harness chew Tigger slobbery dog house food. Fido ball Scooby snacks foot good boy field Spike polydactyl roll over bed dragging cage ferret Scooby snacks play wag tail. Puppy gimme five litter field sit stick toy Scooby snacks commands.</p> <p>Toy pet food foot bird seed field drool chirp house train treats commands. Hamster Tigger cat stay dog house tooth carrier nest aquarium park nap stripes park string running pet Rover good boy. Hamster play groom pet catch Rover wag tail toy bird food. Aquatic left paw dinnertime vaccine brush cat furry whiskers brush walk wet nose gimme five run. Cage Tigger harness pet polydactyl fur bird behavior stay ferret left paw cage birds feathers brush paws roll over. Parrot roll over parakeet Spike meow brush ID tag bed lazy cat. Litter twine kisses purr cat vaccine pet cage tail furry harness house train dog.</p>', N'Author', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (3, 3, N'SampleTitle3', CAST(N'2015-11-20' AS Date), N'<h2>Lorem</h2><p>Ipsum dolor sit amet finch kitten leash vaccination.</p>', N'Author', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (4, 2, N'Another Title', CAST(N'2015-11-24' AS Date), N'<p>Lorem ipsum dolor sit amet mouse parrot id tag walk hamster bird food house train swimming ball bed tabby lazy dog tigger. Tigger yawn roll over Rover play head chew yawn cage running.</p> <p>Here is a picture of a kitten:</p> <p><img src="http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg" alt="" /></p>', N'Author', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (5, 2, N'SampleTitle2', CAST(N'2015-11-25' AS Date), N'<p>Lorem ipsum dolor sit amet cage kibble speak.</p><p>Lick throw pet gate fluffy groom polydactyl</p><p>Kisses. Behavior dragging</p><p>Wag tail drool nap aquatic whiskers grooming run fast fluffy field purr Buddy bed swimming Mittens Buddy bird food throw pet supplies. Pet Supplies shake Snowball aquarium food roll over dragging stripes. Food stripes fur feeder wagging carrier leash. Ball dog house twine wag tail parakeet nest biscuit walk stripes Rover slobbery fish feeder yawn.</p>', N'Author', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (6, 1, N'SampleTitle1', CAST(N'2015-12-01' AS Date), N'<p>Lorem ipsum dolor sit amet smooshy</p><p>Feeder bird seed barky lazy cat wag tail catch bedding</p><p>Food dog house. String fur stripes house train kitty string. Fluffy leash walk nap pet purr dragging run feathers.</p>', N'Author', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (7, 3, N'A Title Will Go Here', CAST(N'2015-12-02' AS Date), N'<p>Lorem ipsum dolor sit amet tuxedo fluffy. Aquarium meow <strong>pet supplies vitamins</strong> bird seed feeder. Chew park lazy cat run fast stay strin<em>g chew vitamins toy turtle slo</em>bber cat park left paw pet <strong>supplies ferret nest w</strong>indow. <em>Maine Coon Cat lazy cat licks bark leash pet food dog house mouse speak hamster wagging aquarium</em> kitty throw kitten dragging Scooby snacks pet supplies.</p> <ul> <li>Feeder Snowball cage kibble crate</li> <li>cage fetch Mittens pet food kitty. Crate</li> <li>fleas bird food cat grooming crate lazy cat</li> <li>string biscuit toy meow ferret roll over Mittens string play dead</li> <li>canary lazy dog parakeet. Teeth groom roll over park kitten litter dragging speak groom bedding tongue.</li> </ul> <p>Cat picture incoming!!</p> <p><img src="http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg" alt="" /></p> <p>Some more text</p>', N'Benjamin Franklin', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (8, 5, N'Blog Post Title', CAST(N'2015-12-03' AS Date), N'<p>Lorem ipsum dolor sit amet paws drool play slobber bird food. Window kisses purr kitty wag tail stick window catch water birds play dead feathers running chow field fur aquarium feathers. Feathers pet gate scratcher furry kitten food cockatiel cage vaccination ball tooth toys Mittens walk run fast pet supplies bird food finch throw.</p> <p>Cat picture!!</p> <p><img src="http://placekitten.com.s3.amazonaws.com/homepage-samples/200/139.jpg" alt="" /></p>', N'George Washington', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (9, 4, N'A SampleTitle', CAST(N'2015-12-03' AS Date), N'<p>Lorem ipsum dolor sit amet head tongue puppy parakeet fluffy buddy run fast aquatic mouse fetch pet gate gimme five leash vitamins. Brush meow lol catz gimme five ball play dead. Smooshy puppy litter box smooshy litter fleas heel food turtle right paw ID tag kisses. Water lazy cat crate puppy brush fetch play Fido cage wet nose pet gate puppy fluffy brush head parakeet Buddy water dog Buddy. Dinnertime water finch string lick ball. Tooth stripes wag tail parrot fur dog house shake wag tail polydactyl lick stick. Field water dog tabby puppy licks drool furry canary groom.</p> <p>Fido foot treats cat kitty play Snowball Scooby snacks chew toy wagging play dead polydactyl chew cage. Shake chow Buddy warm kibble chow nap fluffy vitamins. Heel lol catz play aquarium scratcher furry tongue maine coon cat treats walk fleas roll over bird food. Fetch aquarium furry licks nap leash puppy bark. Walk wagging cockatiel cat tooth chew Buddy Tigger vitamins hamster treats right paw run fast kisses dog house pet supplies fluffy collar kitten park. Tuxedo kitten vaccine maine coon cat stay vaccine slobber park field wag tail shake ID tag. Critters litter box hamster commands cage head. Walk toy licks gimme five treats scratch crate dog scratch run fast tail wagging bark. Bird chirp twine Buddy dog house tooth kisses finch bird food feeder harness left paw crate left paw Fido chew. String pet supplies pet kisses parakeet ball finch twine pet food.</p> <p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRXk06ll2ouZMpcgSbzFR_2qD4NbnO8TVpOjNmKzkXCyE3yBDbU" alt="Image result for puppy pictures" /></p> <p>Twine cage head running sit right paw harness food polydactyl slobber parrot kitten play dead vaccine. String polydactyl wagging speak aquarium walk aquatic furry nap bird food dog house Rover mouse drool. Licks hamster small animals canary pet parakeet tongue bird seed ID tag ball kibble sit pet supplies bedding nap paws catch lol catz. Maine Coon Cat Spike dragging harness barky walk Scooby snacks turtle shake meow litter. Cage treats heel right paw polydactyl head pet supplies lazy dog scratch maine coon cat litter play dead vaccination stripes water dog bird parakeet pet food. Water litter box stick pet speak harness.</p> <p>Treats puppy bedding run slobbery yawn wag tail polydactyl foot Rover aquarium running furry. Parrot run brush canary water Tigger wagging aquarium finch Tigger right paw teeth carrier drool bark pet. Slobber Mittens bark lazy dog twine wag tail food scratch chew foot Mittens walk lick tail hamster stick. Run Fast park bed barky roll over bed pet supplies heel smooshy Mittens swimming wagging wet nose barky stick grooming hamster slobbery litter. Ferret bedding crate pet gate heel vaccine lick bedding play dead harness fetch pet gate turtle canary scratch dog house heel water licks window. Birds Rover feathers aquatic nap tongue bed litter box biscuit treats vaccination tooth teeth food wagging crate. Brush twine foot purr crate dragging lol catz nap vaccination Tigger barky park stay fish fur tongue. Fluffy twine Fido food critters house train Snowball commands tail fur dragging Buddy stripes harness critters nest mouse purr sit.</p> <p>Parrot aquatic stripes crate bed slobbery tooth groom yawn tongue pet harness puppy walk behavior throw food lick. Fleas brush dog house Spike dragging whiskers run fast aquarium wagging turtle left paw turtle puppy lazy dog. Vaccination bird food vitamins ID tag harness throw pet food Scooby snacks birds pet supplies bird running house train groom polydactyl dog house. Dinnertime kisses feeder vitamins roll over lol catz litter box play dead cockatiel Scooby snacks scratch sit aquatic biscuit ball. Play chow Spike feathers vaccination cat. Puppy slobbery park walk dragging Fido bird. Snowball shake bird collar bird slobber.</p>', N'Author McAuthor', 1, 0, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (10, 6, N'Holiday Special', CAST(N'2015-12-05' AS Date), N'<p>Do not forget your pet this holiday season.  All dog and cat toys are buy one get one free</p>', N'Chary Gurney', 1, 1, CAST(N'2015-12-01' AS Date), CAST(N'2016-01-10' AS Date))
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (11, 6, N'After Holiday Special', CAST(N'2015-12-07' AS Date), N'<p>This should not appear until January</p>', N'Thomas Edison', 1, 0, CAST(N'2016-01-11' AS Date), CAST(N'2016-02-17' AS Date))
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (12, 1, N'Table Scraps', CAST(N'2015-12-09' AS Date), N'<p>Are table scraps bad?</p>', N'pr@test.com', 1, 0, CAST(N'2015-12-09' AS Date), NULL)
INSERT [dbo].[Posts] ([PostID], [CategoryID], [PostTitle], [PostDate], [PostContent], [Author], [PostStatus], [IsStickyPost], [PublishDate], [ExpirationDate]) VALUES (13, 1, N'Title', CAST(N'2015-12-10' AS Date), N'<p>vdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssv</p>
<p>vdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssv</p>
<p>vdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssvvdsvsdvssv</p>', N'pr@test.com', 0, 0, CAST(N'2015-12-10' AS Date), CAST(N'2015-12-25' AS Date))
SET IDENTITY_INSERT [dbo].[Posts] OFF
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (1, 1)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (1, 4)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (1, 5)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (2, 2)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (2, 3)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (2, 5)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (2, 10)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (3, 2)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (3, 4)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (3, 6)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (4, 5)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (4, 10)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (4, 11)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (4, 12)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (5, 5)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (5, 6)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (7, 5)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (7, 7)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (7, 12)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (8, 1)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (8, 4)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (8, 8)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (9, 3)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (9, 4)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (9, 5)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (9, 7)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (9, 9)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (9, 10)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (9, 11)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (9, 12)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (12, 13)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (12, 14)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (13, 1)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (13, 2)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (13, 15)
INSERT [dbo].[PostsTags] ([PostID], [TagID]) VALUES (13, 16)
SET IDENTITY_INSERT [dbo].[StaticPages] ON 

INSERT [dbo].[StaticPages] ([StaticPageID], [StaticPageDate], [StaticPageTitle], [StaticPageContent]) VALUES (1, CAST(N'2015-12-01' AS Date), N'About Us', N'<p>Dapper Dawg opened its doors in 2013. In 2015 we extended our products to include cats, reptiles amd other small pets.  We know that your pets are more than just animals, they are family!</p><p>We want to be your #1 resource for ALL your pets'' needs.</p> <p style="text-align: center;"><img src="http://weknowyourdreams.com/images/dog/dog-07.jpg" alt="" width="400" height="437"></p>')
INSERT [dbo].[StaticPages] ([StaticPageID], [StaticPageDate], [StaticPageTitle], [StaticPageContent]) VALUES (2, CAST(N'2015-12-01' AS Date), N'Contact Us', N'<address>526 South Main Street<br/>Akron, OH 44311 <br/><abbr title="Phone">Phone:</abbr>425.555.0100</address><address><strong>Support:</strong> <a id="email" href="mailto:Support@example.com">Support@dapperdawg.com</a><br/><strong>Marketing:</strong> <a id="email" href="mailto:Marketing@example.com">Marketing@dapperdawg.com</a></address>')
INSERT [dbo].[StaticPages] ([StaticPageID], [StaticPageDate], [StaticPageTitle], [StaticPageContent]) VALUES (3, CAST(N'2015-12-10' AS Date), N'New Static Page', N'<p>vfsdvsvssvvs</p>')
SET IDENTITY_INSERT [dbo].[StaticPages] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (1, N'dogs')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (2, N'cats')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (3, N'ferrets')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (4, N'food')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (5, N'toys')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (6, N'health')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (7, N'fun')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (8, N'knowledge')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (9, N'happy')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (10, N'smiley')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (11, N'turtles')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (12, N'snakes')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (13, N'yummyfood')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (14, N'healthytreats')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (15, N'tag')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (16, N'newtag')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[UserComments] ON 

INSERT [dbo].[UserComments] ([UserCommentID], [PostID], [UserCommentUserName], [UserCommentContent], [UserCommentDate]) VALUES (1, 9, N'bbf', N'Comment', CAST(N'2015-12-10' AS Date))
INSERT [dbo].[UserComments] ([UserCommentID], [PostID], [UserCommentUserName], [UserCommentContent], [UserCommentDate]) VALUES (2, 10, NULL, N'cccccc', CAST(N'2015-12-10' AS Date))
SET IDENTITY_INSERT [dbo].[UserComments] OFF
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[PostsTags]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[PostsTags]  WITH CHECK ADD FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
GO
ALTER TABLE [dbo].[UserComments]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
/****** Object:  StoredProcedure [dbo].[AddNewCategory]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddNewCategory] (@categoryName nvarchar(50))
as
begin
insert into Categories
values (@categoryName)
end


GO
/****** Object:  StoredProcedure [dbo].[AddNewPost]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddNewPost](
	@CategoryID int,
	@PostTitle nvarchar(100),
	@PostDate date,
	@PostContent text,
	@Author nvarchar(50),
	@PostStatus int,
	@PostID int output,
	@IsStickyPost bit,
	@PublishDate date,
	@ExpirationDate date
	)
	as
begin
	insert into Posts (CategoryID, PostTitle, PostDate, PostContent, Author, PostStatus, IsStickyPost, PublishDate, ExpirationDate)
	values (@CategoryID, @PostTitle, @PostDate, @PostContent, @Author, @PostStatus, @IsStickyPost, @PublishDate, @ExpirationDate)
set @PostID = SCOPE_IDENTITY()
end


GO
/****** Object:  StoredProcedure [dbo].[AddNewPostTags]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddNewPostTags] (@TagId int, @PostId int)
as
begin
insert into PostsTags (PostID, TagID)
values (@postid, @tagid)
end


GO
/****** Object:  StoredProcedure [dbo].[AddNewStaticPage]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddNewStaticPage](
@StaticPageID int output,
@StaticPageDate date,
@StaticPageTitle nvarchar(50),
@StaticPageContent text
)
as
begin
insert into StaticPages (StaticPageDate, StaticPageTitle, StaticPageContent)
values(@StaticPageDate, @StaticPageTitle, @StaticPageContent)

set @StaticPageID = SCOPE_IDENTITY();

end


GO
/****** Object:  StoredProcedure [dbo].[AddNewTag]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddNewTag]( 
@TagName nvarchar(50),
@TagID int output
)
as
begin
insert into Tags (TagName)
values (@TagName)

set @TagID = SCOPE_IDENTITY();
end


GO
/****** Object:  StoredProcedure [dbo].[AddNewUserComment]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddNewUserComment]
(@PostID int, @UserCommentUserName nvarchar(50), @UserCommentContent text, @UserCommentDate date, @UserCommentID int output)
as
begin
insert into UserComments (PostID, UserCommentUserName, UserCommentContent, UserCommentDate)
values (@PostID, @UserCommentUserName, @UserCommentContent, @UserCommentDate)

set @UserCommentID = SCOPE_IDENTITY()
end


GO
/****** Object:  StoredProcedure [dbo].[GetAllPostsOrderedByDate]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetAllPostsOrderedByDate] 
as
begin
select *
from Posts
where PostStatus = 1
order by IsStickyPost desc, PostDate desc, PostID desc
end


GO
/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetAllStaticPages]
as
begin
select * from StaticPages
end


GO
/****** Object:  StoredProcedure [dbo].[GetAllTags]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetAllTags] 
as
begin
select *
from Tags
end


GO
/****** Object:  StoredProcedure [dbo].[GetAllTagsOnAPostByPostID]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetAllTagsOnAPostByPostID] (@postId int)
as
begin
select t.TagID, t.TagName
from Tags t
	inner join PostsTags pt on t.TagID = pt.TagID
where pt.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[GetCategoryByPostID]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetCategoryByPostID] (@postId int)
as
begin
select c.CategoryName from Categories c
	inner join Posts p on p.CategoryID = c.CategoryID
where p.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[GetDeletedPosts]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetDeletedPosts] 
as
begin
select * from Posts
Where PostStatus = 2
end


GO
/****** Object:  StoredProcedure [dbo].[GetPostbyDate]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPostbyDate] (@postdate date)
as
begin
select *
from Posts where posts.PostDate = @postdate and posts.PostStatus = 1
end


GO
/****** Object:  StoredProcedure [dbo].[GetPostByID]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPostByID] (@postId int)
as
begin
select * from Posts p
where p.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[GetPostsByCategory]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPostsByCategory] (@categoryID int)
as
begin
select *
from posts p where p.CategoryID = @categoryID and p.PostStatus = 1
order by p.PostDate desc, p.PostID desc 
end


GO
/****** Object:  StoredProcedure [dbo].[GetPostsByPR]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPostsByPR]
as
begin
select * from posts
where PostStatus = 0
end


GO
/****** Object:  StoredProcedure [dbo].[GetPostsByTag]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPostsByTag] (@tagId int)
as
begin
select *
from Posts p
	inner join PostsTags pt on pt.PostID = p.PostID
	inner join tags t on pt.TagID = t.TagID
where p.PostStatus = 1 and t.TagID = @tagId
order by p.PostDate desc, p.PostID desc
end


GO
/****** Object:  StoredProcedure [dbo].[GetStaticPageByID]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetStaticPageByID] (@StaticPageID int)
as
begin
select * from StaticPages where StaticPageID = @StaticPageID
end


GO
/****** Object:  StoredProcedure [dbo].[GetUserCommentsByPostID]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetUserCommentsByPostID] (@PostID int)
as
begin
select * from UserComments
where PostID = @PostID
order by UserCommentDate desc
end


GO
/****** Object:  StoredProcedure [dbo].[RemovePostFromPostTagsTable]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[RemovePostFromPostTagsTable] (@postId int)
as
begin
delete from PostsTags
where PostsTags.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[SetPostStatusTo1]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[SetPostStatusTo1] (@postId int)
as
begin
update posts
set posts.PostStatus = 1
where posts.PostID = @postid
end


GO
/****** Object:  StoredProcedure [dbo].[SetPostStatusTo2]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SetPostStatusTo2] (@postId int)
as
begin
update posts
set posts.PostStatus = 2
where posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdateCategoryID]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdateCategoryID] (@postId int, @newCategoryId int)
as
begin
update Posts
set Posts.CategoryID = @newCategoryId
where Posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdateExpirationDate]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdateExpirationDate] (@postId int, @newExpirationDate date)
as
begin
update Posts
set Posts.ExpirationDate = @newExpirationDate
where Posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdateIsStickyPost]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdateIsStickyPost] (@postId int, @newIsStickyPost bit)
as
begin
update Posts
set Posts.IsStickyPost = @newIsStickyPost
where posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdatePostAuthor]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdatePostAuthor] (@postId int, @newAuthor nvarchar(50))
as
begin
update Posts
set Posts.Author = @newAuthor
where Posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdatePostContent]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdatePostContent] (@postId int, @newPostContent text)
as
begin
update Posts
set Posts.PostContent = @newPostContent
where Posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdatePostDate]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdatePostDate] (@postId int, @newPostDate date)
as
begin
update Posts
set Posts.PostDate = @newPostDate
where Posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdatePostTitle]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdatePostTitle] (@postId int, @newPostTitle nvarchar(100))
as
begin
update Posts
set Posts.PostTitle = @newPostTitle
where Posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdatePublishDate]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdatePublishDate] (@postId int, @newPublishDate date)
as
begin
update Posts
set Posts.PublishDate = @newPublishDate
where Posts.PostID = @postId
end


GO
/****** Object:  StoredProcedure [dbo].[UpdateStaticPage]    Script Date: 12/10/2015 2:15:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdateStaticPage] (@StaticPageId int, @newStaticPageTitle nvarchar(50), @newStaticPageContent text)
as
begin
update StaticPages
set StaticPageTitle = @newStaticPageTitle, StaticPageContent = @newStaticPageContent
where StaticPages.StaticPageID = @StaticPageId
end


GO
USE [master]
GO
ALTER DATABASE [TestPetShopBlog] SET  READ_WRITE 
GO
