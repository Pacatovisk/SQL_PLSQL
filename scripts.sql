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






