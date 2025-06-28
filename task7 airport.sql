-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               PostgreSQL 17.5 on x86_64-windows, compiled by msvc-19.44.35209, 64-bit
-- Операционная система:         
-- HeidiSQL Версия:              12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп данных таблицы public.aircrafts: -1 rows
/*!40000 ALTER TABLE "aircrafts" DISABLE KEYS */;
INSERT INTO "aircrafts" ("aircraft_id", "airline_id", "model", "capacity", "manufacture_year", "last_maintenance") VALUES
	(1, 1, 'Boeing 737-800', 189, 2015, '2023-05-15'),
	(2, 1, 'Airbus A320neo', 180, 2018, '2023-06-20'),
	(3, 2, 'Boeing 747-8', 364, 2017, '2023-04-10'),
	(4, 3, 'Airbus A380', 517, 2016, '2023-07-01'),
	(5, 4, 'Boeing 777-300ER', 396, 2019, '2023-03-28');
/*!40000 ALTER TABLE "aircrafts" ENABLE KEYS */;

-- Дамп данных таблицы public.airlines: -1 rows
/*!40000 ALTER TABLE "airlines" DISABLE KEYS */;
INSERT INTO "airlines" ("airline_id", "name", "country", "foundation_year", "iata_code") VALUES
	(1, 'Aeroflot', 'Russia', 1923, 'SU'),
	(2, 'Lufthansa', 'Germany', 1953, 'LH'),
	(3, 'Emirates', 'UAE', 1985, 'EK'),
	(4, 'Delta Air Lines', 'USA', 1928, 'DL'),
	(5, 'British Airways', 'UK', 1974, 'BA');
/*!40000 ALTER TABLE "airlines" ENABLE KEYS */;

-- Дамп данных таблицы public.airports: -1 rows
/*!40000 ALTER TABLE "airports" DISABLE KEYS */;
INSERT INTO "airports" ("airport_id", "name", "city", "country", "iata_code", "timezone") VALUES
	(1, 'Sheremetyevo', 'Moscow', 'Russia', 'SVO', 'Europe/Moscow'),
	(2, 'Domodedovo', 'Moscow', 'Russia', 'DME', 'Europe/Moscow'),
	(3, 'Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA', 'Europe/Berlin'),
	(4, 'Dubai International', 'Dubai', 'UAE', 'DXB', 'Asia/Dubai'),
	(5, 'John F. Kennedy', 'New York', 'USA', 'JFK', 'America/New_York');
/*!40000 ALTER TABLE "airports" ENABLE KEYS */;

-- Дамп данных таблицы public.baggage: 5 rows
/*!40000 ALTER TABLE "baggage" DISABLE KEYS */;
INSERT INTO "baggage" ("baggage_id", "ticket_id", "weight", "status", "check_in_time") VALUES
	(1, 1, 23.50, 'Checked', '2025-06-28 03:03:51.837691'),
	(2, 2, 18.00, 'Checked', '2025-06-28 03:03:51.837691'),
	(3, 3, 32.00, 'Checked', '2025-06-28 03:03:51.837691'),
	(4, 4, 21.50, 'Checked', '2025-06-28 03:03:51.837691'),
	(5, 5, 40.00, 'Checked', '2025-06-28 03:03:51.837691');
/*!40000 ALTER TABLE "baggage" ENABLE KEYS */;

-- Дамп данных таблицы public.bookings: -1 rows
/*!40000 ALTER TABLE "bookings" DISABLE KEYS */;
INSERT INTO "bookings" ("booking_id", "passenger_id", "service_id", "flight_id", "booking_time") VALUES
	(1, 1, 1, 1, '2025-06-28 03:03:51.884635'),
	(2, 1, 3, 1, '2025-06-28 03:03:51.884635'),
	(3, 2, 2, 1, '2025-06-28 03:03:51.884635'),
	(4, 3, 4, 2, '2025-06-28 03:03:51.884635'),
	(5, 5, 5, 4, '2025-06-28 03:03:51.884635');
