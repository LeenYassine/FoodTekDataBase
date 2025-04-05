
CREATE TABLE Users(
	UsersID INT IDENTITY PRIMARY KEY,
	FirstNameEN VARCHAR(50) NOT NULL,
	FirstNameAR NVARCHAR(50) NOT NULL,
    LastNameEN VARCHAR(50) NOT NULL,
    LastNameAR NVARCHAR(50) NOT NULL,
	Username NVARCHAR(50) UNIQUE NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    [Password] NVARCHAR(100) NOT NULL,
    [Image] NVARCHAR(max),
	[RoleEN] VARCHAR(50) NULL, 
	[RoleAR] NVARCHAR(50) NULL,
	JoinDate DATETIME NULL, 
	BirthDate DATE NULL,
	OrderCount INT DEFAULT 0 NULL,
	UsersRole NVARCHAR(50) CHECK (UsersRole IN ('Admin','Employee','Client','Driver')),
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1
	)

CREATE TABLE PhoneNumbers (
    PhoneNumberID INT PRIMARY KEY IDENTITY,
	UserID INT,
    PhoneNumber NVARCHAR(15) UNIQUE NOT NULL,
	CountryCode NVARCHAR(10) CHECK (CountryCode IN ('00962','+962')),
    CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1 ,
    FOREIGN KEY (UserID) REFERENCES Users(UsersID)
)
CREATE TABLE DeliveryLocations (
    LocationsID INT PRIMARY KEY IDENTITY,
    UserID INT,
    [NameEN] VARCHAR(50),
	[NameAR] NVARCHAR(50),
	ProvinceEN VARCHAR(50),
	ProvinceAR NVARCHAR(50),
    RegionEN VARCHAR(100),
    RegionAR NVARCHAR(100),
    AddressHintEN VARCHAR(100),
	AddressHintAR NVARCHAR(100),
    Map NVARCHAR(255), -- تأكدي من نور على الترجمة وخليها تفهمك شو هاي 
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1 ,
    FOREIGN KEY (UserID) REFERENCES Users(UsersID)
)

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    [NameEN] VARCHAR(100),
    [NameAR] NVARCHAR(100),
    [Image] NVARCHAR(max),
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1 
)

CREATE TABLE Items (
    ItemsID INT PRIMARY KEY IDENTITY,
    [NameEN] VARCHAR(50) NOT NULL,
    [NameAR] NVARCHAR(50) NOT NULL,
    [DescriptionEN] VARCHAR(255),
	[DescriptionAR] NVARCHAR(255),
    Price INT NOT NULL,
    CategoryID INT,
    Quantity INT NOT NULL,
    [Image] NVARCHAR(255),
    [StatusEN] VARCHAR(20),
	[StatusAR] NVARCHAR(20),
	CreationDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1 ,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
)

CREATE TABLE Notifications (
    NotificationsID INT PRIMARY KEY IDENTITY,
	UserID INT ,
	NotificationTypeID INT,
    TitleEN VARCHAR(100) NOT NULL,
    TitleAR NVARCHAR(100) NOT NULL,
    [ActionEN] VARCHAR(50),
	[ActionAR] NVARCHAR(50),
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1,
	FOREIGN KEY (UserID) REFERENCES Users(UsersID),
	FOREIGN KEY (NotificationTypeID) REFERENCES NotificationTypes(NotificationTypesID)
)

CREATE TABLE NotificationTypes (
    NotificationTypesID INT PRIMARY KEY IDENTITY,
	NotificationCode INT,
    TypeNameEN VARCHAR(100) NOT NULL,
    TypeNameAR NVARCHAR(100) NOT NULL,
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1
)

CREATE TABLE Orders (
    OrdersID INT PRIMARY KEY IDENTITY,
    ClientID INT ,
	StatusID INT,
    TotalPrice INT NOT NULL,
	Quantity INT NOT NULL,
    DriverID INT ,
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1,
    FOREIGN KEY (ClientID) REFERENCES Users(UsersID) ,
	FOREIGN KEY (DriverID) REFERENCES Users(UsersID) ,
	FOREIGN KEY (StatusID) REFERENCES [Status](StatusID)
)

CREATE TABLE Offers (
    OfferSID INT PRIMARY KEY IDENTITY,
    TitleEN VARCHAR(100) NOT NULL,
	TitleAR NVARCHAR(100) NOT NULL,
    [DescriptionEN] VARCHAR(255),
	[DescriptionAR] NVARCHAR(255),
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    DiscountPercent DECIMAL(10,2),
    ItemID INT,
    [Image] NVARCHAR(max),
	LimitPersons INT,
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1 ,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemsID)
)

CREATE TABLE Issues (
    IssuesID INT PRIMARY KEY IDENTITY,
    TitleEN VARCHAR(255) NOT NULL,
	TitleAR NVARCHAR(255) NOT NULL,
    [StatusEN] VARCHAR(50) ,
	[StatusAR] NVARCHAR(50) ,
    ClientID INT ,
	SuggestEN VARCHAR(20) check (SuggestEN IN ('Recived', 'Approved','Rejected')), 
	SuggestAR NVARCHAR(20) check (SuggestAR IN ('تم الاستلام', 'تم الموافقة','تم الرفض')),
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1 ,
	FOREIGN KEY (ClientID ) REFERENCES Users(UsersID)
)

CREATE TABLE Rates (
    RatesID INT PRIMARY KEY IDENTITY,
    ClientID INT , 
    OrderID INT,
    DriverID INT,
    ItemID INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewEN VARCHAR(300),
	ReviewAR NVARCHAR(300),
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1 ,
	FOREIGN KEY (ClientID) REFERENCES Users(UsersID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrdersID),
	FOREIGN KEY (DriverID) REFERENCES Users(UsersID),
	FOREIGN KEY (ItemID) REFERENCES Items(ItemsID) 
)

CREATE TABLE [Status] (
    StatusID INT PRIMARY KEY IDENTITY,
    StatusEN VARCHAR(50),
    StatusAR NVARCHAR(50),
	StatusCode INT,
	CreateDate DATETIME DEFAULT GETDATE(),
	UpdateDate DATETIME,
	CreatedBY NVARCHAR(50),
	UpdateBY NVARCHAR(50),
	IsActive BIT DEFAULT 1 
)

CREATE TABLE PaymentMethods (
    PaymentMethodID INT PRIMARY KEY IDENTITY,
    MethodEN VARCHAR(50) NOT NULL,
    MethodAR NVARCHAR(50) NOT NULL,
	PaymentMethodCode INT,
    DescriptionEN VARCHAR(255),
    DescriptionAR NVARCHAR(255),
    CreateDate DATETIME DEFAULT GETDATE(),
    UpdateDate DATETIME,
    CreatedBY NVARCHAR(50),
    UpdateBY NVARCHAR(50),
    IsActive BIT DEFAULT 1
)
