--Express�es Aritm�ticas
    
--  Utilizando operadores aritm�ticos
SELECT first_name, last_name, salary, salary * 1.15
FROM employees;

-- Regras de preced�ncia dos operadores
SELECT first_name, last_name, salary, (salary + 100) * 1.15
FROM employees;

-- Entendendo o valor nulo (NULL)
-- NULL � aus�ncia de valor
-- NULL n�o � espa�os em 
SELECT first_name, last_name, job_id, salary, commission_pct
FROM  employees;

-- Utilizando valores nulos em express�es aritm�ticas
-- Qualquer express�o aritm�ca com null, retorna null
SELECT first_name, last_name, job_id, commission_pct, 20000 * commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- Utilizando Alias de Coluna

SELECT first_name AS nome, last_name sobrenome, salary sal�rio
FROM employees;

SELECT first_name  "Nome", last_name "Sobrenome", salary "Sal�rio"
FROM employees;


/* Operador de concatena��o
    - Liga colunas ou strings de caracteres com outras colunas ou strings de caracteres
    - � representado por duas barras verticais (||)
    - Cria uma coluna resultante da liga��o que � um string de caracteres
*/

SELECT first_name || ' ' || last_name || ', data de admiss�o: ' || hire_date "Funcion�rio"
FROM employees;

SELECT first_name || ', sal�rio: R$ ' || salary "Funcion�rio"
FROM employees;


/* Linhas duplicadas
   A clausula DISTINCT elimina linhas duplicadas
*/
SELECT DISTINCT department_id
FROM employees;

-- Utilizando Operador alternativo para aspas
SELECT department_name || q'[ Department's Manager Id: ]' || manager_id "Departamento e Gerente"
FROM departments;


/* #Restrigindo e ordenando Dados
    1- Restringir as linhas recuperadas por uma consulta
    2- Classificar as linhas recuperadas por uma consulta
    3- Utilizar vari�veis de substitui��o (&)
    
    Para restringir as linhas de uma consulta, utilizamos a clausula WHERE
    
    SELECT *|{[DISTINCT]}| coluna|express�o [alias,...]} FROM tabela [WHERE condi��o(s)];
*/

    
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 100;


/*
    Strings de caracatere e datas
    
    - Strings de caracateres e datas s�o delimitados por aspas simples (')
    - Valores de strings de caracteres s�o case sensitivos
    - Valores de strings de data s�o sensitivos ao formato definido para o banco de dados ou para a sess�o
    - O format default para exibi��o de datas mais utilizado no Brasil � 'DD/MM/YY' ou 'DD/MM/RR'
*/

SELECT employee_id,first_name, last_name
FROM employees emp
WHERE last_name = 'King';

SELECT employee_id,first_name, last_name
FROM employees emp
WHERE hire_date = '30/01/04';

/* Utilizando operadores de compara��o na cl�usula WHERE */
SELECT last_name, salary FROM employees WHERE salary >= 1000;

-- Selecionando faixas de valores utilizando o operador BETWEEN
SELECT last_name, salary FROM employees WHERE salary BETWEEN 10000 AND 15000;

-- Selecionando valores dentro de uma lista utilizando o  operador IN
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

-- Selecionando valores por coincid�ncia com padr�es utilizando o operador LIKE
-- Use o operador LIKE para executar pesquisas de valores que coincidem com padr�es utilizando caracteres curingas (WILCARDS)
-- As condi��es de pesquisa podem conter caracters ou n�meros:
-- % Combina com zero ou mais caracteres 
--  _  Combina com um e somente um caracter

SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-- Combinando o uso de v�rios caracteres curinga
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%a';


/* 
    Compara��es com valor NULO (NULL)

- Qualquer compara��o com valor NULL retorna o booleano NULL
- Para podermos verificar se um valor � NULL deve ser utilizado a express�o IS NULL
*/

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;


/* Definindo condi��es utilizando operadores l�gicos
    -- AND - Retorna TRUE se ambas as condi��es s�o verdadeiras
    -- OR  - Retorna TRUE  se pelo menos umas das condi��es for verdadeira
    -- NOT - Retorna a nega��o da condi��o.
        Retorna TRUE se a condi��o � falsa;
        Retorna FALSE se a condi��o � verdadeira;
        Retorna NULL se a condi��o � NULL.
*/

-- Utilizando o operador AND
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000 AND job_id = 'IT_PROG';

-- Utilizando o operador OR
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE salary >= 5000 OR job_id = 'IT_PROG';

-- Utilizando o operador NOT
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'F1_ACCOUNT', 'SA_REP');


/*
 Regras de Preced�ncia
 
     1. Operadores aritm�ticos
     2. Operador de concaterna��o 
     3. Condi��es de compara��o
     4. IS[NOT] NULL, LIKE, [NOT] IN
     5. [NOT] BETWEEN
     6. NOT EQUAL TO
     7. NOT condi��o l�gica
     8. AND condi��o l�gica
     9. OR condi��o l�gica
*/

