CREATE VIEW top_3_artistas AS
SELECT t1.NOME AS artista, COUNT(*) AS seguidores
FROM SpotifyClone.usuario_seguindo_artista t
INNER JOIN SpotifyClone.artistas t1 ON t.ARTISTA_ID = t1.ARTISTA_ID
GROUP BY t1.NOME
ORDER BY COUNT(*) DESC, artista
LIMIT 3;
