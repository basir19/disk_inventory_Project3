/*
		Name				Date				Project
		Basir Qurbani		10/11/2019			SWDV 220 Project 3

*/
------------------------Code is used from project 2 starts here ----------------------------------------------
USE master
GO

if DB_ID('disk_inventoryBQ') is not null
	DROP DATABASE disk_inventoryBQ
	GO

CREATE DATABASE disk_inventoryBQ;
GO

USE disk_inventoryBQ;

--Genre, dist status and dist type Tables
CREATE TABLE Genre(
	GenreID			int					not null IDENTITY	PRIMARY KEY,
	GenreDesciption	varchar(255)		not null
);

CREATE TABLE DiskStatus(
	StatusID			int				not null IDENTITY	PRIMARY KEY,
	StatusDescription	varchar(255)	not null
);

CREATE TABLE DiskType(
	TypeID				int				not null IDENTITY	PRIMARY KEY,
	TypeDescription		varchar(255)	not null
);

--Disk table
CREATE TABLE CD_DVD(
	DiskID				int				not null IDENTITY	PRIMARY KEY,
	DiskName			varchar(100)	not null,
	DiskReleaseDate		date			not null,
	TypeID				int				not null REFERENCES	DiskType(TypeID),
	StatusID			int				not null REFERENCES	DiskStatus(StatusID),
	GenreID				int				not null REFERENCES	Genre(GenreID)
);

--Artist Table
CREATE TABLE ArtistType(
	ArtistTypeID		int				not null IDENTITY	PRIMARY KEY,
	ArtistDesciption	varchar(255)	not null
);

CREATE TABLE Artist(
	ArtistID			int				not null IDENTITY	PRIMARY KEY,
	ArtistFirstName		varchar(50)		not null,
	ArtistLastName		varchar(50),
	ArtistTypeID		int				not null REFERENCES ArtistType(ArtistTypeID)
);

--Artist_Disk table that joins the artist and cd tables
CREATE TABLE Artist_Disk(
	ArtistID			int				not null REFERENCES Artist(ArtistID),
	DiskID				int				not null REFERENCES CD_DVD(DiskID),
	PRIMARY KEY(ArtistID, DiskID)
);

--table that stores information about disk borrowers
CREATE TABLE Borrower(
	BorrowerID			int				not null IDENTITY	PRIMARY KEY,
	BorrowerFirstName	varchar(50)		not null,
	BorrowerLastName	varchar(50)		not null,
	BorrowerPhoneNum	varchar(16)		not null
);

--Borrower_Disk table joins the Disk table and Borrower table
CREATE TABLE Borrower_Disk(
	DiskID				int				not null REFERENCES	CD_DVD(DiskID),
	BorrowerID			int				not null REFERENCES Borrower(BorrowerID),
	BorrowDate			date			not null,
	BorrowReturnDate	date			null,
	PRIMARY KEY(DiskID, BorrowerID, BorrowDate)
);


--create login user for disk table
IF SUSER_ID('diskUserBQ') is null
	CREATE LOGIN diskUserBQ WITH PASSWORD = 'Pa$$w0rd',
	DEFAULT_DATABASE = disk_inventoryBQ;

--Create user 
IF USER_ID('diskUserBQ') is null
	CREATE USER diskUserBQ;


ALTER ROLE db_datareader ADD member diskUserBQ;
GO

------------------------Code is used from project 2 Ends here ----------------------------------------------

-------------------CD_DVD Table related codes starts-----------------------
--Insert data into diskStatus Table
INSERT INTO [dbo].[DiskStatus]
			([StatusDescription])
VALUES		
			('Available'),
			('On Loan'),
			('Damaged'),
			('Missing')
GO

--Insert data into DiskType table 
INSERT INTO [dbo].[DiskType]
			([TypeDescription])
VALUES		
			('DVD'),
			('CD'),
			('8-Tracks')
GO

--Insert data into Genre Table
INSERT INTO [dbo].[Genre]
			([GenreDesciption])
VALUES		
			('Rock'),
			('Country'),
			('Jazz')
GO

--Insert Data into CD_DVD Table
INSERT INTO [dbo].[CD_DVD]
			([DiskName],[DiskReleaseDate],[TypeID],[StatusID],[GenreID])

VALUES		
			('Take Five','2013',1,1,3),
			('So What','2013',1,3,3),
			('Take The A Train','2013',1,3,3),
			('Round MidNight','2013',1,4,3),
			('My Favorite Things','2013',1,1,3),
			('A Love Supreme (Acknowledgment)','2013',1,4,3),
			('All Blues','2013',1,1,3),
			('Birdland','2013',1,1,3),
			('The Girl From Ipanema','2013',1,2,3),
			('Sing, Sing, Sing','2013',1,2,2),
			('Strange Fruit','2013',1,2,2),
			('A Night in Tunisia','2013',1,2,2),
			('Giant Steps','2013',1,4,2),
			('Blue Rondo a la Turk','2013',1,4,2),
			('Goodbye Pork Pie Hat','2013',1,1,2),
			('Stolen Moments','2013',1,3,2),
			('West End Blues','2013',1,3,1),
			('God Bless The Child','2013',1,3,1),
			('Cantaloupe Island','2013',1,2,1),
			('My Funny Valentine','2013',1,1,1),
			('Body And Soul','2013',1,2,1),
			('Song For My Father','2013',1,1,1)

GO

--updates diskType in CD_DVD table based on the CD_DVD id
UPDATE [dbo].[CD_DVD]
		SET		[TypeID] = 2
		WHERE	[DiskID] IN (6,8);

