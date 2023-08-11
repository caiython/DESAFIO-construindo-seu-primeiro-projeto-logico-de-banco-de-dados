-- Quantos produtos estão disponíveis em estoque no momento?
SELECT SUM(e.quantidade) AS total_estoque
FROM Estoque e;

-- Qual o nome do produto mais caro?
SELECT nome
FROM Produto
ORDER BY preco DESC
LIMIT 1;

-- Quantos clientes fizeram pelo menos um pedido?
SELECT COUNT(DISTINCT id_cliente) AS total_clientes_com_pedidos
FROM Pedido;

-- Quais são os pedidos que foram finalizados nos últimos 7 dias?
SELECT *
FROM Pedido
WHERE status_do_pedido = 'Finalizado' AND data_hora_pedido >= NOW() - INTERVAL 7 DAY;

-- Quais clientes tem ao menos 1 pedido finalizado?
SELECT C.id, I.nome_completo, COUNT(*) as total_pedidos
FROM Cliente C
INNER JOIN Identificacao I ON C.id_identificacao = I.id
INNER JOIN Pedido P ON C.id = P.id_cliente AND P.status_do_pedido = 'Finalizado'
GROUP BY C.id
HAVING total_pedidos > 0
ORDER BY I.nome_completo;

-- Do com maior número de vendas para o menor, quais produtos foram vendidos mais de 5 vezes?
SELECT P.nome, COUNT(*) as total_vendas
FROM Produto P
INNER JOIN ProdutoPedido PP ON P.id = PP.id_produto
GROUP BY P.id
HAVING total_vendas > 5
ORDER BY total_vendas DESC;