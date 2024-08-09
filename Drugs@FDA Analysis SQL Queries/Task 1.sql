 /*Determine the number of drugs approved each year and provide insights into the yearly trends.*/

SELECT YEAR(ActionDate) AS Year, COUNT(*) AS NumberOfApprovals
FROM regactiondate
WHERE ActionType = 'AP'
GROUP BY YEAR(ActionDate)
ORDER BY Year;


-- Highest approvals
SELECT YEAR(ActionDate) AS Year, COUNT(*) AS NumberOfApprovals
FROM regactiondate
WHERE ActionType = 'AP'
GROUP BY YEAR(ActionDate)
ORDER BY NumberOfApprovals DESC
LIMIT 3;

-- Lowest approvals
SELECT YEAR(ActionDate) AS Year, COUNT(*) AS NumberOfApprovals
FROM regActionDate
WHERE ActionType = 'AP' and ActionDate  is not null
GROUP BY YEAR(ActionDate)
ORDER BY NumberOfApprovals 
LIMIT 3;


/*Explore approval trends over the years based on sponsors.*/
SELECT YEAR(r.ActionDate) AS Year, a.SponsorApplicant, COUNT(*) AS NumberOfApprovals
FROM RegActionDate r
JOIN Application a ON r.ApplNo = a.ApplNo
WHERE r.ActionType = 'AP'
GROUP BY YEAR(r.ActionDate), a.SponsorApplicant
ORDER BY Year, NumberOfApprovals DESC;

/*Rank sponsors based on the total number of approvals they received each year between 1939 and 1960.*/

SELECT YEAR(r.ActionDate) AS Year, a.SponsorApplicant, COUNT(*) AS NumberOfApprovals
FROM regactiondate r
JOIN application a ON r.ApplNo = a.ApplNo
WHERE r.ActionType = 'AP' and ActionDate is not null
GROUP BY YEAR(r.ActionDate), a.SponsorApplicant
ORDER BY Year, NumberOfApprovals DESC;

/*Rank sponsors based on the total number of approvals they received each year between 1939 and 1960.*/

SELECT YEAR(r.ActionDate) AS Year, a.SponsorApplicant, COUNT(*) AS NumberOfApprovals,
       RANK() OVER (PARTITION BY YEAR(r.ActionDate) ORDER BY COUNT(*) DESC) AS Raank
FROM regActionDate r
JOIN application a ON r.ApplNo = a.ApplNo
WHERE r.ActionType = 'AP' AND YEAR(r.ActionDate) BETWEEN 1939 AND 1960
GROUP BY YEAR(r.ActionDate), a.SponsorApplicant
ORDER BY Year, Raank;


