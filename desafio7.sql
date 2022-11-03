SELECT 
    ar.nome_artista AS artista,
    al.nome_album AS album,
    COUNT(s.id_usuario) AS seguidores
FROM
    SpotifyClone.artista AS ar
        INNER JOIN
    SpotifyClone.album AS al ON ar.id_artista = al.id_artista
        INNER JOIN
    SpotifyClone.seguindo_artista_usuario AS s ON ar.id_artista = s.id_artista
GROUP BY ar.nome_artista , al.nome_album
ORDER BY seguidores DESC , artista , album;