-- Utilizando regras de preced�ncia 
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP' OR job_id = 'IR_PROG' AND salary > 10000;

-- Sobrepondo as regras de precend�ncia
-- Voc� pode utilizar par�nteses para sobrepor as regras de preced�ncia
-- Utilizando regras de preced�ncia 
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR job_id = 'IR_PROG') AND salary > 10000;

/*
    Utilizando a cl�usula ORDER BY
    
    - Ordene as linhas recuperadas utilizando a cl�usula ORDER BY;
        - ASC: Ordem ascendent, dfault
        - DESC: Ordem descendente
    - A cl�usula ORDER BY � a �ltima no comando SELECT

*/

-- Utilizando a cl�usula ORDER BY  - Referenciando ALIAS
SELECT employee_id, last_name, salary*12  salario_anual
FROM employees
ORDER BY salario_anual;

-- Utilizando a cl�usula ORDER BY  - Referenciando a Posi��o
    -- Ordenando utilizando a posi��o num�rica da coluna
SELECT last_name, job_id, department_id, hire_date
FROM employees 
ORDER BY 1;

/* Utilizando a cl�usula ORDER BY - M�ltiplas colunas ou express�es*/
    -- Ordenando por m�ltiplas colunas:
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;


/* Utilizando vari�veis de substitui��o  - & */

SELECT * FROM employees WHERE employee_id = &employee_id;


/* Utilizando vari�veis de substitui��o  - && 
    -- Utilize && se voc� deseja reutilizar o valor da vari�vel sem solicitar um prompt para o usu�rio
    a cada vez que referenciar a vari�vel:

*/

SELECT last_name, department_id, salary
FROM employees
WHERE employee_id = &&employee_id;

-- Utilize �spas simples para valores tipo character e date
SELECT last_name, department_id, job_id, salary * 12
FROM employees
WHERE job_id = '&job_id';


-- Utilizando o comando DEFINE

--Definindo uma variavel
DEFINE employee_id = 101;

SELECT * FROM employees WHERE employee_id = &employee_id;

--visualizando a vari�vel 
DEFINE employee_id
--remover a vari�vel
UNDEFINE employee_id


DESCRIBE employees;

-- Utillizando fun��es de grupo

-- AVG retorna a m�dia  e SUM retorna a soma
SELECT AVG(salary), SUM(salary)
FROM employees;

-- As fun��es MIN e MAX podem ser utilizadas para dados num�ricos, caracteres e datas
SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(salary), MAX(salary)
FROM employees;

-- COUNT(*) retorna o n�mero de linhas
SELECT COUNT(*)
FROM employees;

-- COUNT(expr) retorna o n�mero de linhas com valores n�o nulos para express�o
SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0)), COUNT(*)
FROM employees;


-- COUNT(DISTINCT expr) retorna o n�mero de linhas distintas e valores n�o nulos para express�o
SELECT COUNT(DISTINCT department_id)
FROM employees;

-- COUNT(DISTINCT expr) retorna o n�mero de linhas distintas e valores n�o nulos para express�o
SELECT COUNT(department_id)
FROM employees;

-- FUN��ES DE GRUPO e VALORES NULOS
-- Fun��es de grupo ignoram valores NULOS

SELECT AVG(commission_pct)
FROM employees;

SELECT AVG(NVL(commission_pct, 0)) 
FROM employees;


-- Criando Grupos utilizando a cl�usula GROUP BY

/*
    SELECT coluna, funcao_grupo(coluna)
    FROM tabela
    [WHERE condi��o]
    [GROUP BY express�o_group_by]
    [HAVING condi��o_grupos]
    [ORDER BY coluna];
    
    Sequ�ncia l�gica
    
    1- WHERE - Selecionar as linhas a serem recuperadas
    
    2- GROUP BY - Formar os grupos
    
    3- HAVING - Selecionar os grupos a serem recuperados
    
    4 - Exibir colunas ou express�es do SELECT ordenando pelo crit�rio definido no ORDER BY
    
    Se o comando SELECT utiliza GRUPOS, ent�o todas as colunas ou express�es na lista da cl�usula SELECT 
    que n�o est�o em uma fun��o de grupo devem estar na cl�usula GROUP BY
    
    Consultas incorretqaqs utilizando fun��es de grupo
    
    - Voc� n�o pode utilizar a cl�usula WHERE para restringir grupos
    - Voc� n�o pode utiliazr fun��es de Grupo na cl�usula WHERE
    
    Obs: Utilize a cl�usula HAVING para restringir grupos
    
*/

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- FORMA INCORRETA
SELECT department_id, MAX(salary)
FROM employees
WHERE MAX(salary) > 10000
GROUP BY department_id;

-- FORMA CERTA PARA FILTRAR UMA FUN��O DE GRUPO
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000
ORDER BY department_id desc;

