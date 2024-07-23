-- Query 6: Select detailed information about a movie with ID of 1
SELECT 
    m.ID, 
    m.Title, 
    m.ReleaseDate, 
    m.Duration, 
    m.Description, 
    JSON_BUILD_OBJECT('FileName', f.FileName, 'MIMEType', f.MIMEType, 'URL', f.URL) AS Poster,
    JSON_BUILD_OBJECT('ID', p.ID, 'FirstName', p.FirstName, 'LastName', p.LastName, 
                      'PrimaryPhoto', JSON_BUILD_OBJECT('FileName', pf.FileName, 'MIMEType', pf.MIMEType, 'URL', pf.URL)) AS Director,
    (SELECT 
        JSON_AGG(JSON_BUILD_OBJECT('ID', a.ID, 'FirstName', a.FirstName, 'LastName', a.LastName, 
                                   'PrimaryPhoto', JSON_BUILD_OBJECT('FileName', af.FileName, 'MIMEType', af.MIMEType, 'URL', af.URL)))
     FROM 
        Person a
     JOIN 
        Character c ON a.ID = c.PersonID
     LEFT JOIN 
        File af ON a.PrimaryPhotoFileID = af.ID
     WHERE 
        c.MovieID = m.ID) AS Actors,
    (SELECT 
        JSON_AGG(JSON_BUILD_OBJECT('ID', g.ID, 'Name', g.Name))
     FROM 
        Genre g
     JOIN 
        MovieGenre mg ON g.ID = mg.GenreID
     WHERE 
        mg.MovieID = m.ID) AS Genres
FROM 
    Movie m
JOIN 
    File f ON m.PosterFileID = f.ID
JOIN 
    Person p ON m.DirectorID = p.ID
LEFT JOIN 
    File pf ON p.PrimaryPhotoFileID = pf.ID
WHERE 
    m.ID = 1;
