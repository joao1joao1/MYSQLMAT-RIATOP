use e_commerce;

INSERT  INTO cliente ( nome, endereco, email, cell, nascimento )
 VALUES ( 'joao', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'joao', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'nataly', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'carina', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'Miriam', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'joao roberto', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'pedro', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'joao souza', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'diolinda', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' ),
( 'ruan', 'Rua Pão de Alho, 76, Vila das rosas', 'obhgela67@jimail.cim', 119898989823, '1689-11-23' );

INSERT INTO produtos ( nome_produto, preco, estoque, descriçao ) 
VALUES
( 'Pc gamer1', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Pc gamer2', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Pc gamer3', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Pc gamer4', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Pc gamer5', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Pc gamer6', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Pc gamer7', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Pc gamer8', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Pc gamer9', 567.99, 1456, 'Disponível com processador Intel Core 5 ou 7.' ),
( 'Bicicleta Aro 27', 567.99, 1456, 'Disponível em cores azul, rosa, e marrom.' );

INSERT INTO pedido ( data_compra, total_valor, data_estimada ) 
VALUES
( '2024-03-28', 595.86, '2024-04-01' ),
( '2024-03-28', 595.86, '2024-04-02' ),
( '2024-03-28', 595.86, '2024-04-03' ),
( '2024-03-28', 595.86, '2024-04-04' ),
( '2024-03-28', 595.86, '2024-04-05' ),
( '2024-03-28', 595.86, '2024-04-06' ),
( '2024-03-28', 595.86, '2024-04-07' ),
( '2024-03-28', 595.86, '2024-04-08' ),
( '2024-03-28', 595.86, '2024-04-09' ),
( '2024-03-28', 595.86, '2024-04-10' );

INSERT INTO items ( qtd, valor_unitario, valor_totall ) 
VALUES
( 1, 595.86, 598.00 ),
( 1, 595.86, 598.89 ),
( 1, 595.86, 598.69 ),
( 1, 595.86, 598.56 ),
( 1, 595.86, 598.39 ),
( 1, 595.86, 598.99 ),
( 1, 595.86, 598.45 ),
( 1, 595.86, 598.67 ),
( 1, 595.86, 598.11 ),
( 1, 595.86, 598.13 );

UPDATE cliente
SET nome = 'Marcio Marçal'
Where id_cliente = 1;

UPDATE cliente
SET nome = 'Alessandra'
Where id_cliente = 8;

UPDATE cliente
SET nome = 'Julia'
Where id_cliente = 2;

UPDATE cliente
SET nome = 'Mayk'
Where id_cliente = 4;

UPDATE produtos
SET nome_produto = 'CPU INTEL CORE 8'
Where id_produto = 1;

UPDATE produtos
SET nome_produto = 'CPU INTEL CORE 9'
Where id_produto = 2;

UPDATE produtos
SET nome_produto = 'Bola de Basquete WILSON/COURO'
Where id_produto = 5;

UPDATE produtos
SET nome_produto = 'XBOX 360'
Where id_produto = 8;

UPDATE pedido
SET total_valor = 570.00
WHERE data_estimada = '2024-04-01';

UPDATE pedido
SET total_valor = 560.20
WHERE data_estimada = '2024-04-04';

UPDATE pedido
SET total_valor = 571.00
WHERE data_estimada = '2024-04-09';

UPDATE pedido
SET total_valor = 570.05
WHERE data_estimada = '2024-04-08';

UPDATE items
SET valor_totall = 598.85
WHERE id_itens = 2;

UPDATE items
SET valor_totall = 598.70
WHERE id_itens = 5;

UPDATE items
SET valor_totall = 597.85
WHERE id_itens = 8;

UPDATE items
SET valor_totall = 598.10
WHERE id_itens = 6;

DELETE FROM cliente
WHERE nome = 'nataly';

DELETE FROM cliente
WHERE nome = 'joao souza';

DELETE FROM produtos
WHERE id_produto = 7;

DELETE FROM produtos
WHERE id_produto = 3;

DELETE FROM pedido
WHERE data_estimada = '2024-04-02';

DELETE FROM pedido
WHERE data_estimada = '2024-04-09';

DELETE FROM items
WHERE valor_totall = 598.00;

DELETE FROM items
WHERE valor_totall = 598.89;