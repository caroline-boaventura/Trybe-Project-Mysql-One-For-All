CREATE VIEW faturamento_atual AS
SELECT MIN(VALOR) AS faturamento_minimo,
ROUND(MAX(VALOR), 2) AS faturamento_maximo,
(SELECT ROUND(AVG(t1.VALOR),2) FROM SpotifyClone.usuarios t
INNER JOIN SpotifyClone.planos t1 ON t.PLANO_ID = t1.PLANO_ID) AS faturamento_medio,
(SELECT ROUND(SUM(t1.VALOR),2) FROM SpotifyClone.usuarios t
INNER JOIN SpotifyClone.planos t1 ON t.PLANO_ID = t1.PLANO_ID) AS faturamento_total
FROM SpotifyClone.planos;
