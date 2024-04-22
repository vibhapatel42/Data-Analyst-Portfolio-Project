use hr_analyticskpi;
select * from hr_1;
select * from hr_2;
#####################1.Average Attrition rate for all Departments ################################

SELECT Department, 
       AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Avg_Attrition_Rate
FROM hr_1
GROUP BY Department;

###################2.Average Hourly rate of Male Research Scientist #############################

SELECT AVG(HourlyRate) AS Avg_Hourly_Rate
FROM hr_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

########################3.Attrition rate Vs Monthly income stats #####################

SELECT
    hr_1.Department,
    AVG(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AvgAttritionRate,
    AVG(hr_2.MonthlyIncome) AS AvgMonthlyIncome
FROM
    hr_1
JOIN
    hr_2 ON hr_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY
    Department;
    
##########################4.Average working years for each Department #################################
SELECT 
    hr_1.Department,
    AVG(hr_2.TotalWorkingYears) AS AvgWorkingYears
FROM
    hr_1
JOIN
    hr_2 ON hr_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY
    hr_1.Department;
    
################################5.Job Role Vs Work life balance ##################################

SELECT 
    JobRole, 
    AVG(WorkLifeBalance) AS AvgWorkLifeBalance
FROM 
    hr_1
JOIN
    hr_2 ON hr_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY JobRole;

#######################6.Attrition rate Vs Year since last promotion relation ##########################

SELECT 
    hr_1.Department,
    AVG(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AvgAttritionRate,
    AVG(hr_2.YearsSinceLastPromotion) AS AvgYearsSinceLastPromotion
FROM 
    hr_1
JOIN
    hr_2 ON hr_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY Department;



