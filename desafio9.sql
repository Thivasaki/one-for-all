SELECT 
    COUNT(h.id_cancao) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.historico AS h
        INNER JOIN
    SpotifyClone.usuario AS u ON h.id_usuario = u.id_usuario
WHERE
    u.nome_usuario = 'Barbara Liskov';