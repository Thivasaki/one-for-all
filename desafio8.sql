	  
SELECT 
    ar.nome_artista AS artista,
    al.nome_album AS album
FROM
    SpotifyClone.artista AS ar
        INNER JOIN
    SpotifyClone.album AS al ON ar.id_artista = al.id_artista
WHERE
    ar.nome_artista = 'Elis Regina'
ORDER BY album;
