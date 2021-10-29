DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(100))
BEGIN
SELECT t2.NOME AS artista, t1.NOME AS album
FROM SpotifyClone.albuns t1
INNER JOIN SpotifyClone.artistas t2 ON t1.ARTISTA_ID = t2.ARTISTA_ID
WHERE t2.NOME = nome_artista;
END $$

DELIMITER ;
