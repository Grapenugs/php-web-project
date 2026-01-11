-- THIS IS THE GOOD TEST DATA (OTHER DOESNT WORK ON QUERY 10)

USE mls;

-- FIRMS
INSERT INTO Firm (id, name, address) VALUES
(1, 'Sunrise Realty', '123 Main St'),
(2, 'Ocean View Properties', '456 Ocean Ave'),
(3, 'Urban Estate', '789 City Blvd');

-- AGENTS
INSERT INTO Agent (agentId, name, phone, firmId, dateStarted) VALUES
(1, 'Alice Johnson', '555-1111', 1, '2020-01-10'),
(2, 'Bob Smith', '555-2222', 2, '2021-03-15'),
(3, 'Carol Lee', '555-3333', 3, '2019-06-01');

-- PROPERTIES
INSERT INTO Property (address, ownerName, price) VALUES
('101 Maple St', 'John Doe', 200000),
('102 Oak St', 'Jane Roe', 150000),
('103 Pine St', 'Mike Roe', 300000),
('201 Business Rd', 'Corp Inc', 500000),
('202 Commerce St', 'Biz LLC', 400000);

-- HOUSES
INSERT INTO House (address, bedrooms, bathrooms, size) VALUES
('101 Maple St', 3, 2, 1800),
('102 Oak St', 2, 1, 1200),
('103 Pine St', 3, 2, 2000);

-- BUSINESS PROPERTIES
INSERT INTO BusinessProperty (address, `type`, size) VALUES
('201 Business Rd', 'Office', 5000),
('202 Commerce St', 'Storefront', 3000);

-- LISTINGS
INSERT INTO Listings (mlsNumber, address, agentId, dateListed) VALUES
(1001, '101 Maple St', 1, '2023-10-01'),
(1002, '102 Oak St', 1, '2023-10-05'),
(1003, '103 Pine St', 2, '2023-10-10'),
(2001, '201 Business Rd', 2, '2023-10-02'),
(2002, '202 Commerce St', 3, '2023-10-03');

-- BUYERS
INSERT INTO Buyer (id, name, phone, propertyType, bedrooms, bathrooms, businessPropertyType, minimumPreferredPrice, maximumPreferredPrice) VALUES
(1, 'Buyer One', '555-1010', 'House', 3, 2, NULL, 100000, 250000),
(2, 'Buyer Two', '555-2020', 'House', 2, 1, NULL, 100000, 200000),
(3, 'Buyer Three', '555-3030', 'Business', NULL, NULL, 'Office', 400000, 600000),
(4, 'Buyer Four', '555-4040', 'Business', NULL, NULL, 'Storefront', 300000, 500000),
(5, 'Buyer Five', '555-5050', 'House', 3, 2, NULL, 150000, 300000);

-- WORKS_WITH
INSERT INTO Works_With (buyerId, agentId) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 2);

