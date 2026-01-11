USE mls;

-- 1. Find the addresses of all houses currently listed
SELECT h.address
FROM House h
JOIN Listings l ON h.address = l.address;

-- 2. Find the addresses and MLS numbers of all houses currently listed
SELECT h.address, l.mlsNumber
FROM House h
JOIN Listings l ON h.address = l.address;

-- 3. Find the addresses of all 3-bedroom, 2-bathroom houses currently listed
SELECT h.address
FROM House h
JOIN Listings l ON h.address = l.address
WHERE h.bedrooms = 3 AND h.bathrooms = 2;

-- 4. Find the addresses and prices of all 3-bedroom, 2-bathroom houses
--    with prices between 100,000 and 250,000, descending by price
SELECT h.address, p.price
FROM House h
JOIN Property p ON h.address = p.address
JOIN Listings l ON h.address = l.address
WHERE h.bedrooms = 3 AND h.bathrooms = 2
  AND p.price BETWEEN 100000 AND 250000
ORDER BY p.price DESC;

-- 5. Find the addresses and prices of all business properties advertised as office space,
--    descending by price
SELECT b.address, p.price
FROM BusinessProperty b
JOIN Property p ON b.address = p.address
JOIN Listings l ON b.address = l.address
WHERE b.`type` = 'Office'
ORDER BY p.price DESC;

-- 6. Find all agents with their firm name and date started
SELECT a.agentId, a.name, a.phone, f.name AS firm_name, a.dateStarted
FROM Agent a
JOIN Firm f ON a.firmId = f.id;

-- 7. Find all properties currently listed by agent with id “001”
SELECT p.address, p.price
FROM Property p
JOIN Listings l ON p.address = l.address
WHERE l.agentId = 1;

-- 8. Find all Agent.name - Buyer.name pairs where buyer works with agent
--    Sorted alphabetically by Agent.name
SELECT a.name AS agent_name, b.name AS buyer_name
FROM Works_With w
JOIN Agent a ON w.agentId = a.agentId
JOIN Buyer b ON w.buyerId = b.id
ORDER BY a.name;

-- 9. For each agent, find the total number of buyers currently working with that agent
SELECT a.agentId, COUNT(w.buyerId) AS total_buyers
FROM Agent a
LEFT JOIN Works_With w ON a.agentId = w.agentId
GROUP BY a.agentId;

-- 10. For a specific buyer interested in houses (id = 1), find all houses
--      that meet the buyer’s preferences, descending by price
SELECT h.address, p.price
FROM Buyer b
JOIN House h ON b.propertyType = 'House'
JOIN Property p ON h.address = p.address
JOIN Listings l ON h.address = l.address
WHERE b.id = 1
  AND h.bedrooms = b.bedrooms
  AND h.bathrooms = b.bathrooms
  AND p.price BETWEEN b.minimumPreferredPrice AND b.maximumPreferredPrice
ORDER BY p.price DESC;

