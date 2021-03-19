create procedure remise(
    p_ID in number ,
    p_date in  date,
    p_client in number,
    p_prodref in varchar ,
    p_qte in number,
    p_remise in number
)
is 
    p_pu number;
    p_tva number;
    prixtotal number ;

begin 
select catalogue.pu into p_pu from catalogue where catalogue.ref=p_prodref;
select catalogue.TVA into p_tva from catalogue where catalogue.ref=p_prodref;
prixtotal:=((p_pu*p_qte*(100+p_tva))/100) *(1-p_remise/100);
insert into COMMAND(commandid,commanddate,clientid,productref,qte,totalttc)
VALUES (p_id,p_date,p_client,p_prodref,p_qte,prixtotal);

end remise;
/

