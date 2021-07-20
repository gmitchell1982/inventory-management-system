create database InventoryManagementSystem;

-----------------------------------

create table InventoryManagementSystem.dbo.Users(
  UserID int identity(1,1) primary key not null,
  FirstName varchar(15) not null,
  MiddleName varchar(15),
  Surname varchar(25) not null,
  Status bit not null,
  Purchaser bit not null
);

-----------------------------------

create table InventoryManagementSystem.dbo.VendorType(
  VendorTypeID int identity(1,1) primary key not null,
  Description varchar(max) not null
);

-----------------------------------

create table InventoryManagementSystem.dbo.StatusReference(
  StatusRefID int identity(1,1) primary key not null,
  StatusName varchar(10)
);

-----------------------------------

create table InventoryManagementSystem.dbo.Vendor(
  VendorID int identity(1,1) primary key not null,
  Name varchar(30) not null unique,
  VendorType int foreign key references dbo.VendorType(VendorTypeID) not null,
  Location varchar(max) not null,
  Status int foreign key references dbo.StatusReference(StatusRefID) not null,
  WhoAdded int foreign key references dbo.Users(UserID) not null
);

------------------------------------

create table InventoryManagementSystem.dbo.ListingPlatform(
  PlatformID int identity(1,1) primary key not null,
  Name varchar(25) not null unique,
  Status int foreign key references dbo.StatusReference(StatusRefID) not null,
  WhoAdded int foreign key references dbo.Users(UserID) not null
);

------------------------------------

create table InventoryManagementSystem.dbo.ShippingPlatform(
  ShippingPlatformID int identity(1,1) primary key not null,
  Name varchar(25) not null unique,
  Status int foreign key references dbo.StatusReference(StatusRefID) not null,
  WhoAdded int foreign key references dbo.Users(UserID) not null
);

------------------------------------

create table InventoryManagementSystem.dbo.ItemCategory(
  ItemCategoryID int identity(1,1) primary key not null,
  Name varchar(25) not null unique,
  Description varchar(max) not null,
  InboundVector varchar(50) not null,
  WhoAdded int foreign key references dbo.Users(UserID) not null
);

------------------------------------

create table InventoryManagementSystem.dbo.BundleDefinition(
  BundleID int identity(1,1) primary key not null,
  BundleCategory int foreign key references dbo.ItemCategory(ItemCategoryID) not null,
  Description varchar(max) not null,
  ReadyToPrep bit not null
);

------------------------------------

create table InventoryManagementSystem.dbo.LossType(
  LossTypeID int identity(1,1) primary key not null,
  Name varchar(25) not null unique,
  Description varchar(max) not null,
  WhoAdded int foreign key references dbo.Users(UserID) not null
);

------------------------------------

create table InventoryManagementSystem.dbo.ReceiptTracking(
 ReceiptID int identity(1,1) primary key not null,
 AccountingRef varchar(50) unique not null,
 InventoryItems int not null,
 SalesTaxTotal smallmoney not null,
 DonationsTotal smallmoney not null,
 EquipmentTotal money not null,
 SuppliesTotal money not null,
 ReceiptTotal money not null,
 Vendor int foreign key references dbo.Vendor(VendorID) not null,
 Purchaser int foreign key references dbo.Users(UserID) not null,
 WhoAdded int foreign key references dbo.Users(UserID) not null,
 EntryDate date not null
);

-----------------------------------

create table InventoryManagementSystem.dbo.MakerBrand(
  MakerBrandID int identity(1,1) primary key not null,
  Name varchar(50) unique not null
);

------------------------------------

create table InventoryManagementSystem.dbo.MaterialType(
  MaterialTypeID int identity(1,1) primary key not null,
  Name varchar(25) not null unique,
  Description varchar(max) not null
);

------------------------------------

