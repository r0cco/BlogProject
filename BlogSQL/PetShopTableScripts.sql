use master
go

drop database PetShopBlog
go

create database PetShopBlog
go

use PetShopBlog
go

create table Categories (
	CategoryID int identity (1, 1) primary key not null,
	CategoryName nvarchar(50)
)
go

create table Posts (
	PostID int identity (1, 1) primary key not null,
	CategoryID int foreign key references Categories (CategoryID) not null,
	PostTitle nvarchar(100),
	PostDate date,
	PostContent text,
	Author nvarchar(50),
	PostStatus int,
	IsStickyPost bit,
	PublishDate date,
	ExpirationDate date
)
go

create table UserComments (
	UserCommentID int identity (1,1) primary key not null,
	PostID int foreign key references Posts (PostID) not null,
	UserCommentUserName nvarchar(50),
	UserCommentContent text,
	UserCommentDate date
)
go

create table Tags (
	TagID int identity (1, 1) primary key not null,
	TagName nvarchar(50)
)
go



create table StaticPages (
	StaticPageID int identity (1, 1) primary key not null,
	StaticPageDate date,
	StaticPageTitle nvarchar(50),
	StaticPageContent text
)
go


create table PostsTags (
	PostID int foreign key references Posts (PostID) not null,
	TagID int foreign key references Tags (TagID) not null,
	constraint pk_PostsTags primary key (PostID, TagID)
)
go
begin
	insert into Categories
	values ('Pet Health'),('Pet Wellness'),('Pet Products'),('Pet Fun'),('Getting to Know Your Pet'),('Specials')

	insert into Posts
	values
	(2,'Yet another Blog Post Title','2015-11-01','<p>Lorem ipsum dolor sit amet paws drool play slobber bird food. Window kisses purr kitty wag tail stick window catch water birds play dead feathers running chow field fur aquarium feathers. Feathers pet gate scratcher furry kitten food cockatiel cage vaccination ball tooth toys Mittens walk run fast pet supplies bird food finch throw.</p> <p>Cat picture!!</p> <p><img src="http://placekitten.com.s3.amazonaws.com/homepage-samples/200/140.jpg" alt="" /></p>','Nikola Tesla',1,0,null,null),
	(4,'SampleTitle4','2015-11-14','<p>Lorem ipsum dolor sit amet window leash polydactyl groom walk dog running turtle dog house walk bed. Nap heel chow park polydactyl meow lazy dog litter box fish. Slobber Tigger Fido harness house train window furry harness catch dog left paw fetch twine lazy cat walk Scooby snacks critters. Parrot right paw Spike sit field canary litter harness chew Tigger slobbery dog house food. Fido ball Scooby snacks foot good boy field Spike polydactyl roll over bed dragging cage ferret Scooby snacks play wag tail. Puppy gimme five litter field sit stick toy Scooby snacks commands.</p> <p>Toy pet food foot bird seed field drool chirp house train treats commands. Hamster Tigger cat stay dog house tooth carrier nest aquarium park nap stripes park string running pet Rover good boy. Hamster play groom pet catch Rover wag tail toy bird food. Aquatic left paw dinnertime vaccine brush cat furry whiskers brush walk wet nose gimme five run. Cage Tigger harness pet polydactyl fur bird behavior stay ferret left paw cage birds feathers brush paws roll over. Parrot roll over parakeet Spike meow brush ID tag bed lazy cat. Litter twine kisses purr cat vaccine pet cage tail furry harness house train dog.</p>','Author',1,0,NULL,NULL),
	(3,'SampleTitle3','2015-11-20','<h2>Lorem</h2><p>Ipsum dolor sit amet finch kitten leash vaccination.</p>','Author',1,0,null,null),
	(2,'Another Title','2015-11-24','<p>Lorem ipsum dolor sit amet mouse parrot id tag walk hamster bird food house train swimming ball bed tabby lazy dog tigger. Tigger yawn roll over Rover play head chew yawn cage running.</p> <p>Here is a picture of a kitten:</p> <p><img src="http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg" alt="" /></p>','Author',1,0,null,null),
	(2,'SampleTitle2','2015-11-25','<p>Lorem ipsum dolor sit amet cage kibble speak.</p><p>Lick throw pet gate fluffy groom polydactyl</p><p>Kisses. Behavior dragging</p><p>Wag tail drool nap aquatic whiskers grooming run fast fluffy field purr Buddy bed swimming Mittens Buddy bird food throw pet supplies. Pet Supplies shake Snowball aquarium food roll over dragging stripes. Food stripes fur feeder wagging carrier leash. Ball dog house twine wag tail parakeet nest biscuit walk stripes Rover slobbery fish feeder yawn.</p>','Author',1,0,null,null),
	(1,'SampleTitle1','2015-12-01','<p>Lorem ipsum dolor sit amet smooshy</p><p>Feeder bird seed barky lazy cat wag tail catch bedding</p><p>Food dog house. String fur stripes house train kitty string. Fluffy leash walk nap pet purr dragging run feathers.</p>','Author',1,0,null,null),
	(3,'A Title Will Go Here','2015-12-02','<p>Lorem ipsum dolor sit amet tuxedo fluffy. Aquarium meow <strong>pet supplies vitamins</strong> bird seed feeder. Chew park lazy cat run fast stay strin<em>g chew vitamins toy turtle slo</em>bber cat park left paw pet <strong>supplies ferret nest w</strong>indow. <em>Maine Coon Cat lazy cat licks bark leash pet food dog house mouse speak hamster wagging aquarium</em> kitty throw kitten dragging Scooby snacks pet supplies.</p> <ul> <li>Feeder Snowball cage kibble crate</li> <li>cage fetch Mittens pet food kitty. Crate</li> <li>fleas bird food cat grooming crate lazy cat</li> <li>string biscuit toy meow ferret roll over Mittens string play dead</li> <li>canary lazy dog parakeet. Teeth groom roll over park kitten litter dragging speak groom bedding tongue.</li> </ul> <p>Cat picture incoming!!</p> <p><img src="http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg" alt="" /></p> <p>Some more text</p>','Benjamin Franklin',1,0,null,null),
	(5,'Blog Post Title','2015-12-03','<p>Lorem ipsum dolor sit amet paws drool play slobber bird food. Window kisses purr kitty wag tail stick window catch water birds play dead feathers running chow field fur aquarium feathers. Feathers pet gate scratcher furry kitten food cockatiel cage vaccination ball tooth toys Mittens walk run fast pet supplies bird food finch throw.</p> <p>Cat picture!!</p> <p><img src="http://placekitten.com.s3.amazonaws.com/homepage-samples/200/139.jpg" alt="" /></p>','George Washington',1,0,null,null),
	(4,'A SampleTitle','2015-12-03','<p>Lorem ipsum dolor sit amet head tongue puppy parakeet fluffy buddy run fast aquatic mouse fetch pet gate gimme five leash vitamins. Brush meow lol catz gimme five ball play dead. Smooshy puppy litter box smooshy litter fleas heel food turtle right paw ID tag kisses. Water lazy cat crate puppy brush fetch play Fido cage wet nose pet gate puppy fluffy brush head parakeet Buddy water dog Buddy. Dinnertime water finch string lick ball. Tooth stripes wag tail parrot fur dog house shake wag tail polydactyl lick stick. Field water dog tabby puppy licks drool furry canary groom.</p> <p>Fido foot treats cat kitty play Snowball Scooby snacks chew toy wagging play dead polydactyl chew cage. Shake chow Buddy warm kibble chow nap fluffy vitamins. Heel lol catz play aquarium scratcher furry tongue maine coon cat treats walk fleas roll over bird food. Fetch aquarium furry licks nap leash puppy bark. Walk wagging cockatiel cat tooth chew Buddy Tigger vitamins hamster treats right paw run fast kisses dog house pet supplies fluffy collar kitten park. Tuxedo kitten vaccine maine coon cat stay vaccine slobber park field wag tail shake ID tag. Critters litter box hamster commands cage head. Walk toy licks gimme five treats scratch crate dog scratch run fast tail wagging bark. Bird chirp twine Buddy dog house tooth kisses finch bird food feeder harness left paw crate left paw Fido chew. String pet supplies pet kisses parakeet ball finch twine pet food.</p> <p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRXk06ll2ouZMpcgSbzFR_2qD4NbnO8TVpOjNmKzkXCyE3yBDbU" alt="Image result for puppy pictures" /></p> <p>Twine cage head running sit right paw harness food polydactyl slobber parrot kitten play dead vaccine. String polydactyl wagging speak aquarium walk aquatic furry nap bird food dog house Rover mouse drool. Licks hamster small animals canary pet parakeet tongue bird seed ID tag ball kibble sit pet supplies bedding nap paws catch lol catz. Maine Coon Cat Spike dragging harness barky walk Scooby snacks turtle shake meow litter. Cage treats heel right paw polydactyl head pet supplies lazy dog scratch maine coon cat litter play dead vaccination stripes water dog bird parakeet pet food. Water litter box stick pet speak harness.</p> <p>Treats puppy bedding run slobbery yawn wag tail polydactyl foot Rover aquarium running furry. Parrot run brush canary water Tigger wagging aquarium finch Tigger right paw teeth carrier drool bark pet. Slobber Mittens bark lazy dog twine wag tail food scratch chew foot Mittens walk lick tail hamster stick. Run Fast park bed barky roll over bed pet supplies heel smooshy Mittens swimming wagging wet nose barky stick grooming hamster slobbery litter. Ferret bedding crate pet gate heel vaccine lick bedding play dead harness fetch pet gate turtle canary scratch dog house heel water licks window. Birds Rover feathers aquatic nap tongue bed litter box biscuit treats vaccination tooth teeth food wagging crate. Brush twine foot purr crate dragging lol catz nap vaccination Tigger barky park stay fish fur tongue. Fluffy twine Fido food critters house train Snowball commands tail fur dragging Buddy stripes harness critters nest mouse purr sit.</p> <p>Parrot aquatic stripes crate bed slobbery tooth groom yawn tongue pet harness puppy walk behavior throw food lick. Fleas brush dog house Spike dragging whiskers run fast aquarium wagging turtle left paw turtle puppy lazy dog. Vaccination bird food vitamins ID tag harness throw pet food Scooby snacks birds pet supplies bird running house train groom polydactyl dog house. Dinnertime kisses feeder vitamins roll over lol catz litter box play dead cockatiel Scooby snacks scratch sit aquatic biscuit ball. Play chow Spike feathers vaccination cat. Puppy slobbery park walk dragging Fido bird. Snowball shake bird collar bird slobber.</p>','Author McAuthor',1,0,null,null),
	(6,'Holiday Special','2015-12-05', '<p>Do not forget your pet this holiday season.  All dog and cat toys are buy one get one free</p>','Chary Gurney',1,1,'2015-12-01','2016-01-10'),
	(6,'After Holiday Special','2015-12-07','<p>This should not appear until January</p>','Thomas Edison',1,0,'2016-01-11','2016-02-17')
	
	insert into Tags
	values ('dogs'),('cats'),('ferrets'),('food'),('toys'),('health'),('fun'),('knowledge'),('happy'),('smiley'),('turtles'),('snakes')

	insert into StaticPages
	values ('2015-12-01','About Us','<p>Dapper Dawg opened its doors in 2013. In 2015 we extended our products to include cats, reptiles amd other small pets.  We know that your pets are more than just animals, they are family!</p><p>We want to be your #1 resource for ALL your pets'' needs.</p> <p style="text-align: center;"><img src="http://weknowyourdreams.com/images/dog/dog-07.jpg" alt="" width="400" height="437"></p>'),
	('2015-12-01','Contact Us','<address>526 South Main Street<br/>Akron, OH 44311 <br/><abbr title="Phone">Phone:</abbr>425.555.0100</address><address><strong>Support:</strong> <a id="email" href="mailto:Support@example.com">Support@dapperdawg.com</a><br/><strong>Marketing:</strong> <a id="email" href="mailto:Marketing@example.com">Marketing@dapperdawg.com</a></address>')

	insert into PostsTags
	values (1,1),
	(1,4),
	(1,5),
	(2,2),
	(2,3),
	(2,5),
	(2,10),
	(3,4),
	(3,2),
	(3,6),
	(4,5),
	(4,10),
	(4,11),
	(4,12),
	(5,5),
	(5,6),
	(7,5),
	(7,7),
	(7,12),
	(8,1),
	(8,4),
	(8,8),
	(9,3),
	(9,7),
	(9,9),
	(9,12),
	(9,11),
	(9,4),
	(9,5),
	(9,10)

