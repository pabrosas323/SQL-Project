/*
Question: What skills are required for the top-paying data analyst roles?
- Use the top 10 highest paying data analyst roles from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which top paying jobs demand certain skills, helping job seekers
understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name

    FROM
        job_postings_fact    

    LEFT JOIN company_dim
        ON company_dim.company_id = job_postings_fact.company_id

    WHERE
        salary_year_avg IS NOT NULL AND
        job_title_short = 'Data Analyst' AND
        job_location = 'New York, NY'

    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills

FROM
    top_paying_jobs

INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
   salary_year_avg DESC

/*
- SQL is leading with a bold count of 8
- Python follows closely with a bold count of 7
- Tableau is also highly sought after, with a bold count of 6
- Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand
	
0	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"sql"
1	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"python"
2	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"r"
3	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"azure"
4	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"databricks"
5	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"aws"
6	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"pandas"
7	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"pyspark"
8	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"jupyter"
9	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"excel"
10	
job_id	552322
job_title	"Associate Director- Data Insights"
salary_year_avg	"255829.5"
company_name	"AT&T"
skills	"tableau"

*/