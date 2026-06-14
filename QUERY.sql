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
 
-- Query 3: Retrieve all booking records where payment_status
-- is NULL, replacing it with 'Action Required'
-- Concepts: IS NULL, COALESCE
 
SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
WHERE payment_status IS NULL;

-- Query 4: Retrieve match booking details along with the
-- user's full name and the scheduled match fixture
-- Concepts: INNER JOIN
 
SELECT
    b.booking_id,
    u.full_name,
    m.fixture,
    b.total_cost
FROM bookings b
INNER JOIN users   u ON b.user_id  = u.user_id
INNER JOIN matches m ON b.match_id = m.match_id;


-- Query 5: Display all users and their booking IDs, including
-- fans who have never bought a ticket
-- Concepts: LEFT JOIN
 
SELECT
    u.user_id,
    u.full_name,
    b.booking_id
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
ORDER BY u.user_id;

-- Query 6: Find all ticket bookings where total_cost is
-- strictly higher than the average cost of all bookings
-- Concepts: Subquery / Aggregate
 
SELECT
    booking_id,
    match_id,
    total_cost
FROM bookings
WHERE total_cost > (
    SELECT AVG(total_cost)
    FROM bookings
);


-- Query 7: Retrieve the top 2 most expensive matches sorted by
-- base_ticket_price, skipping the single highest match
-- Concepts: ORDER BY, LIMIT, OFFSET

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
ORDER BY base_ticket_price DESC
LIMIT 2 OFFSET 1;
 