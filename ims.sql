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

