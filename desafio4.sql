SELECT 
    u.nome_usuario AS usuario,
    IF(MAX(YEAR(h.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.usuario AS u
        INNER JOIN
    SpotifyClone.historico AS h ON h.id_usuario = u.id_usuario
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario;