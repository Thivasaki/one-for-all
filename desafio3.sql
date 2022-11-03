SELECT 
    u.nome_usuario AS usuario,
    COUNT(h.id_cancao) AS qt_de_musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos
FROM
    SpotifyClone.usuario AS u
        INNER JOIN
    SpotifyClone.historico AS h ON h.id_usuario = u.id_usuario
        INNER JOIN
    SpotifyClone.cancoes AS c ON c.id_cancao = h.id_cancao
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario;

