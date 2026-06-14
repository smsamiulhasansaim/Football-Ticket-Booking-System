// S M Samiul Hasan
-- Football Ticket Booking System
-- Author : S M Samiul Hasan


-- Query 1: Retrieve all upcoming football matches belonging to
--         the 'Champions League' where match status is'Available'

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';
 

-- Query 2: Search for all users whose full names start with
-- 'Tanvir' OR contain the phrase 'Haque' (case-insensitive)
-- Concepts: ILIKE / LIKE
 
SELECT
    user_id,
    full_name,
    email
FROM users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';
 
