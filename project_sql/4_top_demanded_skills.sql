/*
-- Look at the average salary associated with each skill for analyst positions
-- focus on roles with specified salaries, regardless of location
*/

SELECT 
    skills,
    job_title,
    ROUND(AVG(salary_year_avg),2) AS avg_salary

FROM
    job_postings_fact

INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
  --  job_location = 'New York, NY'

GROUP BY
    skills,
    job_title

ORDER BY
    avg_salary DESC

LIMIT 10;