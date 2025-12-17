-- ============================================
-- Dummy Data Seeder for Local Bus Monitoring
-- ============================================
-- This file populates the database with sample data
-- Import this AFTER importing local_bus_monitoring.sql
-- ============================================

USE `local_bus_monitoring`;

-- Clear existing data (optional - comment out if you want to keep existing data)
SET FOREIGN_KEY_CHECKS = 0;

-- Delete in correct order (child tables first, then parent tables)
DELETE FROM `bus_location`;
DELETE FROM `user_favourite_route`;
DELETE FROM `bus`;
DELETE FROM `schedule`;
DELETE FROM `route_stops`;
DELETE FROM `user`;
DELETE FROM `stop`;
DELETE FROM `driver`;
DELETE FROM `admin`;
-- Note: route table already has some data, so we'll add more

-- Reset AUTO_INCREMENT
ALTER TABLE `bus_location` AUTO_INCREMENT = 1;
ALTER TABLE `user_favourite_route` AUTO_INCREMENT = 1;
ALTER TABLE `bus` AUTO_INCREMENT = 1;
ALTER TABLE `schedule` AUTO_INCREMENT = 1;
ALTER TABLE `route_stops` AUTO_INCREMENT = 1;
ALTER TABLE `user` AUTO_INCREMENT = 1;
ALTER TABLE `stop` AUTO_INCREMENT = 1;
ALTER TABLE `driver` AUTO_INCREMENT = 1;
ALTER TABLE `admin` AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- ADMINS
-- ============================================
INSERT INTO `admin` (`admin_id`, `username`, `admin_password`) VALUES
(1, 'admin', '$2y$10$y/m.24.71LcTPgwmU5amouQnmO9AVlF6RSNOTEucesgvHgpTRu18q');

-- Password: admin123

-- ============================================
-- DRIVERS
-- ============================================
INSERT INTO `driver` (`driver_id`, `driver_name`, `phone_number`, `password`) VALUES
(1, 'Rahim Uddin', '01711111111', '$2y$10$gDG.zQ72avCOyGPPr.h6EuYmABRz/pVYCdHd1PATZ9EDv4LwLKMc.'),
(2, 'Karim Ahmed', '01722222222', '$2y$10$aqi7VSCWF.Ve2jKba5iUI.k6nrusUL41o10aSpkMp3DcQxqrvFn7i'),
(3, 'Abdul Mannan', '01733333333', '$2y$10$gDG.zQ72avCOyGPPr.h6EuYmABRz/pVYCdHd1PATZ9EDv4LwLKMc.');

-- Passwords: driver123, driver456, driver123

-- ============================================
-- ROUTES (adding more routes)
-- ============================================
-- Note: Routes 1, 2, 3 already exist, so we'll add more
INSERT INTO `route` (`route_id`, `route_name`) VALUES
(4, 'Airport to Campus'),
(5, 'Railway Station to City Center'),
(6, 'Campus Circular Route'),
(7, 'Campus to North Gate'),
(8, 'Campus to South Gate'),
(9, 'Campus to Dormitory Area'),
(10, 'Campus to New Market'),
(11, 'City Center to Campus Night'),
(12, 'Airport to City Center Express'),
(13, 'Airport to University 2'),
(14, 'Railway Station to Campus Direct'),
(15, 'Hostel to Campus Direct'),
(16, 'Staff Quarter to Campus');

-- ============================================
-- STOPS
-- ============================================
INSERT INTO `stop` (`stop_id`, `stop_name`) VALUES
(1, 'Campus Main Gate'),
(2, 'Science Building'),
(3, 'City Center'),
(4, 'Airport Terminal'),
(5, 'Railway Station'),
(6, 'Library Building'),
(7, 'Student Center'),
(8, 'Engineering Building'),
(9, 'Business School'),
(10, 'Medical Center'),
(11, 'North Gate'),
(12, 'South Gate'),
(13, 'Dormitory Area'),
(14, 'New Market'),
(15, 'Staff Quarter'),
(16, 'University 2');

-- ============================================
-- ROUTE STOPS MAPPING
-- ============================================
-- Route 1: Campus to City Center (existing stops)
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(1, 1, 1, 1),  -- Campus Main Gate
(2, 1, 2, 2),  -- Science Building
(3, 1, 3, 3);  -- City Center

-- Route 2: City Center to Airport
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(4, 2, 3, 1),  -- City Center
(5, 2, 4, 2);  -- Airport Terminal

-- Route 3: Campus to Railway Station
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(6, 3, 1, 1),  -- Campus Main Gate
(7, 3, 5, 2);  -- Railway Station

-- Route 4: Airport to Campus
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(8, 4, 4, 1),  -- Airport Terminal
(9, 4, 3, 2),  -- City Center
(10, 4, 2, 3), -- Science Building
(11, 4, 1, 4); -- Campus Main Gate

-- Route 5: Railway Station to City Center
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(12, 5, 5, 1), -- Railway Station
(13, 5, 3, 2); -- City Center

