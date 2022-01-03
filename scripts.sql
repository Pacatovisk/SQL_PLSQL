--Expressões Aritméticas
    
--  Utilizando operadores aritméticos
SELECT first_name, last_name, salary, salary * 1.15
FROM employees;

-- Regras de precedência dos operadores
SELECT first_name, last_name, salary, (salary + 100) * 1.15
FROM employees;

-- Entendendo o valor nulo (NULL)
-- NULL é ausência de valor
-- NULL não é espaços em 
SELECT first_name, last_name, job_id, salary, commission_pct
FROM  employees;

-- Utilizando valores nulos em expressões aritméticas
-- Qualquer expressão aritméca com null, retorna null
SELECT first_name, last_name, job_id, commission_pct, 20000 * commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- Utilizando Alias de Coluna

SELECT first_name AS nome, last_name sobrenome, salary salário
FROM employees;

SELECT first_name  "Nome", last_name "Sobrenome", salary "Salário"
FROM employees;


/* Operador de concatenação
    - Liga colunas ou strings de caracteres com outras colunas ou strings de caracteres
    - É representado por duas barras verticais (||)
    - Cria uma coluna resultante da ligação que é um string de caracteres
*/

SELECT first_name || ' ' || last_name || ', data de admissão: ' || hire_date "Funcionário"
FROM employees;

SELECT first_name || ', salário: R$ ' || salary "Funcionário"
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
    3- Utilizar variáveis de substituição (&)
    
    Para restringir as linhas de uma consulta, utilizamos a clausula WHERE
    
    SELECT *|{[DISTINCT]}| coluna|expressão [alias,...]} FROM tabela [WHERE condição(s)];
*/

    
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 100;


/*
    Strings de caracatere e datas
    
    - Strings de caracateres e datas são delimitados por aspas simples (')
    - Valores de strings de caracteres são case sensitivos
    - Valores de strings de data são sensitivos ao formato definido para o banco de dados ou para a sessão
    - O format default para exibição de datas mais utilizado no Brasil é 'DD/MM/YY' ou 'DD/MM/RR'
*/

SELECT employee_id,first_name, last_name
FROM employees emp
WHERE last_name = 'King';

SELECT employee_id,first_name, last_name
FROM employees emp
WHERE hire_date = '30/01/04';

/* Utilizando operadores de comparação na cláusula WHERE */
SELECT last_name, salary FROM employees WHERE salary >= 1000;

-- Selecionando faixas de valores utilizando o operador BETWEEN
SELECT last_name, salary FROM employees WHERE salary BETWEEN 10000 AND 15000;

-- Selecionando valores dentro de uma lista utilizando o  operador IN
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

-- Selecionando valores por coincidência com padrões utilizando o operador LIKE
-- Use o operador LIKE para executar pesquisas de valores que coincidem com padrões utilizando caracteres curingas (WILCARDS)
-- As condições de pesquisa podem conter caracters ou números:
-- % Combina com zero ou mais caracteres 
--  _  Combina com um e somente um caracter

SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-- Combinando o uso de vários caracteres curinga
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%a';


/* 
    Comparações com valor NULO (NULL)

- Qualquer comparação com valor NULL retorna o booleano NULL
- Para podermos verificar se um valor é NULL deve ser utilizado a expressão IS NULL
*/

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;


/* Definindo condições utilizando operadores lógicos
    -- AND - Retorna TRUE se ambas as condições são verdadeiras
    -- OR  - Retorna TRUE  se pelo menos umas das condições for verdadeira
    -- NOT - Retorna a negação da condição.
        Retorna TRUE se a condição é falsa;
        Retorna FALSE se a condição é verdadeira;
        Retorna NULL se a condição é NULL.
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
 Regras de Precedência
 
     1. Operadores aritméticos
     2. Operador de concaternação 
     3. Condições de comparação
     4. IS[NOT] NULL, LIKE, [NOT] IN
     5. [NOT] BETWEEN
     6. NOT EQUAL TO
     7. NOT condição lógica
     8. AND condição lógica
     9. OR condição lógica
*/

-- Utilizando regras de precedência 
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP' OR job_id = 'IR_PROG' AND salary > 10000;

-- Sobrepondo as regras de precendência
-- Você pode utilizar parênteses para sobrepor as regras de precedência
-- Utilizando regras de precedência 
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR job_id = 'IR_PROG') AND salary > 10000;

/*
    Utilizando a cláusula ORDER BY
    
    - Ordene as linhas recuperadas utilizando a cláusula ORDER BY;
        - ASC: Ordem ascendent, dfault
        - DESC: Ordem descendente
    - A cláusula ORDER BY é a última no comando SELECT

*/

-- Utilizando a cláusula ORDER BY  - Referenciando ALIAS
SELECT employee_id, last_name, salary*12  salario_anual
FROM employees
ORDER BY salario_anual;

-- Utilizando a cláusula ORDER BY  - Referenciando a Posição
    -- Ordenando utilizando a posição numérica da coluna
SELECT last_name, job_id, department_id, hire_date
FROM employees 
ORDER BY 1;

/* Utilizando a cláusula ORDER BY - Múltiplas colunas ou expressões*/
    -- Ordenando por múltiplas colunas:
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;


/* Utilizando variáveis de substituição  - & */

SELECT * FROM employees WHERE employee_id = &employee_id;


/* Utilizando variáveis de substituição  - && 
    -- Utilize && se você deseja reutilizar o valor da variável sem solicitar um prompt para o usuário
    a cada vez que referenciar a variável:

*/

SELECT last_name, department_id, salary
FROM employees
WHERE employee_id = &&employee_id;

-- Utilize áspas simples para valores tipo character e date
SELECT last_name, department_id, job_id, salary * 12
FROM employees
WHERE job_id = '&job_id';


-- Utilizando o comando DEFINE

--Definindo uma variavel
DEFINE employee_id = 101;

SELECT * FROM employees WHERE employee_id = &employee_id;

--visualizando a variável 
DEFINE employee_id
--remover a variável
UNDEFINE employee_id
