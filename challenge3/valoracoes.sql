use ecommerce;

show tables;

insert into clients(fname, mint, lname, cpf, address)
	values('Maria', 'M', 'Silva', 123456789, 'Rua Silva de prata 29, Carangola - Cidade das Flores'),
    ('Matheus', 'O', 'Pimentel', 239384712, 'Rua Alameda 296, Centro - Cidade das Flores'),
	('Ricardo', 'F', 'Silva', 283811561, 'Avenida dos Pinhais 5006, Centro - Cidade das Flores'),
    ('Julia', 'S', 'França', 020938165, 'Rua Laranjeiras de prata 861, Centro - Cidade das Flores'),
    ('Isabela', 'M', 'Cruz', 323416789, 'Rua das Flores 108, Carangola - Cidade das Flores');
    
insert into product(pname, classification_kids, category, evaluation, size) values
	('Fone de ouvido',false,'Eletrônicos',4,null),
    ('Barbie',true,'Brinquedos',3,null),
    ('Body Carters',false,'Vestimentas',5,null),
    ('Microfone Vedo',false,'Eletrônicos',4,null),
    ('Sofá',false,'Móveis',3,'3x57x80');
    
-- select * from clients;
-- select * from product;
    
insert into orders(idorderclient, orderstatus, orderdescription, sendvalue, paymentCash) values
	(1,default,'compra via aplicativo',null,1),
    (2,default,'compra via aplicativo',50,0),
    (3,default,'Confirmado',null,null),
    (4,default,'compra via web site',150,0);

-- select * from orders;

insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) values
	(1, 5, 2, null),
    (2, 1, 1, null),
    (3, 2, 1, null);
    
-- select * from productOrder;


insert into productStorage(storageLocation,quantity) values
	('Rio de Janeiro', 100),
	('Fortaleza', 5000),
    ('São Paulo', 10),
    ('Brasília', 30);
    
-- select * from productStorage;

insert into storageLocation(idLproduct, idLstorage, location) values
	(1, 2, 'RJ'),
    (2, 6, 'GO');
    
-- select * from storageLocation;

insert into supplier(socialname, cnpj, contact) values
	('Almeida e filhos', 123456789123456, '21985474'),
	('Eletrônicos Silva', 226456789123456, '21965474'),
    ('Eletrônicos Targino', 896456789123456, '21965474');
    
-- select * from supplier;

insert into productSupplier(idPsSupplier, idPsProduct, quantity) values
	(1, 1, 500),
	(1, 2, 400),
    (2, 4, 555),
    (2, 5, 10),
	(3, 3, 20);
    
-- select * from productSupplier;
    
insert into seller(socialname, abstname, cnpj, cpf, location, contact) values
	('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 21994687),
    ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 21994685),
    ('Kids World', null, 456789123654485, null, 'São Paulo', 11994685);
    
-- select * from seller;

insert into ProductSeller(idPseller, idPproduct, prodQuantity) values
	(1,6,80),
    (2,7,10);
    
select * from clientc s, orders o where c.idClient = idOrderClient;

select * from clientc s, orders o where c.idClient = idOrderClient order by c.idclient DESC;