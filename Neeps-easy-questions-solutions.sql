/*https://sqlzoo.net/wiki/Neeps_easy_questions*/

--1.
/*Give the room id in which the event co42010.L01 takes place.
*/
SELECT room.id
FROM event
JOIN room ON (event.room=room.id)
WHERE event.id = 'co42010.L01'

--2.
/*For each event in module co72010 show the day, the time and the place.
*/
SELECT dow AS 'Day', tod AS 'Time', Room
FROM event
WHERE modle = 'co72010'

--3.
/*List the names of the staff who teach on module co72010.
*/
SELECT DISTINCT name
FROM staff
JOIN teaches ON (staff.id=teaches.staff)
JOIN event   ON (teaches.event=event.id)
WHERE modle = 'co72010'

--4.
/*Give a list of the staff and module number associated with events using room cr.132 on Wednesday, include the time each event starts.
*/
SELECT name, modle, tod AS time
FROM staff
JOIN teaches ON (staff.id=teaches.staff)
JOIN event   ON (teaches.event=event.id)
WHERE room = 'cr.132' AND dow = 'Wednesday'

--5.
/*Give a list of the student groups which take modules with the word 'Database' in the name.
*/
SELECT student.name
FROM student
JOIN attends ON (student.id=attends.student)
JOIN event    ON (attends.event=event.id)
JOIN modle    ON (event.modle=modle.id)
WHERE modle.name LIKE '%Database%'