-- Route 6: Campus Circular Route
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(14, 6, 1, 1),  -- Campus Main Gate
(15, 6, 6, 2),  -- Library Building
(16, 6, 7, 3),  -- Student Center
(17, 6, 8, 4),  -- Engineering Building
(18, 6, 9, 5),  -- Business School
(19, 6, 1, 6);  -- Back to Campus Main Gate

-- Route 7: Campus to North Gate
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(20, 7, 1, 1),  -- Campus Main Gate
(21, 7, 11, 2); -- North Gate

-- Route 8: Campus to South Gate
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(22, 8, 1, 1),  -- Campus Main Gate
(23, 8, 12, 2); -- South Gate

-- Route 9: Campus to Dormitory Area
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(24, 9, 1, 1),  -- Campus Main Gate
(25, 9, 13, 2); -- Dormitory Area

-- Route 10: Campus to New Market
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(26, 10, 1, 1),  -- Campus Main Gate
(27, 10, 14, 2); -- New Market

-- Route 11: City Center to Campus Night
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(28, 11, 3, 1),  -- City Center
(29, 11, 1, 2);  -- Campus Main Gate

-- Route 14: Railway Station to Campus Direct
INSERT INTO `route_stops` (`rs_id`, `route_id`, `stop_id`, `stop_order`) VALUES
(30, 14, 5, 1),  -- Railway Station
(31, 14, 1, 2);  -- Campus Main Gate

-- ============================================
-- SCHEDULES
-- ============================================
INSERT INTO `schedule` (`schedule_id`, `departure_time`, `arrival_time`, `route_id`, `admin_id`, `driver_id`) VALUES
(1, '08:00:00', '08:45:00', 1, 1, 1),  -- Campus to City Center - Morning
(2, '09:00:00', '09:40:00', 2, 1, 2),  -- City Center to Airport
(3, '10:00:00', '10:50:00', 3, 1, 1),  -- Campus to Railway Station
(4, '11:00:00', '11:45:00', 1, 1, 2),  -- Campus to City Center - Midday
(5, '12:00:00', '12:40:00', 2, 1, 3),  -- City Center to Airport - Afternoon
(6, '14:00:00', '14:50:00', 3, 1, 1),  -- Campus to Railway Station - Afternoon
(7, '15:00:00', '15:30:00', 6, 1, 2),  -- Campus Circular Route
(8, '16:00:00', '16:45:00', 4, 1, 3),  -- Airport to Campus
(9, '17:00:00', '17:30:00', 5, 1, 1),  -- Railway Station to City Center
(10, '18:00:00', '18:45:00', 1, 1, 2), -- Campus to City Center - Evening
(11, '07:30:00', '07:50:00', 7, 1, 1), -- Campus to North Gate
(12, '07:45:00', '08:05:00', 8, 1, 2), -- Campus to South Gate
(13, '08:15:00', '08:40:00', 9, 1, 3), -- Campus to Dormitory Area
(14, '08:30:00', '09:00:00', 10, 1, 1), -- Campus to New Market
(15, '21:00:00', '21:45:00', 11, 1, 2), -- City Center to Campus Night
(16, '06:30:00', '07:15:00', 14, 1, 3); -- Railway Station to Campus Direct

-- ============================================
-- BUSES
-- ============================================
INSERT INTO `bus` (`bus_id`, `bus_num`, `capacity`, `route_id`, `schedule_id`) VALUES
(1, 'BUS-101', 40, 1, 1),
(2, 'BUS-202', 35, 2, 2),
(3, 'BUS-303', 50, 3, 3),
(4, 'BUS-404', 40, 1, 4),
(5, 'BUS-505', 35, 2, 5),
(6, 'BUS-606', 50, 3, 6),
(7, 'BUS-707', 30, 6, 7),
(8, 'BUS-808', 40, 4, 8),
(9, 'BUS-909', 35, 5, 9),
(10, 'BUS-010', 40, 1, 10),
(11, 'BUS-111', 40, 7, 11),
(12, 'BUS-222', 35, 8, 12),
(13, 'BUS-333', 40, 9, 13),
(14, 'BUS-444', 35, 10, 14),
(15, 'BUS-555', 40, 11, 15),
(16, 'BUS-666', 50, 14, 16);

-- ============================================
-- USERS (Students/Passengers)
-- ============================================
INSERT INTO `user` (`user_id`, `name`, `email`, `phone_number`, `password`) VALUES
(1, 'Nahin', 'zannatun.nayem@g.bracu.ac.bd', '01314663932', '$2y$10$0kDPQN9ek/ZJ1c9sx7sSE.tz9.bdGA8O2JGrWXir55M19QEgmxc/6'),
(2, 'Rakib Hasan', 'rakib@example.com', '01711111111', '$2y$10$0bpEjDLy76Sw5PX1/NI5yesdm2lYHp4GRkHecOlHKk8pFM0A1PJNC'),
(3, 'Fatima Ahmed', 'fatima@example.com', '01722222222', '$2y$10$5ilLDfLHhEVrm7JRjpJbke1MouCfbj..BqZ4ObXWsII39PTctPhtW'),
(4, 'Hasan Ali', 'hasan@example.com', '01733333333', '$2y$10$xf6Pl/qA6EjNREHK.HZMsuEM.CPkBYG.JV6h0poW9JZhnSA5ZwlkW'),
(5, 'Sadia Rahman', 'sadia@example.com', '01744444444', '$2y$10$0bpEjDLy76Sw5PX1/NI5yesdm2lYHp4GRkHecOlHKk8pFM0A1PJNC');

