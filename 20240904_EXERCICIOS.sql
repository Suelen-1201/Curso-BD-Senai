/*Quest�o 1
O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e
Quantidade Devolvida para o canal de venda mais importante da empresa:
Store.
Utilize uma fun��o SQL para fazer essas consultas no seu banco de
dados. Obs: Fa�a essa an�lise considerando a tabela FactSales.*/
SELECT * FROM FactSales
SELECT * FROM DimChannel

SELECT 
COUNT (DISTINCT a.SalesQuantity) AS qtd_vendida,
COUNT (DISTINCT a.ReturnQuantity) AS qtd_devolvida
FROM FactSales a
LEFT JOIN DimChannel b ON b.ChannelKey = a.channelKey
WHERE b.ChannelName = 'Store'

------------------------------------------------------------
/*Quest�o 2
Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial
de todos os clientes da empresa, mas apenas de ocupa��o Professional.
Utilize um comando SQL para atingir esse resultado.*/
SELECT * FROM DimCustomer

SELECT
AVG (YearlyIncome) AS media_renda
FROM DimCustomer
WHERE Occupation = 'Professional'

-----------------------------------------------------------------
/*Quest�o 3
Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas
registradas na empresa. O seu gerente te pediu os seguintes n�meros e
informa��es:
a.Quantos funcion�rios tem a loja com mais funcion�rios?
b.Qual � o nome dessa loja?*/
SELECT * FROM DimStore

SELECT 
MAX (DISTINCT StoreName) AS nome_loja,
EmployeeCount
FROM DimStore
GROUP BY StoreName, EmployeeCount
ORDER BY EmployeeCount DESC

/*c.Quantos funcion�rios tem a loja com menos funcion�rios?
d.Qual � o nome dessa loja?*/
SELECT 
MIN (DISTINCT StoreName) AS nome_loja,
EmployeeCount
FROM DimStore
GROUP BY StoreName, EmployeeCount
ORDER BY EmployeeCount

----------------------------------------------------------------
/*Quest�o 4
A �rea de RH est� com uma nova a��o para a empresa, e para isso
precisa saber a quantidade total de funcion�rios do sexo Masculino e do
sexo Feminino.
a.Descubra essas duas informa��es utilizando o SQL.*/
SELECT
SUM (CUSTOMERKEY) AS qtd_mulheres
FROM DimCustomer
WHERE Gender = 'F'

SELECT
SUM (CUSTOMERKEY) AS qtd_homens
FROM DimCustomer
WHERE Gender = 'M'

/*b.O funcion�rio e a funcion�ria mais antigos receber�o uma
homenagem. Descubra as seguintes informa��es de cada um deles:
Nome, E-mail, Data de Contrata��o.*/
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
/*Quest�o 5
Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio
descobrir as seguintes informa��es:
a.Quantidade distinta de cores de produtos.
b.Quantidade distinta de marcas
c.Quantidade distinta de classes de produto
Para simplificar, voc� pode fazer isso em uma mesma consulta.*/

SELECT * FROM DimProduct

SELECT COUNT (DISTINCT ColorID) AS cor_produto,
COUNT (DISTINCT BrandName) AS nome_da_marca,
COUNT (DISTINCT ClassName) AS classe_produto
FROM DimProduct