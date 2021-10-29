DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuario_id_param INT)
RETURNS INT READS SQL DATA
BEGIN

DECLARE musicas_historico INT;
SELECT COUNT(*) FROM SpotifyClone.historico_de_reproducoes
GROUP BY USUARIO_ID
HAVING USUARIO_ID = usuario_id_param INTO musicas_historico;
RETURN musicas_historico;


END $$

DELIMITER ;