end
go

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

go

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

go

create procedure [dbo].[GetPostsByPR]
as
begin
select * from posts
where PostStatus = 0
end

go

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

go

create procedure [dbo].[GetAllStaticPages]
as
begin
select * from StaticPages
end

go

create procedure [dbo].[GetAllPostsOrderedByDate] 
as
begin
select *
from Posts
where PostStatus = 1
order by IsStickyPost desc, PostDate desc, PostID desc
end

go

create procedure [dbo].[GetPostbyDate] (@postdate date)
as
begin
select *
from Posts where posts.PostDate = @postdate and posts.PostStatus = 1
end

go

create procedure [dbo].[GetPostsByCategory] (@categoryID int)
as
begin
select *
from posts p where p.CategoryID = @categoryID and p.PostStatus = 1
order by p.PostDate desc, p.PostID desc 
end

go

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

go

create procedure [dbo].[AddNewPostTags] (@TagId int, @PostId int)
as
begin
insert into PostsTags (PostID, TagID)
values (@postid, @tagid)
end

go

create procedure [dbo].[GetAllTags] 
as
begin
select *
from Tags
end

go

create procedure [dbo].[UpdateStaticPage] (@StaticPageId int, @newStaticPageTitle nvarchar(50), @newStaticPageContent text)
as
begin
update StaticPages
set StaticPageTitle = @newStaticPageTitle, StaticPageContent = @newStaticPageContent
where StaticPages.StaticPageID = @StaticPageId
end

