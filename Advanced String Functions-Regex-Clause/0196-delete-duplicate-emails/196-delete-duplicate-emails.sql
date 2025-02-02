-- delete all duplicate emails, keeping only one unique email with the smallest id
DELETE p 
from Person p, Person q 
where p.Id>q.Id AND q.Email=p.Email 