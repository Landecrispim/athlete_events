-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-03-30 20:18:52.176

-- tables
-- Table: Athlete
CREATE TABLE Athlete (
    Name text  NOT NULL,
    sex text  NULL,
    Country_NOC char(3)  NOT NULL,
    CONSTRAINT Athlete_pk PRIMARY KEY (Name)
);

-- Table: Country
CREATE TABLE Country (
    Name text  NOT NULL,
    NOC char(3)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (NOC)
);

-- Table: Games
CREATE TABLE Games (
    YearSeason text  NOT NULL,
    Year int  NOT NULL,
    Season text  NOT NULL,
    City int  NOT NULL,
    Country_NOC char(3)  NOT NULL,
    CONSTRAINT Games_pk PRIMARY KEY (YearSeason)
);

-- Table: Games_Sport
CREATE TABLE Games_Sport (
    Games_YearSeason text  NOT NULL,
    Sport_Name text  NOT NULL,
    CONSTRAINT Games_Sport_pk PRIMARY KEY (Games_YearSeason,Sport_Name)
);

-- Table: Medals
CREATE TABLE Medals (
    serial serial  NOT NULL,
    rank text  NULL,
    age int  NULL,
    height int  NULL,
    weight int  NULL,
    Sport_Name text  NOT NULL,
    Athlete_Name text  NOT NULL,
    CONSTRAINT Medals_pk PRIMARY KEY (serial)
);

-- Table: Sport
CREATE TABLE Sport (
    Name text  NOT NULL,
    Event text  NULL,
    CONSTRAINT Sport_pk PRIMARY KEY (Name)
);

-- foreign keys
-- Reference: Athlete_Country (table: Athlete)
ALTER TABLE Athlete ADD CONSTRAINT Athlete_Country
    FOREIGN KEY (Country_NOC)
    REFERENCES Country (NOC)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Games_Country (table: Games)
ALTER TABLE Games ADD CONSTRAINT Games_Country
    FOREIGN KEY (Country_NOC)
    REFERENCES Country (NOC)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Games_Sport_Games (table: Games_Sport)
ALTER TABLE Games_Sport ADD CONSTRAINT Games_Sport_Games
    FOREIGN KEY (Games_YearSeason)
    REFERENCES Games (YearSeason)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Games_Sport_Sport (table: Games_Sport)
ALTER TABLE Games_Sport ADD CONSTRAINT Games_Sport_Sport
    FOREIGN KEY (Sport_Name)
    REFERENCES Sport (Name)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Medals_Athlete (table: Medals)
ALTER TABLE Medals ADD CONSTRAINT Medals_Athlete
    FOREIGN KEY (Athlete_Name)
    REFERENCES Athlete (Name)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Medals_Sport (table: Medals)
ALTER TABLE Medals ADD CONSTRAINT Medals_Sport
    FOREIGN KEY (Sport_Name)
    REFERENCES Sport (Name)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

