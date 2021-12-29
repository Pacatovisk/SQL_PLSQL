/* Comando SELECT básico

SELECT *|{[DISTINCT] coluna|expressão[alias],...} FROM tabela;

SELECT identifica as colunas ou expressões a serem exibidas

FROM identifica as tabelas que contém as colunas
 */
 
 -- Selecionando todas as colunas da tabela employees
 SELECT * FROM employees;
 
 -- Selecionando colunas especificas da tabela employees
 SELECT department_id, first_name, email FROM employees;
 
 
 
 
 
 
 
 
 