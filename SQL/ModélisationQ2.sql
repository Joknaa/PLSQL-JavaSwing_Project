
create index catalogue_categories_Code_fk on catalogue (Category);
create index catalogue_families_Code_fk on catalogue (Family);
create index clientlist_regions_RegionCode_fk on clientlist (Region);
create index Command_categories_Code_fk on command (ProductRef);
create index Command_clientlist_ClientCode_fk on command (ClientID);