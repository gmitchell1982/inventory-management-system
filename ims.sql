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

create table InventoryManagementSystem.dbo.Inbound(
  InboundID int identity(1,1) primary key not null,
  ReceiptID int foreign key references dbo.ReceiptTracking(ReceiptID) not null,
  ItemPurchaseCost smallmoney not null,
  ItemCategory int foreign key references dbo.ItemCategory(ItemCategoryID) not null,
  ISBN varchar(20),
  Title varchar(max),
  Subtitle varchar(max),
  Authors varchar(max),
  Editors varchar(max),
  Publisher varchar(100),
  CoverType int not null,
  YearID int not null,
  Edition varchar(max),
  Volume varchar(50),
  Issue varchar(25),
  Sleeve varchar(max),
  Type varchar(max),
  ContentCategory varchar(50),
  Description varchar(max) not null,
  ConditionNotes varchar(max) not null,
  SpecialNotes varchar(max),
  MakerBrand int foreign key references dbo.MakerBrand(MakerBrandID),
  ModelNumber varchar(100),
  SerialNumber varchar(100),
  PackageCase varchar(max),
  Accessories varchar(max),
  Material int foreign key references dbo.MaterialType(MaterialTypeID),
  Size varchar(100),
  InboundTime int not null,
  NaiveEvaluation smallmoney not null,
  NTPEvaluation bit not null,
  TestEvaluation bit not null,
  WhoInbound int foreign key references dbo.Users(UserID) not null,
  InboundDate date not null
);

------------------------------------

create table InventoryManagementSystem.dbo.NTP(
  NTPID int identity(1,1) primary key not null,
  InboundID int foreign key references dbo.Inbound(InboundID) not null,
    ItemCategory int foreign key references dbo.ItemCategory(ItemCategoryID) not null,
  ISBN varchar(20),
  Title varchar(max),
  Subtitle varchar(max),
  Authors varchar(max),
  Editors varchar(max),
  Publisher varchar(100),
  CoverType int not null,
  YearID int not null,
  Edition varchar(max),
  Volume varchar(50),
  Issue varchar(25),
  Sleeve varchar(max),
  Type varchar(max),
  ContentCategory varchar(50),
  Description varchar(max) not null,
  ConditionNotes varchar(max) not null,
  SpecialNotes varchar(max),
  MakerBrand int foreign key references dbo.MakerBrand(MakerBrandID),
  ModelNumber varchar(100),
  SerialNumber varchar(100),
  PackageCase varchar(max),
  Accessories varchar(max),
  Material int foreign key references dbo.MaterialType(MaterialTypeID),
  Size varchar(100),
  InboundTime int not null,
  NaiveEvaluation smallmoney not null,
  NTPEvaluation bit not null,
  TestEvaluation bit not null,
  NTPTime int not null,
  WhoNTP int foreign key references dbo.Users(UserID) not null,
  NTPDate date not null
);

------------------------------------

create table InventoryManagementSystem.dbo.ConflictResolver(
  ConflictResolverID int identity(1,1) primary key not null,
  Result varchar(15) not null unique
);

------------------------------------

create table InventoryManagementSystem.dbo.Suggestion(
  SuggestionID int identity(1,1) primary key not null,
  Result varchar(15) not null unique
);

------------------------------------

create table InventoryManagementSystem.dbo.Conclusion(
  ConclusionID int identity(1,1) primary key not null,
  Result varchar(15) not null
);

------------------------------------

create table InventoryManagementSystem.dbo.CameFrom(
  CameFromID int identity(1,1) primary key not null,
  SourceTable varchar(25) not null unique,
  Testing bit not null,
  Valuation bit not null,
  Preparation bit not null,
  Loss bit not null
);

------------------------------------

create table InventoryManagementSystem.dbo.Testing(
  TestingID int identity(1,1) primary key not null,
  CameFrom int foreign key references dbo.CameFrom(CameFromID) not null,
  CameFromID int not null,
  PhysicalCondition varchar(max),
  MechanicalCondition varchar(max),
  ElectricalCondition varchar(max),
  NeedFixingEvaluation bit not null,
  NaiveDiagnosis varchar(max),
  ValueWorking smallmoney not null,
  ValueBroken smallmoney not null,
  ValueParted smallmoney not null,
  ExpectedFixCost smallmoney not null,
  ExpectedFixTime int not null,
  ExpectedPartTime int not null,
  HourlyRate smallmoney not null,
  WorthFixing bit not null,
  WorthParting bit not null,
  ConflictResolver int foreign key references dbo.ConflictResolver(ConflictResolverID) not null,
  Suggestion int foreign key references dbo.Suggestion(SuggestionID) not null,
  WorthSuggestion bit not null,
  Conclusion int foreign key references dbo.Conclusion(ConclusionID) not null,
  TestingTime int not null,
  WhoTested int foreign key references dbo.Users(UserID) not null,
  TestingDate date not null
);

------------------------------------

create table InventoryManagementSystem.dbo.Fixing(
  FixingID int identity(1,1) primary key not null,
  TestingID int foreign key references dbo.Testing(TestingID) not null,
  WhatFixed varchar(max) not null,
  FixCost smallmoney not null,
  FixTime int not null,
  WhoFixed int foreign key references dbo.Users(UserID) not null,
  FixDate date not null
);

------------------------------------

create table InventoryManagementSystem.dbo.TechnicalParting(
  TechnicalPartingID int identity(1,1) primary key not null,
  TestingID int foreign key references dbo.Testing(TestingID) not null,
  ItemCategory int foreign key references dbo.ItemCategory(ItemCategoryID) not null,
  YearID int,
  Type varchar(max),
  Description varchar(max) not null,
  ConditionNotes varchar(max) not null,
  SpecialNotes varchar(max),
  MakerBrand int foreign key references dbo.MakerBrand(MakerBrandID) not null,
  ModelNumber varchar(100),
  SerialNumber varchar(100),
  PackageCase varchar(max),
  Accessories varchar(max),
  Material int foreign key references dbo.MaterialType(MaterialTypeID),
  NaiveEvaluation smallmoney not null,
  TPTime int not null,
  WhoParted int foreign key references dbo.Users(UserID) not null,
  TPDate date not null
);

------------------------------------

create table InventoryManagementSystem.dbo.Valuation(
  ValuationID int identity(1,1) primary key not null,
  CameFrom int foreign key references dbo.CameFrom(CameFromID) not null,
  CameFromID int not null,
  BestListPlatform int foreign key references dbo.ListingPlatform(PlatformID) not null,
  ExpectedValue smallmoney not null,
  ExpectedListCost smallmoney not null,
  ShippingLimits varchar(max) not null,
  BundleEval bit not null,
  BundleID int foreign key references dbo.BundleDefinition(BundleID) not null,
  ValuationTime int not null,
  WhoValuated int foreign key references dbo.Users(UserID) not null,
  ValuationDate date not null
);

------------------------------------

create table InventoryManagementSystem.dbo.Preparation(
  PreparationID int identity(1,1) primary key not null,
  CameFrom int foreign key references dbo.CameFrom(CameFromID) not null,
  CameFromID int not null,
  CleanComplete bit not null,
  CleanCost smallmoney not null,
  CleanTime int not null,
  WhoCleaned int foreign key references dbo.Users(UserID) not null,
  MediaTaken bit not null,
  MediaOnSystem bit not null,
  MediaPrepped bit not null,
  MediaTime int not null,
  WhoMedia int foreign key references dbo.Users(UserID) not null,
  DateFinished date not null
);

------------------------------------

create table InventoryManagementSystem.dbo.Listing(
  ListingID int identity(1,1) primary key not null,
  PreparationID int foreign key references dbo.Preparation(PreparationID) not null,
  ListingPlatform int foreign key references dbo.ListingPlatform(PlatformID) not null,
  ListStatus int not null,
  AskingPrice smallmoney not null,
  HopingPrice smallmoney not null,
  MinAccept smallmoney not null,
  MediaRelocated bit not null,
  SMPosts bit not null,
  ListTime int not null,
  WhoListed int foreign key references dbo.Users(UserID) not null,
  FirstListDate date not null,
  LastListDate date not null,
  CumulativeListCosts smallmoney not null,
  ListCostNotes varchar(max)
);

------------------------------------

