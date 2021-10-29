CREATE VIEW top_2_hits_do_momento AS
SELECT t1.NOME AS cancao, COUNT(*) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes t
INNER JOIN SpotifyClone.cancoes t1 ON t.CANCAO_ID = t1.CANCAO_ID
GROUP BY t1.NOME
ORDER BY reproducoes DESC, cancao
LIMIT 2;