go

create procedure [dbo].[UpdateCategoryID] (@postId int, @newCategoryId int)
as
begin
update Posts
set Posts.CategoryID = @newCategoryId
where Posts.PostID = @postId
end

go

create procedure [dbo].[UpdatePostTitle] (@postId int, @newPostTitle nvarchar(100))
as
begin
update Posts
set Posts.PostTitle = @newPostTitle
where Posts.PostID = @postId
end

go

create procedure [dbo].[UpdatePostDate] (@postId int, @newPostDate date)
as
begin
update Posts
set Posts.PostDate = @newPostDate
where Posts.PostID = @postId
end

go

create procedure [dbo].[UpdateIsStickyPost] (@postId int, @newIsStickyPost bit)
as
begin
update Posts
set Posts.IsStickyPost = @newIsStickyPost
where posts.PostID = @postId
end

go
create procedure [dbo].[UpdatePostContent] (@postId int, @newPostContent text)
as
begin
update Posts
set Posts.PostContent = @newPostContent
where Posts.PostID = @postId
end

go

create procedure [dbo].[UpdatePostAuthor] (@postId int, @newAuthor nvarchar(50))
as
begin
update Posts
set Posts.Author = @newAuthor
where Posts.PostID = @postId
end

go

create procedure [dbo].[UpdatePublishDate] (@postId int, @newPublishDate date)
as
begin
update Posts
set Posts.PublishDate = @newPublishDate
where Posts.PostID = @postId
end

