-- criação do BD
CREATE DATABASE ecommerce;
USE ecommerce;

-- drop database ecommerce;

-- criação tabela cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    fName VARCHAR(20),
    mInt char(3),
    lName VARCHAR(20),
    cpf CHAR(11) NOT NULL,
    address VARCHAR(210),
    CONSTRAINT unique_cpf_client UNIQUE(cpf)
);

ALTER TABLE clients AUTO_INCREMENT=1;

-- criação tabela produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(20),
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônicos', 'Alimentos', 'Brinquedos', 'Vestimentas','Móveis','Livros') NOT NULL,
    evaluation FLOAT DEFAULT 0,
    size VARCHAR(10)
);

ALTER TABLE product AUTO_INCREMENT=1;


-- criação tabela pagamento
CREATE TABLE payment(
	idPayment INT,
    idClient INT,
    typePayment ENUM('Dinheiro', 'Cartão', 'Dois cartões'),
    limitAvailable FLOAT,
    PRIMARY KEY(idClient, idPayment)
);

-- criação tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado','Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 0,
    paymentCash bool DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);


ALTER TABLE orders AUTO_INCREMENT=1;

-- criação tabela estoque
CREATE TABLE productStorage(
	idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    sLocation VARCHAR(50),
    quantity INT DEFAULT 0
);

-- criação tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(50) NOT NULL,
    cnpj CHAR(15) NOT NULL,
    contact CHAR(11) DEFAULT 0,
    CONSTRAINT unique_supplier UNIQUE(cnpj)
);

ALTER TABLE supplier AUTO_INCREMENT=1;

-- criação tabela vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(50) NOT NULL,
    abstName VARCHAR(50),
    cnpj CHAR(15),
    cpf CHAR(9),
    contact CHAR(11) DEFAULT 0,
    location VARCHAR(50),
    CONSTRAINT unique_cnpj_seller UNIQUE(cnpj),
    CONSTRAINT unique_cpf_seller UNIQUE(cpf)
);

ALTER TABLE seller AUTO_INCREMENT=1;

CREATE TABLE productSeller(
	idPseller INT,
    idProduct INT,
	prodQuantity INT DEFAULT 1,
    PRIMARY KEY(idPseller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

CREATE TABLE productOrder(
	idPOproduct INT,
    idPOorder INT,
	poQuantity INT DEFAULT 1,
    poStatus enum('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY(idPOproduct, idPOorder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES seller(idSeller),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

CREATE TABLE storageLocation(
	idLproduct INT,
    idLstorage INT,
	location VARCHAR(50) NOT NULL,
    poStatus enum('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY(idLproduct, idLstorage),
    CONSTRAINT fk_product_storage FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_prod FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

CREATE TABLE productSupplier(
	idPsSupplier INT,
    idPsProduct INT,
	quantity INT NOT NULL,
    PRIMARY KEY(idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);

