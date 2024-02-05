--@block
CREATE TABLE guests (
    guestID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR (255),
    LastName VARCHAR  (255),
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber CHAR(10),
    PRIMARY KEY (guestID)
);

--@block

INSERT INTO guests (guestID, FirstName, LastName, Email, PhoneNumber) 
VALUES 
(1,'John','Doe','john.doe@example.com', '123456789'),
(2,'Jane','Smith','jsmith@example.com', '0987654321'),
(3,'Mark','Twain','mark.twain@example.com', '1145465565'),
(4,'Charlie','Brown','cbrown@example.com', '3333333333'),
(5,'Harry','Potter','hpott@magic.uk', '5555555555'),
(6,'Luna','The Moon','lunamoon@moon.org', '12121212'),
(7,'Zachary','The Bear','zbear@thebeast.net', '9999999999'),
(8,'Emily','Watson','emwatson@sherlockholmes.co.uk', '7777777');

--@block
SELECT * FROM guests;

--@BLOCK
CREATE TABLE room (
    id INT NOT NULL AUTO_INCREMENT,
    RoomType VARCHAR(50),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES guests(guestID) ON DELETE CASCADE
);

--@block
INSERT INTO room (id, RoomType, owner_id) 
VALUES 
(NULL,'Single',1),(NULL,'Double',1),(NULL,'Suite',1),
(NULL,'King',5),(NULL,'Queen',5),  
(NULL,'Twin',8);

--@block
SELECT * FROM room;

--@block
SELECT g.FirstName, g.LastName, r.RoomType 
FROM guests g 
INNER JOIN room r 
ON g.guestID = r.owner_id;

--@block
SELECT g.FirstName, g.LastName, r.RoomType 
FROM guests g 
INNER JOIN room r 
ON g.guestID = r.owner_id;