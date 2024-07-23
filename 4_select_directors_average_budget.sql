-- Query 4: Select directors along with the average budget of the movies they have directed
SELECT 
    p.ID AS DirectorID, 
    CONCAT(p.FirstName, ' ', p.LastName) AS DirectorName, 
    AVG(m.Budget) AS AverageBudget
FROM 
    Person p
JOIN 
    Movie m ON p.ID = m.DirectorID
GROUP BY 
    p.ID, p.FirstName, p.LastName;
