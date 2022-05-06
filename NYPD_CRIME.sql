-- Beginner Statement
SELECT * FROM NYPD_CRIME.dbo.NYPD_Hate_Crimes
-- where statement 
seLECT * FROM NYPD_CRIME.DBO.MVC_1
WHERE BOROUGH = 'MANHATTAN'

-- group by & order by statements 
select Offense_Description, COUNT(Offense_Description) AS REOCCURENCE_PER_YEAR 
from NYPD_Hate_Crimes
where Complaint_Year_Number = 2019 
GROUP BY Offense_Description
ORDER BY REOCCURENCE_PER_YEAR DESC

-- intermediate statment 
-- inner join 
select * 
from NYPD_CRIME.dbo.MVC_1
INNER JOIN NYPD_CRIME.DBO.MVC_2
	ON MVC_1.BOROUGH = MVC_2.BOROUGH

-- UNIONS 
SELECT * 
FROM NYPD_CRIME.DBO.MVC_1
UNION ALL 
SELECT* 
FROM NYPD_CRIME.DBO.MVC_2

-- CASE STATEMENT 
SELECT Law_Code_Category_Description, Offense_Description,PD_Code_Description,Bias_Motive_Description, Offense_Category, Arrest_Date, 
CASE 
	WHEN BIAS_Motive_Description between 'ANTI - MUSLIM ' and 'anti - jewish' then 'RELIGOUS HATRED' 
	WHEN Offense_Description = 'Assault 3 & RELATED OFFENSES' THEN 'IMPORTANT ISSUE' 
	else ' Other Crimes'
END
FROM NYPD_Hate_Crimes
WHERE Bias_Motive_Description is NOT NULL 
ORDER BY  Law_Code_Category_Description, Offense_Description,PD_Code_Description,Bias_Motive_Description, Offense_Category, Arrest_Date

-- HAVING CLAUSE 
SELECT Borough, AVG(NUMBER_OF_PERSONS_KILLED)
FROM NYPD_CRIME.DBO.MVC_1
JOIN NYPD_CRIME.dbo.MVC_2
	on MVC_1.Borough  = MVC_2.Borough
GROUP BY BOROUGH
HAVING AVG(NUMBER_OF_PERSONS_KILLED) > 2
ORDER BY AVG(NUMBER_OF_PERSONS_KILLED)

-- PROBLEM SOLVING 
SELECT top 15 bias_motive_description as BIAS_MOTIVE, Patrol_Borough_Name, Offense_Description
 FROM NYPD_CRIME.DBO.NYPD_Hate_Crimes
ORDER BY Offense_Description