/*!40000 ALTER TABLE "bookings" ENABLE KEYS */;

-- Дамп данных таблицы public.crew: -1 rows
/*!40000 ALTER TABLE "crew" DISABLE KEYS */;
INSERT INTO "crew" ("crew_id", "flight_id", "captain_id", "first_officer_id") VALUES
	(1, 1, 1, 2),
	(2, 2, 1, 2),
	(3, 3, 1, 2),
	(4, 4, 1, 2),
	(5, 5, 1, 2);
/*!40000 ALTER TABLE "crew" ENABLE KEYS */;

-- Дамп данных таблицы public.flights: 5 rows
/*!40000 ALTER TABLE "flights" DISABLE KEYS */;
INSERT INTO "flights" ("flight_id", "aircraft_id", "departure_airport_id", "arrival_airport_id", "departure_time", "arrival_time", "status", "gate_id") VALUES
	(1, 1, 1, 3, '2023-08-15 08:00:00', '2023-08-15 10:30:00', 'Scheduled', 1),
	(2, 2, 1, 4, '2023-08-15 12:00:00', '2023-08-15 18:30:00', 'Scheduled', 2),
	(3, 3, 3, 1, '2023-08-16 09:00:00', '2023-08-16 13:30:00', 'Scheduled', 4),
	(4, 4, 4, 5, '2023-08-16 14:00:00', '2023-08-16 22:00:00', 'Scheduled', NULL),
	(5, 5, 5, 2, '2023-08-17 07:00:00', '2023-08-17 16:00:00', 'Scheduled', NULL);
/*!40000 ALTER TABLE "flights" ENABLE KEYS */;

-- Дамп данных таблицы public.gates: -1 rows
/*!40000 ALTER TABLE "gates" DISABLE KEYS */;
INSERT INTO "gates" ("gate_id", "terminal_id", "number", "status") VALUES
	(1, 1, 'B1', 'Available'),
	(2, 1, 'B2', 'Occupied'),
	(3, 2, 'C1', 'Maintenance'),
	(4, 3, 'T1-1', 'Available'),
	(5, 4, 'T2-1', 'Available');
/*!40000 ALTER TABLE "gates" ENABLE KEYS */;

-- Дамп данных таблицы public.maintenance: -1 rows
/*!40000 ALTER TABLE "maintenance" DISABLE KEYS */;
INSERT INTO "maintenance" ("maintenance_id", "aircraft_id", "staff_id", "type", "start_time", "end_time", "cost") VALUES
	(1, 1, 5, 'Regular Check', '2023-05-10 09:00:00', '2023-05-12 17:00:00', 5000.00),
	(2, 2, 5, 'Engine Maintenance', '2023-06-15 08:00:00', '2023-06-18 16:00:00', 15000.00),
	(3, 3, 5, 'Avionics Update', '2023-04-05 10:00:00', '2023-04-08 14:00:00', 8000.00),
	(4, 4, 5, 'Interior Refurbishment', '2023-07-01 09:00:00', '2023-07-05 18:00:00', 20000.00),
	(5, 5, 5, 'Regular Check', '2023-03-20 08:00:00', '2023-03-21 17:00:00', 5000.00);
/*!40000 ALTER TABLE "maintenance" ENABLE KEYS */;

-- Дамп данных таблицы public.passengers: -1 rows
/*!40000 ALTER TABLE "passengers" DISABLE KEYS */;
INSERT INTO "passengers" ("passenger_id", "first_name", "last_name", "passport_number", "nationality", "birth_date") VALUES
	(1, 'Ivan', 'Ivanov', '1234567890', 'Russian', '1985-05-15'),
	(2, 'Anna', 'Petrova', '0987654321', 'Russian', '1990-07-22'),
	(3, 'John', 'Smith', 'AB123456', 'American', '1978-11-30'),
	(4, 'Emma', 'Johnson', 'CD789012', 'British', '1982-03-10'),
	(5, 'Mohammed', 'Al-Farsi', 'EF345678', 'Emirati', '1995-09-18');
