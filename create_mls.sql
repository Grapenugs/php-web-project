DROP DATABASE IF EXISTS mls;
CREATE DATABASE mls;
USE mls;

CREATE TABLE Property
(
    address VARCHAR(50) PRIMARY KEY,
    ownerName VARCHAR(30) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE House
(
    bedrooms INT NOT NULL,
    bathrooms INT NOT NULL,
    size INT NOT NULL,
    address VARCHAR(50) NOT NULL,
    PRIMARY KEY(address),
    FOREIGN KEY(address) REFERENCES Property(address)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE BusinessProperty
(
    type CHAR(20) NOT NULL,
    size INT NOT NULL,
    address VARCHAR(50) NOT NULL,
    PRIMARY KEY(address),
    FOREIGN KEY(address) REFERENCES Property(address)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Firm
(
    id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(50) NOT NULL
);

CREATE TABLE Agent
(
    agentId INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    phone CHAR(12) NOT NULL,
    firmId INT NOT NULL,
    dateStarted DATE NOT NULL,
    FOREIGN KEY(firmId) REFERENCES Firm(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Listings
(
    mlsNumber INT PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    agentId INT NOT NULL,
    dateListed DATE NOT NULL,
    FOREIGN KEY(address) REFERENCES Property(address)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(agentId) REFERENCES Agent(agentId)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Buyer
(
    id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    phone CHAR(12) NOT NULL,
    propertyType CHAR(20) NOT NULL,
    bedrooms INT,
    bathrooms INT,
    businessPropertyType CHAR(20),
    minimumPreferredPrice INT NOT NULL,
    maximumPreferredPrice INT NOT NULL
);

CREATE TABLE Works_With
(
    buyerId INT NOT NULL,
    agentId INT NOT NULL,
    PRIMARY KEY(buyerId, agentId),
    FOREIGN KEY(buyerId) REFERENCES Buyer(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(agentId) REFERENCES Agent(agentId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
