-- Query 5: Select detailed information about movies that meet specific criteria
SELECT 
    m.ID, 
    m.Title, 
    m.ReleaseDate, 
    m.Duration, 
    m.Description, 
    JSON_BUILD_OBJECT('FileName', f.FileName, 'MIMEType', f.MIMEType, 'URL', f.URL) AS Poster,
    JSON_BUILD_OBJECT('ID', p.ID, 'FirstName', p.FirstName, 'LastName', p.LastName) AS Director
FROM 
    Movie m
JOIN 
    File f ON m.PosterFileID = f.ID
JOIN 
    Person p ON m.DirectorID = p.ID
JOIN 
    Country c ON m.CountryID = c.ID
JOIN 
    MovieGenre mg ON m.ID = mg.MovieID
JOIN 
    Genre g ON mg.GenreID = g.ID
WHERE 
    c.ID = 1
    AND m.ReleaseDate >= '2022-01-01'
    AND m.Duration > 135
    AND (g.Name = 'Action' OR g.Name = 'Drama');
