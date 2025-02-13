-- There is a factory website that has several machines
-- each running the same number of processes. 
-- Write a solution to find the average time each machine takes to complete a process.

select a1.machine_id, a1.timestamp, a2.timestamp
from Activity a1
join Activity a2
on a1.process_id=a2.process_id
and a1.machine_id=a2.machine_id
and a1.timestamp<a2.timestamp;