-- Create ENUM type first (PostgreSQL requirement)
CREATE TYPE SessionStatusType AS ENUM ('Pending','Confirmed','Completed','Cancelled');

-- 1. Student table
CREATE TABLE Student (
   StudentID SERIAL PRIMARY KEY,
   StudentName VARCHAR(100) NOT NULL,
   StudentEmail VARCHAR(150) NOT NULL UNIQUE,
   StudentPhone VARCHAR(20) NOT NULL
);

-- 2. Tutor table
CREATE TABLE Tutor (
   TutorID SERIAL PRIMARY KEY,
   TutorName VARCHAR(100) NOT NULL,
   TutorEmail VARCHAR(150) NOT NULL UNIQUE,
   TutorPhone VARCHAR(20) NOT NULL
);

-- 3. Subject table
CREATE TABLE Subject (
   SubjectID SERIAL PRIMARY KEY,
   SubjectName VARCHAR(100) NOT NULL UNIQUE
);

-- 4. TutorSubject (junction table for M:N relationship)
CREATE TABLE TutorSubject (
   TutorSubjectID SERIAL PRIMARY KEY,
   TutorID INT NOT NULL,
   SubjectID INT NOT NULL,
   UNIQUE (TutorID, SubjectID),
   FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID),
   FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);

-- 5. TutorAvailability table
CREATE TABLE TutorAvailability (
   AvailabilityID SERIAL PRIMARY KEY,
   TutorID INT NOT NULL,
   AvailabilityDay VARCHAR(20) NOT NULL,
   AvailabilityTime TIME NOT NULL,
   FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID)
);

-- 6. Session table
CREATE TABLE Session (
   SessionID SERIAL PRIMARY KEY,
   StudentID INT NOT NULL,
   TutorID INT NOT NULL,
   SubjectID INT NOT NULL,
   SessionDate DATE NOT NULL,
   SessionTime TIME NOT NULL,
   SessionDuration INT NOT NULL,
   SessionStatus SessionStatusType NOT NULL,
   FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
   FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID),
   FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);

-- 7. Rating table (1:1 with Session)
CREATE TABLE Rating (
   RatingID SERIAL PRIMARY KEY,
   SessionID INT NOT NULL UNIQUE,
   RatingScore SMALLINT NOT NULL,
   RatingComment TEXT,
   FOREIGN KEY (SessionID) REFERENCES Session(SessionID)
);

-- 8. Admin table
CREATE TABLE Admin (
   AdminID SERIAL PRIMARY KEY,
   AdminName VARCHAR(100) NOT NULL,
   AdminEmail VARCHAR(150) NOT NULL UNIQUE
);