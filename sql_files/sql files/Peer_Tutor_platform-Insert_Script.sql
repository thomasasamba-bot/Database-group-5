-- 1. Insert into Student
INSERT INTO Student (StudentName, StudentEmail, StudentPhone) VALUES
('Alice Johnson', 'alice.johnson@example.com', '0712345678'),
('Brian Kimani', 'brian.kimani@example.com', '0723456789'),
('Catherine Mwangi', 'catherine.mwangi@example.com', '0734567890'),
('David Otieno', 'david.otieno@example.com', '0745678901'),
('Emma Njeri', 'emma.njeri@example.com', '0756789012');

-- 2. Insert into Tutor
INSERT INTO Tutor (TutorName, TutorEmail, TutorPhone) VALUES
('James Mwangi', 'james.mwangi@example.com', '0711122233'),
('Linda Wanjiku', 'linda.wanjiku@example.com', '0722233344'),
('Michael Oduor', 'michael.odour@example.com', '0733344455'),
('Nancy Chebet', 'nancy.chebet@example.com', '0744455566'),
('Peter Kimani', 'peter.kimani@example.com', '0755566677');

-- 3. Insert into Subject
INSERT INTO Subject (SubjectName) VALUES
('Mathematics'),
('Physics'),
('Chemistry'),
('Biology'),
('Computer Science');

-- 4. Insert into TutorSubject (M:N mapping)
INSERT INTO TutorSubject (TutorID, SubjectID) VALUES
(1,1), (1,2),
(2,3), (2,4),
(3,1), (3,5),
(4,2), (4,3),
(5,4), (5,5);

-- 5. Insert into TutorAvailability
INSERT INTO TutorAvailability (TutorID, AvailabilityDay, AvailabilityTime) VALUES
(1,'Monday','10:00'),
(2,'Tuesday','14:00'),
(3,'Wednesday','09:00'),
(4,'Thursday','16:00'),
(5,'Friday','11:00');

-- 6. Insert into Session
INSERT INTO Session (StudentID, TutorID, SubjectID, SessionDate, SessionTime, SessionDuration, SessionStatus) VALUES
(1,1,1,'2026-03-15','10:00',60,'Pending'),
(2,2,3,'2026-03-16','14:00',90,'Confirmed'),
(3,3,5,'2026-03-17','09:00',60,'Completed'),
(4,4,2,'2026-03-18','16:00',45,'Cancelled'),
(5,5,4,'2026-03-19','11:00',120,'Pending');

-- 7. Insert into Rating
INSERT INTO Rating (SessionID, RatingScore, RatingComment) VALUES
(1,5,'Excellent session'),
(2,4,'Very good tutor'),
(3,3,'Average session, tutor was late'),
(4,2,'Tutor cancelled unexpectedly'),
(5,5,'Highly recommend');

-- 8. Insert into Admin
INSERT INTO Admin (AdminName, AdminEmail) VALUES
('Sarah Omondi', 'sarah.omondi@example.com'),
('John Mwangi', 'john.mwangi@example.com'),
('Grace Wambui', 'grace.wambui@example.com'),
('Paul Njoroge', 'paul.njoroge@example.com'),
('Rita Kamau', 'rita.kamau@example.com');