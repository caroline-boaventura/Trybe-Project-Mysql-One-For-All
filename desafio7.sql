CREATE VIEW perfil_artistas AS
SELECT
t1.NOME AS artista,
t.NOME AS album,
(SELECT COUNT(*)
FROM SpotifyClone.usuario_seguindo_artista t2
INNER JOIN SpotifyClone.artistas t3 ON t2.ARTISTA_ID = t3.ARTISTA_ID
GROUP BY t3.NOME
having t3.NOME = t1.NOME) AS seguidores
FROM SpotifyClone.albuns t
INNER JOIN SpotifyClone.artistas t1 ON t.ARTISTA_ID = t1.ARTISTA_ID
ORDER BY seguidores DESC, artista, album;
