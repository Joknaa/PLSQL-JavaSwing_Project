
-- clientlist
create table clientlist(
	ClientCode int not null,
	Name varchar(32) null,
	Address varchar(255) null,
	Region int null,
	ContractDate date not null,
	Email varchar(64) not null,
	Observations varchar(255) not null,
    primary key( ClientCode),
	constraint ClientList_ClientCode_uindex unique (ClientCode)
);

-- catalogue
create table catalogue(
	Ref varchar(8) not null ,
	Label varchar(64) not null,
	Category int not null,
	Family int not null,
	UnitePrice int not null,
    
	TVA varchar(32) not null,
	primary key(ref)
);
-- regions
create table regions(
	RegionCode int not null ,
     
	Label varchar(64) null,
	primary key(RegionCode)
);

-- families
create table families(
	Code int not null ,
   
	Label varchar(32) not null,
	 primary key(Code)
);

-- categories
create table categories(
	Code int not null ,
   
	Label varchar(32) not null,
	 primary key(Code)
);

-- Command
create table command (
	CommandID int not null ,
	CommandDate date not null,
	ClientID int not null,
	ProductRef varchar(32) not null,
	Qte int not null,
        Paid int default 0 not null,
 	primary key(CommandID)
);
