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






