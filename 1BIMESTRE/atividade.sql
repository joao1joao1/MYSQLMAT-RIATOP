create database e_commerce;
use e_commerce;

create table cliente (
	id_cliente int not null,
    nome varchar(30),
    endereco varchar(45),
    email varchar(50),
    cell tinyint(12),
    nascimento date,
    primary key (id_cliente)
);

create table produtos (
	id_produto int not null,
    
);