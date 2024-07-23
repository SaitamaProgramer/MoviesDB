-- Query 3: Retrieve a list of all users along with their favorite movies as an array of identifiers
SELECT 
    u.ID, 
    u.Username, 
    ARRAY_AGG(fm.MovieID) AS FavoriteMovieIDs
FROM 
    User u
LEFT JOIN 
    FavoriteMovie fm ON u.ID = fm.UserID
GROUP BY 
    u.ID, u.Username;
