/*https://sqlzoo.net/wiki/Neeps_medium_questions*/

--6.
/*Show the 'size' of each of the co72010 events. Size is the total number of students attending each event.
*/
SELECT event.id, SUM(student.sze)
FROM student 
JOIN attends ON (student.id=attends.student)
JOIN event   ON (attends.event=event.id)
WHERE event.modle = 'co72010'
GROUP by event.id

--7.
/*For each post-graduate module, show the size of the teaching team. (post graduate modules start with the code co7).
*/
SELECT COUNT(DISTINCT staff.id) AS 'Size of Teaching Team', modle.name
FROM staff
JOIN teaches ON (staff.id=teaches.staff)
JOIN event   ON (teaches.event=event.id)
JOIN modle   ON (event.modle=modle.id)
WHERE modle.id LIKE '%co7%'
GROUP BY 'Size of Teaching Team', modle.name

--8.
/*Give the full name of those modules which include events taught for fewer than 10 weeks.
*/
SELECT DISTINCT modle.name
FROM event
JOIN modle  ON  (event.modle=modle.id)
JOIN occurs ON (event.id=occurs.event)
JOIN week   ON (occurs.week=week.id)
GROUP BY event.id, modle.name
HAVING COUNT(occurs.week) < 10

--9.
/*Identify those events which start at the same time as one of the co72010 lectures.
*/
SELECT 
FROM modle
JOIN event ON (event.modle=modle.name)
WHERE CONCAT(event.dow, event.tod) IN
(SELECT CONCAT(event.dow, event.tod)
FROM event
WHERE event.modle = 'co72010')

--10.
/*How many members of staff have contact time which is greater than the average?
*/
