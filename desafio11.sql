CREATE VIEW cancoes_premium AS
SELECT t1.NOME AS nome, 
COUNT(*) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes t
INNER JOIN SpotifyClone.cancoes t1 ON t.CANCAO_ID = t1.CANCAO_ID
INNER JOIN SpotifyClone.usuarios t2 ON t.USUARIO_ID = t2.USUARIO_ID
WHERE t2.PLANO_ID = 2 OR t2.PLANO_ID = 3
GROUP BY t1.NOME
ORDER BY t1.NOME;
