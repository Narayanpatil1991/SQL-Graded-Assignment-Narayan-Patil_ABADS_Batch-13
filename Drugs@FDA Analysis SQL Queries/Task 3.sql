/*Categorize Products by dosage form and analyze their distribution.*/

SELECT Form, COUNT(*) AS NumberOfProducts
FROM product
GROUP BY Form
ORDER BY NumberOfProducts DESC;


/* Calculate the total number of approvals for each dosage form and identify the most successful forms.*/

SELECT p.Form, COUNT(*) AS NumberOfApprovals
FROM product p
JOIN regActionDate r ON p.ApplNo = r.ApplNo
WHERE r.ActionType = 'AP'
GROUP BY p.Form
ORDER BY NumberOfApprovals DESC;


/* Investigate yearly trends related to successful forms. */

SELECT YEAR(r.ActionDate) AS Year, p.Form, COUNT(*) AS NumberOfApprovals
FROM product p
JOIN regactiondate r ON p.ApplNo = r.ApplNo
WHERE r.ActionType = 'AP' and ActionDate is not null
GROUP BY YEAR(r.ActionDate), p.Form
ORDER BY Year, NumberOfApprovals DESC;

