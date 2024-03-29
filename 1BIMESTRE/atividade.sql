create database e_commerce;
use e_commerce;

create table cliente (
    id_cliente int not null auto_increment,
    nome varchar(30),
    endereco varchar(45),
    email varchar(50),
    cell tinyint(12),
    nascimento date,
    primary key (id_cliente)
);

create table produtos (
    id_produto int not null auto_increment,
    nome_produto varchar(30),
    preco decimal(6,2),
    estoque int,
    descriçao text(20000),
    primary key (id_produto)
);

create table pedido (
    id_pedido int not null auto_increment,
    id_cliente int not null,
    data_compra date,
    total_valor decimal(6,2),
    data_estimada date,
    primary key (id_pedido),
    foreign key (id_cliente) references cliente(id_cliente)
);

create table items (
    id_itens int not null auto_increment,
    id_pedido int not null,
    id_produto int not null,
    qtd int,
    valor_unitario decimal(6,2),
    valor_totall decimal(6,2),
    primary key (id_itens),
    foreign key (id_pedido) references pedido(id_pedido),
    foreign key (id_produto) references produtos(id_produto)
);
