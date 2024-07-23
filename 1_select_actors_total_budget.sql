-- Query 1: Select a list of actors along with the total budget of the movies they have appeared in
SELECT 
    p.ID AS ActorID, 
    p.FirstName, 
    p.LastName, 
    SUM(m.Budget) AS TotalMoviesBudget
FROM 
    Person p
JOIN 
    Character c ON p.ID = c.PersonID
JOIN 
    Movie m ON c.MovieID = m.ID
GROUP BY 
    p.ID, p.FirstName, p.LastName;