create table InventoryManagementSystem.dbo.Sales(
  SalesID int identity(1,1) primary key not null,
  InvoiceID varchar(max) not null,
  ListingID int foreign key references dbo.Listing(ListingID) not null,
  OfferAccepted bit not null,
  AcceptanceDateTime datetime2 not null,
  WhoAccepted int foreign key references dbo.Users(UserID) not null,
  OfferValue smallmoney not null,
  InvoiceSent bit not null,
  PaymentReceived bit not null,
  PaymentDateTime datetime2 not null,
  ItemSaleValue smallmoney not null,
  ShippingCost smallmoney not null,
  BusSalesTax smallmoney not null,
  PlatformSalesTax smallmoney not null,
  PaymentMethod int not null,
  PaymentVerified bit not null,
  VerificationDateTime datetime2 not null,
  VerificationMessageSent bit not null,
  MediaRelocated bit not null,
  ShippingNeeded bit not null,
  CombinedShipping bit not null,
  WhoVerified int foreign key references dbo.Users(UserID)
);

------------------------------------

create table InventoryManagementSystem.dbo.Shipping(
  ShippingID int identity(1,1) primary key not null,
  SalesID int foreign key references dbo.Sales(SalesID) not null,
  CustomerSelected int foreign key references dbo.ShippingPlatform(ShippingPlatformID) not null,
  BestOption int foreign key references dbo.ShippingPlatform(ShippingPlatformID) not null,
  LabelPurchased bit not null,
  LabelCost smallmoney not null,
  LabelPrinted bit not null,
  PackingSlipPrinted bit not null,
  TrackingProvided bit not null,
  TrackingNumber varchar(max),
  TrackingSent bit not null,
  ShipDateTime datetime2 not null,
  ShipTime int not null,
  WhoShipped int foreign key references dbo.Users(UserID) not null,
  TakenToShipper bit not null,
  PickedUp bit not null,
  TakenToCustomer bit not null,
  DeliveryDateTime datetime2 not null,
  DeliveryTime int not null,
  WhoDelivered int foreign key references dbo.Users(UserID) not null
);

------------------------------------

create table InventoryManagementSystem.dbo.Returns(
  ReturnsID int identity(1,1) primary key not null,
  ShippingID int foreign key references dbo.Shipping(ShippingID) not null,
  CheckedAgainstEvidence bit not null,
  WhoChecked int foreign key references dbo.Users(UserID) not null,
  LegalNeeded bit not null,
  LegalTaken bit not null,
  LegalResolved bit not null,
  ResolutionNotes varchar(max),
  WhoLegal int foreign key references dbo.Users(UserID) not null,
  ReturnedToInbound bit not null,
  NewInboundID int foreign key references dbo.Inbound(InboundID) not null,
  RefundNeeded bit not null,
  RefundTotal smallmoney not null,
  RefundReceiptSent bit not null,
  OtherRefundCosts smallmoney not null,
  RefundNotes varchar(max),
  WhoRefunded int foreign key references dbo.Users(UserID) not null,
  ReturnDate datetime2 not null,
  ReturnCompleteDate datetime2 not null,
  CumulativeReturnTime int not null
);

------------------------------------

create table InventoryManagementSystem.dbo.Loss(
  LossID int identity(1,1) primary key not null,
  CameFrom int foreign key references dbo.CameFrom(CameFromID) not null,
  CameFromID int not null,
  LossTypeID int foreign key references dbo.LossType(LossTypeID) not null,
  LossDate date not null,
  LossRecord varchar(max) not null,
  LossDetails varchar(max) not null,
  WhoRecordedLoss int foreign key references dbo.Users(UserID) not null,
  PoliceReportNeeded bit not null,
  PoliceReportDate date not null,
  PoliceReportNumber varchar(max) not null,
  PoliceComplete bit not null,
  WhoPolice int foreign key references dbo.Users(UserID) not null,
  InsuranceReportNeeded bit not null,
  InsuranceReportDate date not null,
  InsuranceReportNumber varchar(max) not null,
  InsuranceComplete bit not null,
  WhoInsurance int foreign key references dbo.Users(UserID) not null,
  AccountingReportSent bit not null,
  WhoAccounting int foreign key references dbo.Users(UserID) not null
);

------------------------------------

