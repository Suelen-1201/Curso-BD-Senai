/*Questão 1
O gerente comercial pediu a você uma análise da Quantidade Vendida e
Quantidade Devolvida para o canal de venda mais importante da empresa:
Store.
Utilize uma função SQL para fazer essas consultas no seu banco de
dados. Obs: Faça essa análise considerando a tabela FactSales.*/
SELECT * FROM FactSales
SELECT * FROM DimChannel

SELECT 
COUNT (DISTINCT a.SalesQuantity) AS qtd_vendida,
COUNT (DISTINCT a.ReturnQuantity) AS qtd_devolvida
FROM FactSales a
LEFT JOIN DimChannel b ON b.ChannelKey = a.channelKey
WHERE b.ChannelName = 'Store'

------------------------------------------------------------
/*Questão 2
Uma nova ação no setor de Marketing precisará avaliar a média salarial
de todos os clientes da empresa, mas apenas de ocupação Professional.
Utilize um comando SQL para atingir esse resultado.*/
SELECT * FROM DimCustomer

SELECT
AVG (YearlyIncome) AS media_renda
FROM DimCustomer
WHERE Occupation = 'Professional'

-----------------------------------------------------------------
/*Questão 3
Você precisará fazer uma análise da quantidade de funcionários das lojas
registradas na empresa. O seu gerente te pediu os seguintes números e
informações:
a.Quantos funcionários tem a loja com mais funcionários?
b.Qual é o nome dessa loja?*/
SELECT * FROM DimStore

SELECT 
MAX (DISTINCT StoreName) AS nome_loja,
EmployeeCount
FROM DimStore
GROUP BY StoreName, EmployeeCount
ORDER BY EmployeeCount DESC

/*c.Quantos funcionários tem a loja com menos funcionários?
d.Qual é o nome dessa loja?*/
SELECT 
MIN (DISTINCT StoreName) AS nome_loja,
EmployeeCount
FROM DimStore
GROUP BY StoreName, EmployeeCount
ORDER BY EmployeeCount

----------------------------------------------------------------
/*Questão 4
A área de RH está com uma nova ação para a empresa, e para isso
precisa saber a quantidade total de funcionários do sexo Masculino e do
sexo Feminino.
a.Descubra essas duas informações utilizando o SQL.*/
SELECT
SUM (CUSTOMERKEY) AS qtd_mulheres
FROM DimCustomer
WHERE Gender = 'F'

SELECT
SUM (CUSTOMERKEY) AS qtd_homens
FROM DimCustomer
WHERE Gender = 'M'

/*b.O funcionário e a funcionária mais antigos receberão uma
homenagem. Descubra as seguintes informações de cada um deles:
Nome, E-mail, Data de Contratação.*/
SELECT * FROM DimEmployee

SELECT 
MAX (DISTINCT HireDate) AS dt_contratacao,
FirstName AS nome,
LastName AS sobrenome,
EmailAddress AS email
FROM DimEmployee
WHERE Gender = 'F'
GROUP BY 
FirstName,
LastName,
EmailAddress
ORDER BY dt_contratacao

SELECT 
MAX (HireDate) AS dt_contratacao,
FirstName AS nome,
LastName AS sobrenome,
EmailAddress AS email
FROM DimEmployee
WHERE Gender = 'M'
GROUP BY 
FirstName,
LastName,
EmailAddress
ORDER BY dt_contratacao

------------------------------------------------------------------
/*Questão 5
Agora você precisa fazer uma análise dos produtos. Será necessário
descobrir as seguintes informações:
a.Quantidade distinta de cores de produtos.
b.Quantidade distinta de marcas
c.Quantidade distinta de classes de produto
Para simplificar, você pode fazer isso em uma mesma consulta.*/

SELECT * FROM DimProduct

SELECT COUNT (DISTINCT ColorID) AS cor_produto,
COUNT (DISTINCT BrandName) AS nome_da_marca,
COUNT (DISTINCT ClassName) AS classe_produto
FROM DimProduct