/*
Question: What are the most in-demand skills for a data analyst?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS count_demand

FROM
    job_postings_fact

INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'New York, NY'

GROUP BY
    skills

ORDER BY
    count_demand DESC

LIMIT 5;