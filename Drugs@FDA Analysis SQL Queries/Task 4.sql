/* Analyze drug approvals based on the therapeutic evaluation code (TE_Code).*/

SELECT p.TECode, COUNT(*) AS NumberOfApprovals
FROM product p
JOIN regactiondate r ON p.ApplNo = r.ApplNo
WHERE r.ActionType = 'AP' and TECode is not null
GROUP BY p.TECode
ORDER BY NumberOfApprovals DESC;

/* Determine the therapeutic evaluation code (TE_Code) with the highest number of Approvals in each year.*/

SELECT YEAR(r.ActionDate) AS Year, p.TECode, COUNT(*) AS NumberOfApprovals,
       RANK() OVER (PARTITION BY YEAR(r.ActionDate) ORDER BY COUNT(*) DESC) AS Raank
FROM product p
JOIN regactiondate r ON p.ApplNo = r.ApplNo
WHERE r.ActionType = 'AP' and TECode is not null and ActionDate is not null	
GROUP BY YEAR(r.ActionDate), p.TECode
ORDER BY Year, Raank;
