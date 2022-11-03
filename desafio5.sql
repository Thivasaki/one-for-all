SELECT 
    c.nome_cancao AS cancao,
    COUNT(h.id_cancao) AS reproducoes
FROM
    SpotifyClone.cancoes AS c
        INNER JOIN
    SpotifyClone.historico AS h ON h.id_cancao = c.id_cancao
GROUP BY c.nome_cancao
ORDER BY reproducoes DESC LIMIT 2;