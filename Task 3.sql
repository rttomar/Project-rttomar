CREATE DATABASE EventsManagement;

CREATE TABLE Events (
  Event_Id SERIAL PRIMARY KEY,
  Event_Name TEXT,
  Event_Date DATE,
  Event_Location TEXT,
  Event_Description TEXT
);

CREATE TABLE Attendees (
  Attendee_Id SERIAL PRIMARY KEY,
  Attendee_Name TEXT,
  Attendee_Phone NUMERIC,
  Attendee_Email TEXT,
  Attendee_City TEXT
);

CREATE TABLE Registrations (
  Registration_Id SERIAL PRIMARY KEY,
  Event_Id INT,
  Attendee_Id INT,
  Registration_Date DATE,
  Registration_Amount NUMERIC,
  FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
  FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);


INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
  ('Tech Conference', '2023-05-15', 'Bangalore', 'Annual technology conference'),
  ('Music Festival', '2023-06-25', 'Mumbai', 'Weekend music festival'),
  ('Sports Tournament', '2023-07-10', 'Delhi', 'Inter-school sports competition'),
  ('Food Expo', '2023-08-20', 'Chennai', 'Culinary delights from around the world'),
  ('Art Exhibition', '2023-09-05', 'Kolkata', 'Display of contemporary art');

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
  ('Akshay Sharma', 9876543210, 'akshay@gmail.com', 'Bangalore'),
  ('Deepika Chauhan', 9988776655, 'deepika@gmail.com', 'Mumbai'),
  ('Rahul Tomar', 7777777777, 'rahul@gmail.com', 'Delhi'),
  ('Neha Singh', 8888888888, 'neha@gmail.com', 'Kolkata'),
  ('Anjali Reddy', 9999999999, 'anjali@gmail.com', 'Chennai');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
  (1, 1, '2023-04-20', 500),
  (1, 2, '2023-04-21', 500),
  (2, 2, '2023-05-05', 750),
  (3, 3, '2023-06-10', 300),
  (3, 4, '2023-06-11', 300);

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES ('Tech Workshop', '2023-10-15', 'Pune', 'Hands-on technology workshop');

UPDATE Events
SET Event_Description = 'Annual technology and innovation conference'
WHERE Event_Id = 1;

DELETE FROM Events WHERE Event_Id = 5;

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES ('Sarika Verma', 7771112223, 'sarika@gmail.com', 'Hyderabad');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (2, 3, '2023-05-10', 750);

SELECT * FROM Events;

SELECT A.Attendee_Name, A.Attendee_Email
FROM Attendees A
JOIN Registrations R ON A.Attendee_Id = R.Attendee_Id
WHERE R.Event_Id = 2;

SELECT COUNT(*) AS total_attendees, AVG(Registration_Amount) AS avg_registration_amount
FROM Registrations
WHERE Event_Id = 1;	
