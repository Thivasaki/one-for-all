SELECT 
    COUNT(DISTINCT c.nome_cancao) AS cancoes,
    COUNT(DISTINCT ar.nome_artista) AS artistas,
    COUNT(DISTINCT al.nome_album) AS albuns
FROM
    SpotifyClone.cancoes AS c
        INNER JOIN
    SpotifyClone.artista AS ar
        INNER JOIN
    SpotifyClone.album AS al;