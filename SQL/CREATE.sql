-- clientlist
create table plsql_project.clientlist(
	ClientCode int auto_increment primary key ,
	Name varchar(32) null,
	Address varchar(255) null,
	Region int null,
	ContractDate date not null,
	Email varchar(64) not null,
	Observations text not null,
	constraint ClientList_ClientCode_uindex unique (ClientCode)
);
create index clientlist_regions_RegionCode_fk on plsql_project.clientlist (Region);

-- catalogue
create table plsql_project.catalogue(
	Ref varchar(8) not null primary key,
	Label varchar(64) not null,
	Category int not null,
	Family int not null,
	UnitePrice int not null,
	TVA int not null
);
create index catalogue_categories_Code_fk on plsql_project.catalogue (Category);
create index catalogue_families_Code_fk on plsql_project.catalogue (Family);

-- regions
create table plsql_project.regions(
	RegionCode int auto_increment primary key,
	Label varchar(64) null
);

-- families
create table plsql_project.families(
	Code int not null primary key,
	Label varchar(32) not null
);

-- categories
create table plsql_project.categories(
	Code int auto_increment primary key,
	Label varchar(32) not null
);

-- Command
create table plsql_project.command (
	CommandID int not null primary key,
	CommandDate date not null,
	ClientID int not null,
	ProductRef int not null,
	Qte int null,
    Paid tinyint default 0 not null
);

create index Command_categories_Code_fk on plsql_project.command (ProductRef);
create index Command_clientlist_ClientCode_fk on plsql_project.command (ClientID);

