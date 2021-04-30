USE Campeonato
-- a. Seleções simples

-- i. Mostrar todos os dados da tabela Equipas;
SELECT * 
FROM Equipa

-- ii. Mostrar todos os dados da equipa com o id igual a 12;
SELECT * 
FROM Equipa 
WHERE id_equipa = 12

-- iii. Mostrar o id e o nome de todas as equipas;
SELECT id_equipa , nome 
FROM Equipa 

-- iv. Mostrar o id, o nome e a idade dos treinadores com menos de 40 anos  de idade;
SELECT id_treinador, nome, idade 
FROM Treinador 
WHERE idade < 40 

-- v. Mostrar todos os dados da tabela Experiencias relativos aos treinadores que treinaram juniores ou que tenham mais do que 10 anos de experiência;
SELECT *
FROM Experiencia
WHERE escalao='juniores' OR anos > 10

-- vi. Mostrar todos os dados dos treinadores com idade pertencente ao intervalo [45, 53] e por ordem decrescente da idade;
SELECT *
FROM Treinador
WHERE idade BETWEEN 45 AND 53  
ORDER BY idade DESC

-- vii. Mostrar todos os dados das bolas dos fabricantes Reebok e Olimpic;
SELECT * 
FROM Bola 
WHERE fabricante='Reebok' OR fabricante='Olimpic'

-- viii. Mostrar todos os dados dos treinadores cujo nome começa pela letra A.
SELECT * 
FROM Treinador
WHERE nome LIKE 'a%'

-- b. Funções de agregação
-- i. Mostrar a quantidade de equipas que disputam o campeonato;
SELECT COUNT(*) 
FROM Equipa
 
-- ii. Mostrar a quantidade de fabricantes distintos que produzem bolas usadas no campeonato;
SELECT COUNT(DISTINCT fabricante)
FROM Bola

-- iii. Mostrar a quantidade de treinadores com idade superior a 40 anos;
SELECT COUNT(*)
FROM Treinador
WHERE idade > 40

-- c. Seleções em múltiplas tabelas – Junções (joins)	
-- i. Mostrar o id das equipas que utilizam bolas do fabricante Adidas;


--ii. Mostrar o resultado da alínea anterior, mas sem repetições;
--iii. Mostrar a média das idades dos treinadores de juvenis; 
--iv. Mostrar todos os dados dos treinadores que treinaram juniores durante 5 ou mais anos;
--v. Mostrar todos os dados dos treinadores e das equipas por eles treinadas;
--vi. Mostrar os nomes e os telefones dos treinadores e os nomes das equipas por eles treinadas;
--vii. Mostrar todos os dados da equipa do Académico e dos respetivos  treinadores;
--viii. Mostrar a idade do treinador mais velho do Académico;
--ix. Mostrar o total de anos de experiência do treinador António do Académic