UPDATE [dbo].[CD_DVD]
		SET		[StatusID] = 2
		WHERE	[DiskID] IN (4,10,12,13,15);

UPDATE [dbo].[CD_DVD]
		SET		[GenreID] = 3
		WHERE	[DiskID] IN (2,3,4,5);

UPDATE [dbo].[CD_DVD]
		SET		[GenreID] = 3
		WHERE	[DiskID] IN (6,7,8,9);



-------------------CD_DVD Table related codes Ends-----------------------
-------------------Artist Table related codes starts-----------------------
--insert data into artistType Table
INSERT INTO [dbo].[ArtistType]
			([ArtistDesciption])
VALUES		
			('Solo'),
			('Group')
GO
--insert data into Artist table
INSERT INTO [dbo].[Artist]
			([ArtistFirstName],[ArtistLastName],[ArtistTypeID])
VALUES		
			('Dave','Brubeck', 1),
			('Miles','Davis', 1),
			('Duke', 'Ellington', 1),
			('Thelonious', 'Mon', 1),
			('John', 'Coltrane', 2),
			('John', null, 2),
			('Billie', 'Holiday', 2),
			('Dizzy', 'Gillespie', 2),
			('Charles', 'Mingus', 2),
			('Oliver', 'Nelson', 2),
			('Louis', null, 2),
			('Billie', 'Holiday', 2),
			('Herbie', 'Hancock', 2),
			('Chet', 'Baker', 1),
			('Dave','Brubeck', 1),
			('Dave','Brubeck', 1),
			('Dave','Brubeck', 1),
			('Dave','Brubeck', 1),
			('Dave','Brubeck', 1),
			('Dave','Brubeck', 1),
			('Dave','Brubeck', 1),
			('Dave','Brubeck', 1)
GO
SELECT * FROM [dbo].[Artist];

--Join table for Artis_Disk Table
INSERT INTO [dbo].[Artist_Disk]
			([ArtistID],[DiskID])
VALUES
			(1,1),
			(4,5),
			(4,6),
			(5,6),
			(7,2),
			(8,3),
			(9,9),
			(10,9),
			(15,21),
			(5,5),
			(8,5),
			(7,7),
			(12,12),
			(13,13),
			(14,13),
			(15,10),
			(16,21),
			(17,9),
			(18,18),
			(19,17),
			(20,14),
			(17,20);
-------------------Artist Table related codes Ends-----------------------
-------------------Browwer Table related codes Starts-----------------------
INSERT INTO [dbo].[Borrower]
			([BorrowerFirstName],[BorrowerLastName],[BorrowerPhoneNum])
VALUES		
			('John', 'Doe','208-222-3344'),
			('Jane', 'Doe','208-111-4400'),
			('Sam', 'Saam','208-222-3000'),
			('Olivia', 'Smith','208-204-3344'),
			('Isla', 'Harry','208-841-3204'),
			('Sophia', 'Smith','208-321-3012'),
			('Ella', 'J','208-280-3121'),
			('Leo', 'Chain','208-082-3014'),
			('George', 'W','208-451-7891'),
			('Emily', 'Johnson','208-361-5461'),
			('Charlie', 'Jefferson','208-567-6651'),
			('Harry', 'Duet','208-145-0123'),
			('Jack', 'Savash','208-042-4566'),
			('Jacob', 'Lanin','208-210-0314'),
			('Noah', 'Noman','208-879-3091'),
			('Normand', 'Charbenue','208-012-5460'),
			('Ruby', 'Will','208-014-3314'),
			('Sophia', 'Harnandiz','208-222-3640'),
			('Mia', 'Makil','208-267-3344'),
			('Megan', 'G','208-978-3642'),
			('Katie', 'Perry','208-201-0345'),
			('Lucy', 'Mark','208-210-8700');

DELETE [dbo].[Borrower]
WHERE [BorrowerID] = 15;

INSERT INTO [dbo].[Borrower_Disk]
			([DiskID],[BorrowerID],[BorrowDate],[BorrowReturnDate])
VALUES
			(3,1,'11/02/2019','12/05/2019'),
			(1,1,'12/02/2019','12/05/2019'),
			(1,1,'12/03/2019','12/05/2019'),
			(6,1,'12/02/2019','12/05/2019'),
			(6,1,'12/01/2019','12/05/2019'),
			(8,1,'11/02/2019','12/07/2019'),
			(10,1,'12/02/2019','12/05/2019'),
			(10,1,'12/01/2019','12/05/2019'),
			(10,1,'12/03/2019',null),
			(8,1,'12/02/2019',null),
			(8,1,'12/03/2019','12/04/2019'),
			(3,1,'12/03/2019','12/05/2019'),
			(3,1,'10/02/2019','12/05/2019'),
			(3,1,'09/02/2019',null),
			(3,1,'11/06/2019','12/05/2019'),
			(1,1,'11/02/2019','12/05/2019'),
			(1,1,'10/02/2019','12/05/2019'),
			(1,1,'09/02/2019','12/05/2019'),
			(1,1,'08/02/2019','12/05/2019'),
			(1,1,'07/02/2019','12/05/2019'),
			(1,1,'06/02/2019','12/05/2019'),
			(1,1,'05/02/2019','12/05/2019');

SELECT	[BorrowerID], [DiskID], [BorrowDate], [BorrowReturnDate]
FROM	[dbo].[Borrower_Disk]
WHERE	[BorrowReturnDate]is NULL;