go

create procedure [dbo].[UpdateExpirationDate] (@postId int, @newExpirationDate date)
as
begin
update Posts
set Posts.ExpirationDate = @newExpirationDate
where Posts.PostID = @postId
end

go

create procedure [dbo].[RemovePostFromPostTagsTable] (@postId int)
as
begin
delete from PostsTags
where PostsTags.PostID = @postId
end

go


create procedure [dbo].[SetPostStatusTo1] (@postId int)
as
begin
update posts
set posts.PostStatus = 1
where posts.PostID = @postid
end

go

create procedure [dbo].[SetPostStatusTo2] (@postId int)
as
begin
update posts
set posts.PostStatus = 2
where posts.PostID = @postId
end

go

create procedure [dbo].[GetPostByID] (@postId int)
as
begin
select * from Posts p
where p.PostID = @postId
end

go

create procedure [dbo].[GetStaticPageByID] (@StaticPageID int)
as
begin
select * from StaticPages where StaticPageID = @StaticPageID
end

go

create procedure [dbo].[GetAllTagsOnAPostByPostID] (@postId int)
as
begin
select t.TagID, t.TagName
from Tags t
	inner join PostsTags pt on t.TagID = pt.TagID
where pt.PostID = @postId
end

go

create procedure [dbo].[GetCategoryByPostID] (@postId int)
as
begin
select c.CategoryName from Categories c
	inner join Posts p on p.CategoryID = c.CategoryID
where p.PostID = @postId
end

go

create procedure [dbo].[AddNewCategory] (@categoryName nvarchar(50))
as
begin
insert into Categories
values (@categoryName)
end

go

create procedure [dbo].[GetDeletedPosts] 
as
begin
select * from Posts
Where PostStatus = 2
end

go

create procedure [dbo].[AddNewUserComment]
(@PostID int, @UserCommentUserName nvarchar(50), @UserCommentContent text, @UserCommentDate date, @UserCommentID int output)
as
begin
insert into UserComments (PostID, UserCommentUserName, UserCommentContent, UserCommentDate)
values (@PostID, @UserCommentUserName, @UserCommentContent, @UserCommentDate)

set @UserCommentID = SCOPE_IDENTITY()
end

go

create procedure [dbo].[GetUserCommentsByPostID] (@PostID int)
as
begin
select * from UserComments
where PostID = @PostID
order by UserCommentDate desc
end

go
