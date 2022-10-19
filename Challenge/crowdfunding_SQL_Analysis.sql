-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, campaign.backers_count AS backers FROM campaign 
WHERE campaign.outcome = 'live' ORDER BY backers DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id, COUNT(cf_id) AS backers FROM backers 
GROUP BY cf_id ORDER BY backers DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT b.first_name, b.last_name, b.email, 
(c.goal - c.pledged) AS  amt_left
INTO email_contacts_remaining_goal_amount_live
FROM backers AS b
RIGHT JOIN campaign AS c ON b.cf_id = c.cf_id
WHERE c.outcome = 'live'
ORDER BY amt_left DESC; 


-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT b.first_name, b.last_name, b.email, c.cf_id,
c.company_name, c.description, c.launch_date,
(c.goal - c.pledged) AS  "left of goal"
INTO email_backers_remaining_goal_amount
FROM backers AS b
RIGHT JOIN campaign AS c ON b.cf_id = c.cf_id
WHERE c.outcome = 'live'
ORDER BY "left of goal" DESC; 


-- Check the table


