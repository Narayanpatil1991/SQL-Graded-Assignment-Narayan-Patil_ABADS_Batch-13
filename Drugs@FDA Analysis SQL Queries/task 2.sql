/*Group products based on MarketingStatus. Provide meaningful insights into the segmentation patterns.*/
SELECT ProductMktStatus, COUNT(*) AS NumberOfProducts
FROM product
GROUP BY ProductMktStatus;


/*Calculate the total number of applications for each MarketingStatus year-wise after the year 2010.*/

SELECT YEAR(r.ActionDate) AS Year, p.ProductMktStatus, COUNT(*) AS NumberOfApplications
FROM regactiondate r
JOIN product p ON r.ApplNo = p.ApplNo
WHERE YEAR(r.ActionDate) > 2010
GROUP BY YEAR(r.ActionDate), p.ProductMktStatus
ORDER BY Year, p.ProductMktStatus;


/* Identify the top MarketingStatus with the maximum number of applications and analyze its trend over time.*/
/* Trend over time for the top MarketingStatus*/

SELECT YEAR(r.ActionDate) AS Year, COUNT(*) AS NumberOfApplications
FROM product p
JOIN regactiondate r ON p.ApplNo = r.ApplNo
WHERE p.ProductMktStatus = (
    SELECT p.ProductMktStatus
    FROM product p
    JOIN regactiondate r ON p.ApplNo = r.ApplNo
    GROUP BY p.ProductMktStatus
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
GROUP BY YEAR(r.ActionDate)
ORDER BY Year;