SELECT job_id, SUM(salary) TOTAL
FROM employees
WHERE job_id <> 'SA_REP'
GROUP BY job_id
HAVING  SUM(salary) > 10000
ORDER BY SUM(salary);


-- Aninhando fun��es de grupo
-- Exibindo a maior m�dia de sal�rio por departamento

SELECT MAX(AVG(salary))
FROM employees e
GROUP BY e.department_id;


-- Exibindo dados a partir de multiplas tabelas 

--  Utilizando prefixos  coluna com nomes de tabelas

-- Utilizando prefixos coluna com nomes de tabela

SELECT employees.employee_id, employees.last_name,
        employees.department_id, departments.department_name
FROM employees JOIN departments
    ON (employees.department_id = departments.department_id);
    
-- Qualificando nomes de colunas amb�guos

-- Utilizando ALIAS DE TABELA

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM   employees e JOIN departments d
ON    (e.department_id = d.department_id);

/*
    Criando Natural Joins
    
   � A cl�usula NATURAL JOIN � baseada em todas as colunas nas duas tabelas
    que possuem e o mesmo nome.
    
    � Seleciona as linhas a partir das duas tabelas que possuem valores iguais
    em todas colunas envolvidas na cl�usula
    
    � Se as colunas possuem o mesmo nome, mas possuem diferentes tipos de dados,
    um erro ser� retornado
    
    
*/

-- Utilizando Natural Joins
SELECT department_id, department_name, location_id, city
FROM   departments
NATURAL JOIN locations;

-- Utilizando USING
SELECT e.employee_id, e.last_name, department_id, d.location_id
FROM employees e
    JOIN departments d USING (department_id);
    
-- Join com a Cl�usula ON

/*  
    - Utilize a cl�usula ON para especificar condi��es ou especificar colunas para o JOIN
    
    - A condi��o de JOIN � separada de outras condi��es de pesquisa
    
    - A cl�usula ON torna o c�digo mais simples e f�cil de entender.
    
    SELECT tabela.coluna, tabela.coluna
    FROM tabela
        JOIN tabela ON (condi��o_join)
*/

SELECT e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d 
ON (e.department_id = d.department_id);

-- Joins utilizando v�rias tabelas com a Cl�usu�a ON
SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e
    JOIN jobs        j ON e.job_id = j.job_id
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations   l ON d.location_id = l.location_id
ORDER BY e.employee_id;

/*
    Incluindo condi��es adicionais a condi��o de JOIN na cl�usula WHERE
    
*/

SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON  (e.department_id = d.department_id)
WHERE (e.salary BEtWEEN 10000 AND 15000);

-- Incluindo condi��es adicionais a condi��o de JOIN utilizando AND
SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON  (e.department_id = d.department_id)
AND (e.salary BEtWEEN 10000 AND 15000);

-- SELF Join utilizando a Cl�usula ON
SELECT empregado.employee_id "Id empregado", empregado.last_name "Sobrenome empregado",
       gerente.employee_id "Id gerente", gerente.last_name "Sobrenome gerente"
FROM employees empregado JOIN employees gerente
ON (empregado.manager_id = gerente.employee_id)
ORDER BY empregado.employee_id;



CREATE TABLE  job_grades (
    grade_level  VARCHAR2 (2) NOT NULL,
    lowest_sal   NUMBER  (11, 2),
    highest_sal  NUMBER  (11, 2),
    CONSTRAINT job_grades_pk PRIMARY KEY (grade_level));

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

COMMIT;

SELECT * FROM job_grades;

-- Nonequijoins

SELECT e.employee_id, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM employees e JOIN job_grades j
    ON NVL(e.salary,0) BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY e.salary;


-- INNER JOIN

/*
    No SQL ANSI:1999, o join entre duas tabelas que retorna somente as linhas onde a condi��o de liga��o coincidem � chamado INNER join
    (a palavra INNER � opcional)
*/

SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e
   INNER JOIN jobs        j ON e.job_id = j.job_id
   INNER JOIN departments d ON e.department_id = d.department_id
   INNER JOIN locations   l ON d.location_id = l.location_id
ORDER BY e.employee_id;



/*
    OUTER JOIN
    
    Retornando Registros que n�o correspondem a condi��o de JOIN utilizando OUTER join

    LEFT OUTER JOIN

    Um join entre duas tabelas que retorna as linhas que resultam do INNER join e tamb�m 
    as linhas que n�o coincidem a partir da tabela LEFT � chamado de LEFT OUTER Join
*/

-- LEFT OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
    ON (e.department_id = d.department_id)
ORDER BY d.department_id;

-- RIGHT OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
    ON (e.department_id = d.department_id)
ORDER BY d.department_id;

-- FULL OUTER JOIN
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
    ON (e.department_id = d.department_id)
ORDER BY d.department_id;





