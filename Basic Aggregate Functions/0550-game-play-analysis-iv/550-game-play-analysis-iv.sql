-- fraction of players that logged in again after their first logged in

-- count the number of players that logged in for at least 2 consecutive days 
-- starting from their first login date, 
-- then divide that number by the total number of players

SELECT player_id, ROUND(
    COUNT(DISTINCT player_id) / 
    (SELECT COUNT(DISTINCT player_id) FROM Activity),2)  AS fraction
FROM Activity
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY))
IN (SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id)

-- count(distinct player_id) = count player hasil seleksi where
-- select count(distinct player) = count raw tabel activity di soal 