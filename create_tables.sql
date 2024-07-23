-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS "MovieDB"

-- Create the User table
CREATE TABLE User (
    ID SERIAL PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    AvatarFileID INTEGER,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AvatarFileID) REFERENCES File(ID)
);

-- Create the File table
CREATE TABLE File (
    ID SERIAL PRIMARY KEY,
    FileName VARCHAR(255) NOT NULL,
    MIMEType VARCHAR(50) NOT NULL,
    FileKey VARCHAR(255) NOT NULL,
    URL TEXT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Country table
CREATE TABLE Country (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Genre table
CREATE TABLE Genre (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Movie table
CREATE TABLE Movie (
    ID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    Budget DECIMAL(15, 2),
    ReleaseDate DATE,
    Duration INTEGER,
    DirectorID INTEGER,
    CountryID INTEGER,
    PosterFileID INTEGER,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DirectorID) REFERENCES Person(ID),
    FOREIGN KEY (CountryID) REFERENCES Country(ID),
    FOREIGN KEY (PosterFileID) REFERENCES File(ID)
);

-- Create the MovieGenre table
CREATE TABLE MovieGenre (
    MovieID INTEGER,
    GenreID INTEGER,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movie(ID),
    FOREIGN KEY (GenreID) REFERENCES Genre(ID)
);

-- Create the Character table
CREATE TABLE Character (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Role VARCHAR(20) CHECK(Role IN ('leading', 'supporting', 'background')),
    MovieID INTEGER,
    PersonID INTEGER,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (MovieID) REFERENCES Movie(ID),
    FOREIGN KEY (PersonID) REFERENCES Person(ID)
);

-- Create the Person table
CREATE TABLE Person (
    ID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Biography TEXT,
    DateOfBirth DATE,
    Gender VARCHAR(10),
    CountryID INTEGER,
    PrimaryPhotoFileID INTEGER,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CountryID) REFERENCES Country(ID),
    FOREIGN KEY (PrimaryPhotoFileID) REFERENCES File(ID)
);

-- Create the PersonPhoto table
CREATE TABLE PersonPhoto (
    PersonID INTEGER,
    FileID INTEGER,
    PRIMARY KEY (PersonID, FileID),
    FOREIGN KEY (PersonID) REFERENCES Person(ID),
    FOREIGN KEY (FileID) REFERENCES File(ID)
);

-- Create the FavoriteMovie table
CREATE TABLE FavoriteMovie (
    UserID INTEGER,
    MovieID INTEGER,
    PRIMARY KEY (UserID, MovieID),
    FOREIGN KEY (UserID) REFERENCES User(ID),
    FOREIGN KEY (MovieID) REFERENCES Movie(ID)
);
