-- find all dates' id with higher temperatures compared to its previous dates (yesterday)
SELECT w1.Id
FROM Weather w1, Weather w2
WHERE dateDiff(w1.recordDate,w2.recordDate) = 1 AND w1.Temperature > w2.Temperature;