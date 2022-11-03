SELECT 
    FORMAT(MIN(preco), 2) AS faturamento_minimo,
    FORMAT(MAX(preco), 2) AS faturamento_maximo,
    FORMAT(AVG(preco), 2) AS faturamento_medio,
    FORMAT(SUM(preco), 2) AS faturamento_total
FROM
    SpotifyClone.planos AS p
        INNER JOIN
    SpotifyClone.usuario AS u ON p.id_plano = u.id_plano;