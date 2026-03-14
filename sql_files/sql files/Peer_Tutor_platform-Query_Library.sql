-- ===============================
-- 1. List all students
-- ===============================
SELECT * FROM Student;

-- ===============================
-- 2. List all tutors
-- ===============================
SELECT * FROM Tutor;

-- ===============================
-- 3. List all subjects
-- ===============================
SELECT * FROM Subject;

-- ===============================
-- 4. List tutors with their subjects
-- ===============================
SELECT t.TutorName, t.TutorEmail, s.SubjectName
FROM Tutor t
JOIN TutorSubject ts ON t.TutorID = ts.TutorID
JOIN Subject s ON ts.SubjectID = s.SubjectID
ORDER BY t.TutorName;

-- ===============================
-- 5. List available tutors on a specific day
-- ===============================
SELECT t.TutorName, ta.AvailabilityDay, ta.AvailabilityTime
FROM Tutor t
JOIN TutorAvailability ta ON t.TutorID = ta.TutorID
WHERE ta.AvailabilityDay = 'Monday'
ORDER BY ta.AvailabilityTime;

-- ===============================
-- 6. List all sessions with student, tutor, and subject
-- ===============================
SELECT se.SessionID, st.StudentName, t.TutorName, su.SubjectName, se.SessionDate, se.SessionTime, se.SessionStatus
FROM Session se
JOIN Student st ON se.StudentID = st.StudentID
JOIN Tutor t ON se.TutorID = t.TutorID
JOIN Subject su ON se.SubjectID = su.SubjectID
ORDER BY se.SessionDate, se.SessionTime;

-- ===============================
-- 7. List ratings and comments for completed sessions
-- ===============================
SELECT s.SessionID, st.StudentName, t.TutorName, r.RatingScore, r.RatingComment
FROM Rating r
JOIN Session s ON r.SessionID = s.SessionID
JOIN Student st ON s.StudentID = st.StudentID
JOIN Tutor t ON s.TutorID = t.TutorID
WHERE s.SessionStatus = 'Completed'
ORDER BY r.RatingScore DESC;

-- ===============================
-- 8. Count number of subjects per tutor
-- ===============================
SELECT t.TutorName, COUNT(ts.SubjectID) AS SubjectCount
FROM Tutor t
JOIN TutorSubject ts ON t.TutorID = ts.TutorID
GROUP BY t.TutorName
ORDER BY SubjectCount DESC;

-- ===============================
-- 9. Upcoming sessions for a specific student
-- ===============================
SELECT s.SessionID, t.TutorName, su.SubjectName, s.SessionDate, s.SessionTime, s.SessionStatus
FROM Session s
JOIN Tutor t ON s.TutorID = t.TutorID
JOIN Subject su ON s.SubjectID = su.SubjectID
WHERE s.StudentID = 1 AND s.SessionDate >= CURRENT_DATE
ORDER BY s.SessionDate, s.SessionTime;

-- ===============================
-- 10. Tutors with average rating
-- ===============================
SELECT t.TutorName, AVG(r.RatingScore) AS AvgRating
FROM Tutor t
JOIN Session s ON t.TutorID = s.TutorID
JOIN Rating r ON s.SessionID = r.SessionID
GROUP BY t.TutorName
ORDER BY AvgRating DESC;

-- ===============================
-- 11. Students who have more than one session
-- ===============================
SELECT st.StudentName, COUNT(s.SessionID) AS NumSessions
FROM Student st
JOIN Session s ON st.StudentID = s.StudentID
GROUP BY st.StudentName
HAVING COUNT(s.SessionID) > 1
ORDER BY NumSessions DESC;

-- ===============================
-- 12. Sessions with duration longer than 1 hour
-- ===============================
SELECT se.SessionID, st.StudentName, t.TutorName, se.SessionDuration
FROM Session se
JOIN Student st ON se.StudentID = st.StudentID
JOIN Tutor t ON se.TutorID = t.TutorID
WHERE se.SessionDuration > 60
ORDER BY se.SessionDuration DESC;

-- ===============================
-- 13. List all tutors without any assigned subjects
-- ===============================
SELECT t.TutorName
FROM Tutor t
LEFT JOIN TutorSubject ts ON t.TutorID = ts.TutorID
WHERE ts.SubjectID IS NULL;

-- ===============================
-- 14. List students who haven’t booked any session
-- ===============================
SELECT st.StudentName
FROM Student st
LEFT JOIN Session s ON st.StudentID = s.StudentID
WHERE s.SessionID IS NULL;

-- ===============================
-- 15. List sessions with pending status
-- ===============================
SELECT s.SessionID, st.StudentName, t.TutorName, s.SessionDate, s.SessionTime
FROM Session s
JOIN Student st ON s.StudentID = st.StudentID
JOIN Tutor t ON s.TutorID = t.TutorID
WHERE s.SessionStatus = 'Pending'
ORDER BY s.SessionDate;

-- ===============================
-- 16. Number of sessions per tutor
-- ===============================
SELECT t.TutorName, COUNT(s.SessionID) AS SessionCount
FROM Tutor t
LEFT JOIN Session s ON t.TutorID = s.TutorID
GROUP BY t.TutorName
ORDER BY SessionCount DESC;

-- ===============================
-- 17. Tutors available at a specific time
-- ===============================
SELECT t.TutorName, ta.AvailabilityDay, ta.AvailabilityTime
FROM Tutor t
JOIN TutorAvailability ta ON t.TutorID = ta.TutorID
WHERE ta.AvailabilityTime = '10:00'
ORDER BY ta.AvailabilityDay;

-- ===============================
-- 18. Top rated tutors
-- ===============================
SELECT t.TutorName, AVG(r.RatingScore) AS AvgRating, COUNT(r.RatingID) AS NumRatings
FROM Tutor t
JOIN Session s ON t.TutorID = s.TutorID
JOIN Rating r ON s.SessionID = r.SessionID
GROUP BY t.TutorName
ORDER BY AvgRating DESC, NumRatings DESC;

-- ===============================
-- 19. Sessions per subject
-- ===============================
SELECT su.SubjectName, COUNT(s.SessionID) AS NumSessions
FROM Subject su
LEFT JOIN Session s ON su.SubjectID = s.SubjectID
GROUP BY su.SubjectName
ORDER BY NumSessions DESC;

-- ===============================
-- 20. Admins list
-- ===============================
SELECT * FROM Admin;

-- ===============================
-- 21. Sessions with rating comments
-- ===============================
SELECT se.SessionID, st.StudentName, t.TutorName, r.RatingScore, r.RatingComment
FROM Session se
JOIN Rating r ON se.SessionID = r.SessionID
JOIN Student st ON se.StudentID = st.StudentID
JOIN Tutor t ON se.TutorID = t.TutorID
ORDER BY se.SessionDate;