/*!40000 ALTER TABLE "passengers" ENABLE KEYS */;

-- Дамп данных таблицы public.services: -1 rows
/*!40000 ALTER TABLE "services" DISABLE KEYS */;
INSERT INTO "services" ("service_id", "name", "description", "price") VALUES
	(1, 'Extra Baggage', 'Additional 10kg baggage allowance', 50.00),
	(2, 'Priority Boarding', 'Priority boarding service', 30.00),
	(3, 'Lounge Access', 'Airport lounge access', 75.00),
	(4, 'In-Flight Meal', 'Special meal selection', 25.00),
	(5, 'Seat Selection', 'Premium seat selection', 40.00);
/*!40000 ALTER TABLE "services" ENABLE KEYS */;

-- Дамп данных таблицы public.shifts: -1 rows
/*!40000 ALTER TABLE "shifts" DISABLE KEYS */;
INSERT INTO "shifts" ("shift_id", "staff_id", "gate_id", "start_time", "end_time") VALUES
	(1, 3, 1, '2023-08-15 07:00:00', '2023-08-15 15:00:00'),
	(2, 4, 2, '2023-08-15 14:00:00', '2023-08-15 22:00:00'),
	(3, 3, 4, '2023-08-16 08:00:00', '2023-08-16 16:00:00'),
	(4, 4, 1, '2023-08-17 07:00:00', '2023-08-17 15:00:00'),
	(5, 5, 3, '2023-08-15 09:00:00', '2023-08-15 17:00:00');
/*!40000 ALTER TABLE "shifts" ENABLE KEYS */;

-- Дамп данных таблицы public.staff: -1 rows
/*!40000 ALTER TABLE "staff" DISABLE KEYS */;
INSERT INTO "staff" ("staff_id", "first_name", "last_name", "position", "hire_date", "salary") VALUES
	(1, 'Alexander', 'Sidorov', 'Pilot', '2010-06-15', 250000.00),
	(2, 'Elena', 'Kuznetsova', 'Co-Pilot', '2015-03-22', 180000.00),
	(3, 'Michael', 'Brown', 'Flight Attendant', '2018-11-10', 80000.00),
	(4, 'Sarah', 'Wilson', 'Flight Attendant', '2019-05-18', 75000.00),
	(5, 'James', 'Taylor', 'Ground Staff', '2020-02-05', 60000.00);
/*!40000 ALTER TABLE "staff" ENABLE KEYS */;

-- Дамп данных таблицы public.terminals: -1 rows
/*!40000 ALTER TABLE "terminals" DISABLE KEYS */;
INSERT INTO "terminals" ("terminal_id", "airport_id", "name", "capacity") VALUES
	(1, 1, 'Terminal B', 5000),
	(2, 1, 'Terminal C', 3500),
	(3, 2, 'Terminal 1', 4000),
	(4, 3, 'Terminal 2', 6000),
	(5, 4, 'Terminal 3', 8000);
/*!40000 ALTER TABLE "terminals" ENABLE KEYS */;

-- Дамп данных таблицы public.tickets: 5 rows
/*!40000 ALTER TABLE "tickets" DISABLE KEYS */;
INSERT INTO "tickets" ("ticket_id", "flight_id", "passenger_id", "seat_number", "class", "price", "purchase_date") VALUES
	(1, 1, 1, '12A', 'Economy', 250.00, '2025-06-28 03:03:51.764939'),
	(2, 1, 2, '12B', 'Economy', 250.00, '2025-06-28 03:03:51.764939'),
	(3, 2, 3, '1A', 'Business', 1200.00, '2025-06-28 03:03:51.764939'),
	(4, 3, 4, '8C', 'Premium Economy', 450.00, '2025-06-28 03:03:51.764939'),
	(5, 4, 5, '3F', 'First', 3500.00, '2025-06-28 03:03:51.764939');
/*!40000 ALTER TABLE "tickets" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
