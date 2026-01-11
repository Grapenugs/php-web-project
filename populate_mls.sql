USE mls;

-- PROPERTY (at least 5)

INSERT INTO Property (address, ownerName, price) VALUES
('100 Maple St', 'Alice Jones', 185000),
('200 Oak Ave', 'Ben Smith', 235000),
('300 Pine Rd', 'Carla White', 120000),
('400 Cedar Ln', 'David Green', 450000),
('500 Birch Blvd', 'Erin Black', 325000),
('600 Market St', 'OfficeCo', 500000),
('700 Commerce Dr', 'BizCorp', 750000);

-- HOUSE (5 houses)

INSERT INTO House (bedrooms, bathrooms, size, address) VALUES
(3, 2, 1500, '100 Maple St'),
(3, 2, 1800, '200 Oak Ave'),
(2, 1, 1100, '300 Pine Rd'),
(4, 3, 2500, '400 Cedar Ln'),
(3, 2, 1600, '500 Birch Blvd');

-- BUSINESS PROPERTY (5 entries)

INSERT INTO BusinessProperty (`type`, size, address) VALUES
('office', 2000, '600 Market St'),
('storefront', 1500, '700 Commerce Dr'),
('office', 3000, '400 Cedar Ln'),       -- same property but business type for assignment variety
('warehouse', 5000, '300 Pine Rd'),
('office', 1800, '200 Oak Ave');

-- FIRM (5 firms)

INSERT INTO Firm (id, name, address) VALUES
(1, 'Sunshine Realty', '10 Real Estate Way'),
(2, 'Capital Homes', '20 Main St'),
(3, 'Northern Brokers', '30 North Ave'),
(4, 'Premier Properties', '40 Elite Blvd'),
(5, 'Value Realty', '50 Savings Rd');

-- AGENT (5 agents, each belongs to 1 firm)

INSERT INTO Agent (agentId, name, phone, firmId, dateStarted) VALUES
(001, 'Agent Alice', '555-111-1111', 1, '2020-01-15'),
(102, 'Agent Bob', '555-222-2222', 2, '2019-03-20'),
(103, 'Agent Carol', '555-333-3333', 3, '2021-07-10'),
(104, 'Agent Dan', '555-444-4444', 4, '2018-11-30'),
(105, 'Agent Erin', '555-555-5555', 5, '2022-05-05');

-- LISTINGS (at least 5)

INSERT INTO Listings (mlsNumber, address, agentId, dateListed) VALUES
(9001, '100 Maple St', 001, '2024-09-15'),
(9002, '200 Oak Ave', 001, '2024-10-01'),
(9003, '300 Pine Rd', 102, '2024-11-02'),
(9004, '400 Cedar Ln', 103, '2024-09-20'),
(9005, '600 Market St', 104, '2024-08-18'),
(9006, '700 Commerce Dr', 105, '2024-07-10'),
(9007, '500 Birch Blvd', 001, '2024-10-15');

-- BUYER (5 buyers with preferences)

INSERT INTO Buyer (id, name, phone, propertyType, bedrooms, bathrooms, businessPropertyType,
                   minimumPreferredPrice, maximumPreferredPrice)
VALUES
(1, 'Buyer Tom', '555-666-6666', 'house', 3, 2, NULL, 150000, 300000),
(2, 'Buyer Sue', '555-777-7777', 'house', 2, 1, NULL, 100000, 200000),
(3, 'Buyer Rick', '555-888-8888', 'business', NULL, NULL, 'office', 300000, 800000),
(4, 'Buyer Jane', '555-999-9999', 'business', NULL, NULL, 'storefront', 100000, 500000),
(5, 'Buyer Lex', '555-123-4567', 'house', 4, 3, NULL, 250000, 500000);

-- WORKS_WITH (5+ links)

INSERT INTO Works_With (buyerId, agentId) VALUES
(1, 001),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(1, 102),   -- extra to support query 9
(3, 001);   -- extra to support query 8 and 9

