-- find the patient_id, patient_name, and patients who have Type I Diabetes. 
-- Type I Diabetes always starts with DIAB1 prefix.

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%'

-- diab% = starts with diab
-- %diab = ends with diab