-- Passwords: 
-- User 1 (Nahin): existing password from your DB
-- User 2-5: user123, user456, test123, user123

-- ============================================
-- USER FAVOURITE ROUTES
-- ============================================
INSERT INTO `user_favourite_route` (`fav_id`, `user_id`, `route_id`) VALUES
(1, 1, 1),  -- Nahin likes Route 1
(2, 1, 2),  -- Nahin likes Route 2
(3, 2, 1),  -- Rakib likes Route 1
(4, 2, 3),  -- Rakib likes Route 3
(5, 3, 2),  -- Fatima likes Route 2
(6, 3, 4),  -- Fatima likes Route 4
(7, 4, 6),  -- Hasan likes Circular Route
(8, 5, 1),  -- Sadia likes Route 1
(9, 5, 5);  -- Sadia likes Route 5

-- ============================================
-- BUS LOCATIONS (Sample GPS coordinates for Dhaka area)
-- ============================================
-- These are sample coordinates - replace with actual bus stop locations
INSERT INTO `bus_location` (`location_id`, `bus_id`, `location_lat`, `location_lng`, `timestamps`) VALUES
-- Bus 1 locations (Campus to City Center route)
(1, 1, 23.780887, 90.279239, NOW() - INTERVAL 10 MINUTE),
(2, 1, 23.781500, 90.280000, NOW() - INTERVAL 5 MINUTE),
(3, 1, 23.782000, 90.281000, NOW()),

-- Bus 2 locations (City Center to Airport)
(4, 2, 23.824482, 90.412518, NOW() - INTERVAL 8 MINUTE),
(5, 2, 23.825000, 90.413000, NOW() - INTERVAL 3 MINUTE),
(6, 2, 23.826000, 90.414000, NOW()),

-- Bus 3 locations (Campus to Railway Station)
(7, 3, 23.733840, 90.392780, NOW() - INTERVAL 12 MINUTE),
(8, 3, 23.734500, 90.393500, NOW() - INTERVAL 6 MINUTE),
(9, 3, 23.735000, 90.394000, NOW()),

-- Bus 4 locations
(10, 4, 23.780500, 90.279500, NOW() - INTERVAL 15 MINUTE),
(11, 4, 23.781000, 90.280500, NOW() - INTERVAL 7 MINUTE),

-- Bus 5 locations
(12, 5, 23.825500, 90.413500, NOW() - INTERVAL 9 MINUTE),
(13, 5, 23.826500, 90.414500, NOW()),

-- Bus 11 locations (Campus to North Gate)
(14, 11, 23.780700, 90.279800, NOW() - INTERVAL 6 MINUTE),
(15, 11, 23.781200, 90.280200, NOW() - INTERVAL 2 MINUTE),

-- Bus 12 locations (Campus to South Gate)
(16, 12, 23.779800, 90.279000, NOW() - INTERVAL 5 MINUTE),

-- Bus 13 locations (Campus to Dormitory Area)
(17, 13, 23.782300, 90.281500, NOW() - INTERVAL 4 MINUTE),

-- Bus 16 locations (Railway Station to Campus Direct)
(18, 16, 23.734000, 90.393000, NOW() - INTERVAL 7 MINUTE);

-- ============================================
-- RESET AUTO_INCREMENT VALUES
-- ============================================
ALTER TABLE `admin` AUTO_INCREMENT = 2;
ALTER TABLE `driver` AUTO_INCREMENT = 4;
ALTER TABLE `route` AUTO_INCREMENT = 17;
ALTER TABLE `stop` AUTO_INCREMENT = 17;
ALTER TABLE `route_stops` AUTO_INCREMENT = 32;
ALTER TABLE `schedule` AUTO_INCREMENT = 17;
ALTER TABLE `bus` AUTO_INCREMENT = 17;
ALTER TABLE `user` AUTO_INCREMENT = 6;
ALTER TABLE `user_favourite_route` AUTO_INCREMENT = 10;
ALTER TABLE `bus_location` AUTO_INCREMENT = 19;

-- ============================================
-- VERIFICATION QUERIES (Optional - run these to check data)
-- ============================================
-- SELECT COUNT(*) as total_routes FROM route;
-- SELECT COUNT(*) as total_stops FROM stop;
-- SELECT COUNT(*) as total_buses FROM bus;
-- SELECT COUNT(*) as total_users FROM user;
-- SELECT COUNT(*) as total_schedules FROM schedule;

