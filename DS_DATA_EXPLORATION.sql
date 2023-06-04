/* 
Name: Adib Kazi
Date: 6/3/2023
Personal Project: Data Science Salaries and Jobs
Lesson: Intermediate SQL Queries
*/

-- Write a SQL query to calculate the average salary for each job title, sorted in descending order of the average salary.
SELECT DS.job_title, AVG(Salary) AS Average_Salary
FROM DS_INFO DS
GROUP BY ds.job_title
ORDER BY Average_Salary DESC

-- Retrieve the total number of employees for each experience level, ordered by the experience level in ascending order.
SELECT experience_level, COUNT(*) AS TOTAL_NUMBER_EXPERIENCE_LEVEL
FROM DS_INFO
GROUP BY experience_level
ORDER BY TOTAL_NUMBER_EXPERIENCE_LEVEL ASC

-- Find the top 5 countries with the highest average salary, considering only full-time employees (employment_type = 'Full-time').
SELECT  TOP 5 employee_residence, AVG(salary) AS average_salary
FROM DS_INFO
WHERE employment_type = 'FT'
GROUP BY employee_residence
ORDER BY average_salary DESC
 
-- Calculate the total gross salary paid in USD for each company location, sorted in descending order of the total salary.
SELECT EI.company_location, SUM(SI.salary_in_usd) as Total_Gross_Salary
FROM DS_INFO DS
INNER JOIN Salaries_INFO SI
ON DS.salary = SI.salary
INNER JOIN Emp_INFO EI 
ON DS.employee_residence = EI.employee_residence
GROUP BY EI.company_location
ORDER BY Total_Gross_Salary DESC

