# Movie Application Database

This repository contains the SQL scripts to create and manage a database for a movie application. The database structure is designed to handle user profiles, movies, genres, characters, and related entities.

## ER Diagram

```mermaid
erDiagram
    User {
        int ID
        string Username
        string FirstName
        string LastName
        string Email
        string Password
        int AvatarFileID
        timestamp createdAt
        timestamp updatedAt
    }
    File {
        int ID
        string FileName
        string MIMEType
        string FileKey
        string URL
        timestamp createdAt
        timestamp updatedAt
    }
    Country {
        int ID
        string Name
        timestamp createdAt
        timestamp updatedAt
    }
    Genre {
        int ID
        string Name
        timestamp createdAt
        timestamp updatedAt
    }
    Movie {
        int ID
        string Title
        text Description
        decimal Budget
        date ReleaseDate
        int Duration
        int DirectorID
        int CountryID
        int PosterFileID
        timestamp createdAt
        timestamp updatedAt
    }
    Character {
        int ID
        string Name
        text Description
        string Role
        int MovieID
        int PersonID
        timestamp createdAt
        timestamp updatedAt
    }
    Person {
        int ID
        string FirstName
        string LastName
        text Biography
        date DateOfBirth
        string Gender
        int CountryID
        int PrimaryPhotoFileID
        timestamp createdAt
        timestamp updatedAt
    }
    PersonPhoto {
        int PersonID
        int FileID
    }
    FavoriteMovie {
        int UserID
        int MovieID
    }

    User ||--o{ File : AvatarFileID
    Movie ||--o{ File : PosterFileID
    Person ||--o{ File : PrimaryPhotoFileID
    Country ||--o{ Movie : CountryID
    Country ||--o{ Person : CountryID
    Movie ||--o{ Character : MovieID
    Person ||--o{ Character : PersonID
    Movie ||--o{ MovieGenre : MovieID
    Genre ||--o{ MovieGenre : GenreID
    User ||--o{ FavoriteMovie : UserID
    Movie ||--o{ FavoriteMovie : MovieID
    Person ||--o{ Movie : DirectorID
    Person ||--o{ PersonPhoto : PersonID
    File ||--o{ PersonPhoto : FileID
