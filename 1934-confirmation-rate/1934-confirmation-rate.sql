-- The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages.
-- The confirmation rate of a user that did not request any confirmation messages is 0. 
-- Round the confirmation rate to two decimal places.
SELECT s.user_id, ROUND(AVG(IF(c.action="confirmed",1,0)),2) as confirmation_rate
FROM Signups as s
LEFT JOIN Confirmations as c
USING(user_id)
GROUP BY s.user_id