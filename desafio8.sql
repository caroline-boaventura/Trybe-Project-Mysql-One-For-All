DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
	BEFORE DELETE ON usuarios
    FOR EACH ROW
BEGIN
	DELETE FROM SpotifyClone.usuario_seguindo_artista
    WHERE USUARIO_ID = OLD.USUARIO_ID;
    DELETE FROM SpotifyClone.historico_de_reproducoes
    WHERE USUARIO_ID = OLD.USUARIO_ID;
END $$

DELIMITER ;
