USE SIGB

SELECT '00001' AS COLUNA_1, 
       '00002' AS COLUNA_2, 
       '00003' AS COLUNA_3, 
       '00004' AS COLUNA_4, 
       '00005' AS COLUNA_5, 
       '00006' AS COLUNA_6, 
       '00007' AS COLUNA_7, 
       '00008' AS COLUNA_8
INTO #TMP_CONTRATOS;

SELECT CD_CONTRATO
INTO #TMP_CONTRATOS_FINAL
FROM #TMP_CONTRATOS CON 
UNPIVOT(CD_CONTRATO FOR CONTRATO_2 IN (COLUNA_1, 
                                       COLUNA_2, 
                                       COLUNA_3, 
                                       COLUNA_4, 
                                       COLUNA_5, 
                                       COLUNA_6, 
                                       COLUNA_7, 
                                       COLUNA_8)
									  ) AS COL;

SELECT * FROM #TMP_CONTRATOS		--ANTES
SELECT * FROM #TMP_CONTRATOS_FINAL	--DEPOIS