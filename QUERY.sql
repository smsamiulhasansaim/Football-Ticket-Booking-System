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
 
