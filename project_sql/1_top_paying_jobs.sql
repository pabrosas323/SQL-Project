/*
Question: What are the top-paying data analyst roles?
- Identify the top 10 highest-paying jobs that are available remotely.
- Focus on job postings with specified salaries (avoid nulls).
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name

FROM
    job_postings_fact    

LEFT JOIN company_dim
    ON company_dim.company_id = job_postings_fact.company_id

 WHERE
    salary_year_avg IS NOT NULL AND
    job_location = 'New York, NY' AND
    job_title_short = 'Data Analyst'

ORDER BY
    salary_year_avg DESC
LIMIT 10;