/*
-- What are the most optimal skills to have as a data analyst
--  Taking into account which are the most in demand and what the top paying jobs require?
-- Focusing on high demand and high average salaries
*/

WITH highest_avg_salaries AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg),2) AS avg_salary

    FROM
        job_postings_fact

    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

    WHERE
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_location = 'New York, NY'

    GROUP BY
        skills_dim.skill_id

), highest_demanded_skills AS (
    SELECT 
        skills_dim.skills,
        skills_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS count_demand

    FROM
        job_postings_fact

    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'New York, NY' AND
        salary_year_avg IS NOT NULL

    GROUP BY
        skills_dim.skill_id    
)

SELECT
    highest_demanded_skills.skill_id,
    highest_demanded_skills.skills,
    count_demand,
    avg_salary

FROM
    highest_demanded_skills

INNER JOIN highest_avg_salaries
    ON highest_avg_salaries.skill_id = highest_demanded_skills.skill_id

WHERE
    count_demand>10
ORDER BY
    avg_salary DESC,
    count_demand DESC

LIMIT 25
