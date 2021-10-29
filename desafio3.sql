CREATE VIEW historico_reproducao_usuarios AS
SELECT t1.NOME AS usuario, t2.NOME AS nome
FROM SpotifyClone.historico_de_reproducoes t
INNER JOIN SpotifyClone.usuarios t1 ON t.USUARIO_ID = t1.USUARIO_ID
INNER JOIN SpotifyClone.cancoes t2 ON t.CANCAO_ID = t2.CANCAO_ID
ORDER BY t1.NOME, t2.NOME;
