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

-- Дамп структуры для таблица public.categories
CREATE TABLE IF NOT EXISTS "categories" (
	"category_id" SERIAL NOT NULL,
	"category_name" VARCHAR(100) NOT NULL,
	"parent_category_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("category_id"),
	CONSTRAINT "categories_parent_category_id_fkey" FOREIGN KEY ("parent_category_id") REFERENCES "categories" ("category_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.categories: -1 rows
/*!40000 ALTER TABLE "categories" DISABLE KEYS */;
INSERT INTO "categories" ("category_id", "category_name", "parent_category_id") VALUES
	(1, 'Электроника', NULL),
	(2, 'Компьютеры', 1),
	(3, 'Ноутбуки', 2),
	(4, 'Смартфоны', 1),
	(5, 'Телевизоры', 1),
	(6, 'Продукты', NULL),
	(7, 'Молочные продукты', 6),
	(8, 'Мясо', 6),
	(9, 'Овощи', 6),
	(10, 'Одежда', NULL),
	(11, 'Мужская одежда', 10),
	(12, 'Женская одежда', 10),
	(13, 'Офисная мебель', NULL),
	(14, 'Стулья', 13),
	(15, 'Столы', 13),
	(16, 'Канцтовары', NULL);
/*!40000 ALTER TABLE "categories" ENABLE KEYS */;

-- Дамп структуры для таблица public.employees
CREATE TABLE IF NOT EXISTS "employees" (
	"employee_id" SERIAL NOT NULL,
	"first_name" VARCHAR(50) NOT NULL,
	"last_name" VARCHAR(50) NOT NULL,
	"position" VARCHAR(100) NOT NULL,
	"department" VARCHAR(100) NULL DEFAULT NULL,
	"hire_date" DATE NULL DEFAULT NULL,
	"phone" VARCHAR(20) NULL DEFAULT NULL,
	"email" VARCHAR(100) NULL DEFAULT NULL,
	"warehouse_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("employee_id"),
	CONSTRAINT "employees_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "warehouses" ("warehouse_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.employees: -1 rows
/*!40000 ALTER TABLE "employees" DISABLE KEYS */;
INSERT INTO "employees" ("employee_id", "first_name", "last_name", "position", "department", "hire_date", "phone", "email", "warehouse_id") VALUES
	(1, 'Иван', 'Иванов', 'Менеджер склада', 'Управление', '2020-01-15', '+79161234567', 'ivan.ivanov@warehouse.ru', 1),
	(2, 'Петр', 'Петров', 'Кладовщик', 'Склад', '2021-03-10', '+79162345678', 'petr.petrov@warehouse.ru', 1),
	(3, 'Сергей', 'Сергеев', 'Грузчик', 'Склад', '2022-05-20', '+79163456789', 'sergey.sergeev@warehouse.ru', 1),
	(4, 'Анна', 'Смирнова', 'Менеджер склада', 'Управление', '2019-11-05', '+79164567890', 'anna.smirnova@warehouse.ru', 2),
	(5, 'Мария', 'Кузнецова', 'Кладовщик', 'Склад', '2021-07-15', '+79165678901', 'maria.kuznetsova@warehouse.ru', 2),
	(6, 'Алексей', 'Попов', 'Грузчик', 'Склад', '2022-09-01', '+79166789012', 'alexey.popov@warehouse.ru', 2),
	(7, 'Дмитрий', 'Васильев', 'Менеджер склада', 'Управление', '2020-02-10', '+79167890123', 'dmitry.vasiliev@warehouse.ru', 3),
	(8, 'Елена', 'Новикова', 'Кладовщик', 'Склад', '2021-04-25', '+79168901234', 'elena.novikova@warehouse.ru', 3),
	(9, 'Ольга', 'Морозова', 'Грузчик', 'Склад', '2022-06-15', '+79169012345', 'olga.morozova@warehouse.ru', 3),
	(10, 'Николай', 'Федоров', 'Менеджер склада', 'Управление', '2019-12-20', '+79160123456', 'nikolay.fedorov@warehouse.ru', 4),
	(11, 'Татьяна', 'Соколова', 'Кладовщик', 'Склад', '2021-08-05', '+79161234560', 'tatyana.sokolova@warehouse.ru', 4),
	(12, 'Андрей', 'Михайлов', 'Грузчик', 'Склад', '2022-10-10', '+79162345670', 'andrey.mikhailov@warehouse.ru', 4),
	(13, 'Екатерина', 'Волкова', 'Менеджер склада', 'Управление', '2020-03-15', '+79163456780', 'ekaterina.volkova@warehouse.ru', 5),
	(14, 'Артем', 'Алексеев', 'Кладовщик', 'Склад', '2021-09-20', '+79164567890', 'artem.alekseev@warehouse.ru', 5),
	(15, 'Наталья', 'Лебедева', 'Грузчик', 'Склад', '2022-11-05', '+79165678900', 'natalia.lebedeva@warehouse.ru', 5);
/*!40000 ALTER TABLE "employees" ENABLE KEYS */;

-- Дамп структуры для представление public.expired_products
-- Создание временной таблицы для обработки ошибок зависимостей представлений
CREATE TABLE "expired_products" (
	"inventory_id" INTEGER NULL,
	"product_name" VARCHAR(200) NULL,
	"barcode" VARCHAR(50) NULL,
	"quantity" INTEGER NULL,
	"production_date" DATE NULL,
	"expiry_date" DATE NULL,
	"warehouse_name" VARCHAR(100) NULL,
	"zone_name" VARCHAR(100) NULL,
	"cell_code" VARCHAR(20) NULL,
	"days_until_expiry" INTEGER NULL
) ENGINE=MyISAM;

-- Дамп структуры для таблица public.inventory
CREATE TABLE IF NOT EXISTS "inventory" (
	"inventory_id" SERIAL NOT NULL,
	"product_id" INTEGER NULL DEFAULT NULL,
	"cell_id" INTEGER NULL DEFAULT NULL,
	"quantity" INTEGER NOT NULL,
	"batch_number" VARCHAR(50) NULL DEFAULT NULL,
	"production_date" DATE NULL DEFAULT NULL,
	"expiry_date" DATE NULL DEFAULT NULL,
	"last_check_date" DATE NULL DEFAULT NULL,
	PRIMARY KEY ("inventory_id"),
	CONSTRAINT "inventory_cell_id_fkey" FOREIGN KEY ("cell_id") REFERENCES "storage_cells" ("cell_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "inventory_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.inventory: -1 rows
/*!40000 ALTER TABLE "inventory" DISABLE KEYS */;
INSERT INTO "inventory" ("inventory_id", "product_id", "cell_id", "quantity", "batch_number", "production_date", "expiry_date", "last_check_date") VALUES
	(1, 1, 1, 5, 'SN20230101', '2023-01-01', NULL, '2023-06-01'),
	(2, 2, 2, 10, 'SN20230215', '2023-02-15', NULL, '2023-06-01'),
	(3, 3, 3, 3, 'SN20230310', '2023-03-10', NULL, '2023-06-01'),
	(4, 4, 16, 50, 'BATCH0423', '2023-04-01', '2023-05-15', '2023-04-15'),
	(5, 5, 17, 30, 'BATCH0523', '2023-05-01', '2023-05-10', '2023-05-05'),
	(6, 6, 18, 100, 'BATCH0623', '2023-06-01', '2023-07-15', '2023-06-10'),
	(7, 7, 4, 20, 'BATCH0123', '2023-01-15', NULL, '2023-06-01'),
	(8, 8, 5, 8, 'BATCH0223', '2023-02-20', NULL, '2023-06-01'),
	(9, 9, 6, 100, 'BATCH0323', '2023-03-01', '2025-03-01', '2023-06-01'),
	(10, 10, 7, 5, 'SN20230401', '2023-04-01', NULL, '2023-06-01'),
	(11, 11, 19, 500, 'BATCH0523', '2023-05-01', NULL, '2023-06-01'),
	(12, 12, 20, 30, 'BATCH0623', '2023-06-01', '2024-06-01', '2023-06-10'),
	(13, 13, 8, 15, 'BATCH0123', '2023-01-10', NULL, '2023-06-01'),
	(14, 14, 9, 10, 'BATCH0223', '2023-02-15', NULL, '2023-06-01'),
	(15, 15, 10, 2, 'SN20230320', '2023-03-20', NULL, '2023-06-01'),
	(16, 1, 1, 5, 'SN20230101', '2023-01-01', NULL, '2023-06-01'),
	(17, 2, 2, 10, 'SN20230215', '2023-02-15', NULL, '2023-06-01'),
	(18, 3, 3, 3, 'SN20230310', '2023-03-10', NULL, '2023-06-01'),
	(19, 4, 16, 50, 'BATCH0423', '2023-04-01', '2023-05-15', '2023-04-15'),
	(20, 5, 17, 30, 'BATCH0523', '2023-05-01', '2023-05-10', '2023-05-05'),
	(21, 6, 18, 100, 'BATCH0623', '2023-06-01', '2023-07-15', '2023-06-10'),
	(22, 7, 4, 20, 'BATCH0123', '2023-01-15', NULL, '2023-06-01'),
	(23, 8, 5, 8, 'BATCH0223', '2023-02-20', NULL, '2023-06-01'),
	(24, 9, 6, 100, 'BATCH0323', '2023-03-01', '2025-03-01', '2023-06-01'),
	(25, 10, 7, 5, 'SN20230401', '2023-04-01', NULL, '2023-06-01'),
	(26, 11, 19, 500, 'BATCH0523', '2023-05-01', NULL, '2023-06-01'),
	(27, 12, 20, 30, 'BATCH0623', '2023-06-01', '2024-06-01', '2023-06-10'),
	(28, 13, 8, 15, 'BATCH0123', '2023-01-10', NULL, '2023-06-01'),
	(29, 14, 9, 10, 'BATCH0223', '2023-02-15', NULL, '2023-06-01'),
	(30, 15, 10, 2, 'SN20230320', '2023-03-20', NULL, '2023-06-01');
/*!40000 ALTER TABLE "inventory" ENABLE KEYS */;

-- Дамп структуры для таблица public.manufacturers
CREATE TABLE IF NOT EXISTS "manufacturers" (
	"manufacturer_id" SERIAL NOT NULL,
	"manufacturer_name" VARCHAR(100) NOT NULL,
	"contact_person" VARCHAR(100) NULL DEFAULT NULL,
	"phone" VARCHAR(20) NULL DEFAULT NULL,
	"email" VARCHAR(100) NULL DEFAULT NULL,
	"address" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("manufacturer_id")
);

-- Дамп данных таблицы public.manufacturers: -1 rows
/*!40000 ALTER TABLE "manufacturers" DISABLE KEYS */;
INSERT INTO "manufacturers" ("manufacturer_id", "manufacturer_name", "contact_person", "phone", "email", "address") VALUES
	(1, 'Samsung', 'Иван Петров', '+79161234567', 'ivan.petrov@samsung.com', 'Южная Корея, Сеул'),
	(2, 'Apple', 'Анна Сидорова', '+79167654321', 'anna.sidorova@apple.com', 'США, Купертино'),
	(3, 'LG', 'Петр Иванов', '+79162345678', 'petr.ivanov@lg.com', 'Южная Корея, Сеул'),
	(4, 'Bosch', 'Мария Смирнова', '+79168765432', 'maria.smirnova@bosch.com', 'Германия, Мюнхен'),
	(5, 'IKEA', 'Алексей Кузнецов', '+79163456789', 'alexey.kuznetsov@ikea.com', 'Швеция, Лейд'),
	(6, 'Nestle', 'Елена Васнецова', '+79169876543', 'elena.vasnetsova@nestle.com', 'Швейцария, Веве'),
	(7, 'Adidas', 'Дмитрий Попов', '+79164567890', 'dmitry.popov@adidas.com', 'Германия, Херцогенаурах'),
	(8, 'Pilot', 'Ольга Новикова', '+79160987654', 'olga.novikova@pilot.com', 'Япония, Токио'),
	(9, 'Leroy Merlin', 'Сергей Федоров', '+79165678901', 'sergey.fedorov@leroymerlin.com', 'Франция, Лилль'),
	(10, 'LEGO', 'Наталья Морозова', '+79160123456', 'natalia.morozova@lego.com', 'Дания, Биллунд');
/*!40000 ALTER TABLE "manufacturers" ENABLE KEYS */;

-- Дамп структуры для таблица public.products
CREATE TABLE IF NOT EXISTS "products" (
	"product_id" SERIAL NOT NULL,
	"product_name" VARCHAR(200) NOT NULL,
	"description" TEXT NULL DEFAULT NULL,
	"type_id" INTEGER NULL DEFAULT NULL,
	"category_id" INTEGER NULL DEFAULT NULL,
	"manufacturer_id" INTEGER NULL DEFAULT NULL,
	"barcode" VARCHAR(50) NULL DEFAULT NULL,
	"weight" NUMERIC(10,3) NULL DEFAULT NULL,
	"volume" NUMERIC(10,3) NULL DEFAULT NULL,
	"unit_of_measure" VARCHAR(20) NULL DEFAULT NULL,
	"created_at" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	"updated_at" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("product_id"),
	UNIQUE "products_barcode_key" ("barcode"),
	CONSTRAINT "products_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "products_manufacturer_id_fkey" FOREIGN KEY ("manufacturer_id") REFERENCES "manufacturers" ("manufacturer_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "products_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "product_types" ("type_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.products: -1 rows
/*!40000 ALTER TABLE "products" DISABLE KEYS */;
INSERT INTO "products" ("product_id", "product_name", "description", "type_id", "category_id", "manufacturer_id", "barcode", "weight", "volume", "unit_of_measure", "created_at", "updated_at") VALUES
	(1, 'Ноутбук Samsung Galaxy Book', '15.6", Intel Core i5, 8GB RAM, 256GB SSD', 1, 3, 1, '8801642578954', 1.800, 0.003, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(2, 'Смартфон Apple iPhone 13', '6.1", 128GB, Midnight', 1, 4, 2, '190199274500', 0.174, 0.000, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(3, 'Телевизор LG OLED', '55", 4K UHD, Smart TV', 1, 5, 3, '8806087141560', 18.500, 0.200, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(4, 'Молоко Простоквашино', 'Молоко 3.2%, 1л', 2, 7, 6, '4607027760057', 1.030, 0.001, 'л', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(5, 'Куриное филе', 'Филе куриное, охлажденное, 1кг', 2, 8, 6, '4601234567890', 1.000, 0.001, 'кг', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(6, 'Картофель', 'Картофель молодой, 1кг', 2, 9, 6, '4609876543210', 1.000, 0.002, 'кг', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(7, 'Футболка Adidas', 'Футболка мужская, хлопок, размер M', 3, 11, 7, '4055344887766', 0.200, 0.001, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(8, 'Офисный стул IKEA', 'Офисный стул с регулировкой высоты', 4, 14, 5, '8027588491287', 8.500, 0.050, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(9, 'Ручка Pilot', 'Шариковая ручка, синяя', 5, 16, 8, '4902505088888', 0.010, 0.000, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(10, 'Дрель Bosch', 'Аккумуляторная дрель-шуруповерт', 6, NULL, 4, '3165140702003', 1.400, 0.003, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(11, 'Кирпич строительный', 'Кирпич керамический, М150, 250х120х65мм', 7, NULL, 9, '4601234567891', 3.500, 0.002, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(12, 'Стиральный порошок', 'Стиральный порошок для цветного белья, 3кг', 8, NULL, 6, '4601234567892', 3.000, 0.003, 'кг', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(13, 'Набор отверток', 'Набор отверток 6 предметов', 9, NULL, 4, '3165140702004', 0.500, 0.001, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(14, 'Конструктор LEGO', 'Конструктор LEGO City, 60200 деталей', 10, NULL, 10, '5702016118888', 1.200, 0.002, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551'),
	(15, 'Кофемашина Bosch', 'Кофемашина автоматическая', 6, NULL, 4, '3165140702005', 9.800, 0.020, 'шт', '2025-06-28 03:59:25.694551', '2025-06-28 03:59:25.694551');
/*!40000 ALTER TABLE "products" ENABLE KEYS */;

-- Дамп структуры для представление public.products_in_stock
-- Создание временной таблицы для обработки ошибок зависимостей представлений
CREATE TABLE "products_in_stock" (
	"product_id" INTEGER NULL,
	"product_name" VARCHAR(200) NULL,
	"type_name" VARCHAR(100) NULL,
	"category_name" VARCHAR(100) NULL,
	"manufacturer_name" VARCHAR(100) NULL,
	"total_quantity" BIGINT NULL,
	"selling_price" NUMERIC(12,2) NULL,
	"total_value" NUMERIC NULL
) ENGINE=MyISAM;

-- Дамп структуры для таблица public.product_movements
CREATE TABLE IF NOT EXISTS "product_movements" (
	"movement_id" SERIAL NOT NULL,
	"product_id" INTEGER NULL DEFAULT NULL,
	"from_cell_id" INTEGER NULL DEFAULT NULL,
	"to_cell_id" INTEGER NULL DEFAULT NULL,
	"quantity" INTEGER NOT NULL,
	"movement_date" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	"employee_id" INTEGER NULL DEFAULT NULL,
	"reason" VARCHAR(200) NULL DEFAULT NULL,
	PRIMARY KEY ("movement_id"),
	CONSTRAINT "product_movements_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employees" ("employee_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "product_movements_from_cell_id_fkey" FOREIGN KEY ("from_cell_id") REFERENCES "storage_cells" ("cell_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "product_movements_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "product_movements_to_cell_id_fkey" FOREIGN KEY ("to_cell_id") REFERENCES "storage_cells" ("cell_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.product_movements: -1 rows
/*!40000 ALTER TABLE "product_movements" DISABLE KEYS */;
INSERT INTO "product_movements" ("movement_id", "product_id", "from_cell_id", "to_cell_id", "quantity", "movement_date", "employee_id", "reason") VALUES
	(1, 1, 1, 11, 2, '2023-01-20 10:15:00', 2, 'Перемещение между ячейками'),
	(2, 2, 3, 12, 5, '2023-01-21 11:30:00', 3, 'Инвентаризация'),
	(3, 3, 5, 15, 1, '2023-01-22 14:45:00', 2, 'Подготовка к отгрузке');
/*!40000 ALTER TABLE "product_movements" ENABLE KEYS */;

-- Дамп структуры для таблица public.product_prices
CREATE TABLE IF NOT EXISTS "product_prices" (
	"price_id" SERIAL NOT NULL,
	"product_id" INTEGER NULL DEFAULT NULL,
	"purchase_price" NUMERIC(12,2) NULL DEFAULT NULL,
	"selling_price" NUMERIC(12,2) NULL DEFAULT NULL,
	"start_date" DATE NULL DEFAULT CURRENT_DATE,
	"end_date" DATE NULL DEFAULT NULL,
	"is_current" BOOLEAN NULL DEFAULT true,
	PRIMARY KEY ("price_id"),
	CONSTRAINT "product_prices_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.product_prices: -1 rows
/*!40000 ALTER TABLE "product_prices" DISABLE KEYS */;
INSERT INTO "product_prices" ("price_id", "product_id", "purchase_price", "selling_price", "start_date", "end_date", "is_current") VALUES
	(1, 1, 55000.00, 69990.00, '2023-01-01', NULL, 'true'),
	(2, 2, 65000.00, 79990.00, '2023-01-01', NULL, 'true'),
	(3, 3, 70000.00, 89990.00, '2023-01-01', NULL, 'true'),
	(4, 4, 50.00, 89.90, '2023-01-01', NULL, 'true'),
	(5, 5, 250.00, 399.90, '2023-01-01', NULL, 'true'),
	(6, 6, 30.00, 59.90, '2023-01-01', NULL, 'true'),
	(7, 7, 1200.00, 1999.90, '2023-01-01', NULL, 'true'),
	(8, 8, 4000.00, 5990.00, '2023-01-01', NULL, 'true'),
	(9, 9, 25.00, 49.90, '2023-01-01', NULL, 'true'),
	(10, 10, 4500.00, 6990.00, '2023-01-01', NULL, 'true'),
	(11, 11, 15.00, 29.90, '2023-01-01', NULL, 'true'),
	(12, 12, 200.00, 349.90, '2023-01-01', NULL, 'true'),
	(13, 13, 350.00, 599.90, '2023-01-01', NULL, 'true'),
	(14, 14, 2500.00, 3990.00, '2023-01-01', NULL, 'true'),
	(15, 15, 35000.00, 45990.00, '2023-01-01', NULL, 'true');
/*!40000 ALTER TABLE "product_prices" ENABLE KEYS */;

-- Дамп структуры для таблица public.product_types
CREATE TABLE IF NOT EXISTS "product_types" (
	"type_id" SERIAL NOT NULL,
	"type_name" VARCHAR(100) NOT NULL,
	"description" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("type_id")
);

-- Дамп данных таблицы public.product_types: -1 rows
/*!40000 ALTER TABLE "product_types" DISABLE KEYS */;
INSERT INTO "product_types" ("type_id", "type_name", "description") VALUES
	(1, 'Электроника', 'Электронные устройства и компоненты'),
	(2, 'Продукты питания', 'Пищевые продукты и напитки'),
	(3, 'Одежда', 'Одежда и аксессуары'),
	(4, 'Мебель', 'Мебель для дома и офиса'),
	(5, 'Канцелярия', 'Канцелярские товары'),
	(6, 'Бытовая техника', 'Техника для дома'),
	(7, 'Строительные материалы', 'Материалы для строительства и ремонта'),
	(8, 'Химия', 'Бытовая химия и средства гигиены'),
	(9, 'Инструменты', 'Ручные и электроинструменты'),
	(10, 'Игрушки', 'Детские игрушки и игры');
/*!40000 ALTER TABLE "product_types" ENABLE KEYS */;

-- Дамп структуры для таблица public.racks
CREATE TABLE IF NOT EXISTS "racks" (
	"rack_id" SERIAL NOT NULL,
	"zone_id" INTEGER NULL DEFAULT NULL,
	"rack_code" VARCHAR(20) NOT NULL,
	"levels_count" INTEGER NULL DEFAULT NULL,
	"capacity_per_level" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("rack_id"),
	CONSTRAINT "racks_zone_id_fkey" FOREIGN KEY ("zone_id") REFERENCES "storage_zones" ("zone_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.racks: -1 rows
/*!40000 ALTER TABLE "racks" DISABLE KEYS */;
INSERT INTO "racks" ("rack_id", "zone_id", "rack_code", "levels_count", "capacity_per_level") VALUES
	(1, 1, 'A-01', 5, 20),
	(2, 1, 'A-02', 5, 20),
	(3, 1, 'A-03', 5, 20),
	(4, 2, 'B-01', 4, 15),
	(5, 2, 'B-02', 4, 15),
	(6, 3, 'C-01', 3, 10),
	(7, 3, 'C-02', 3, 10),
	(8, 4, 'D-01', 5, 20),
	(9, 4, 'D-02', 5, 20),
	(10, 5, 'E-01', 4, 15),
	(11, 5, 'E-02', 4, 15),
	(12, 6, 'F-01', 5, 20),
	(13, 6, 'F-02', 5, 20),
	(14, 7, 'G-01', 4, 15),
	(15, 7, 'G-02', 4, 15),
	(16, 8, 'H-01', 5, 20),
	(17, 8, 'H-02', 5, 20),
	(18, 9, 'I-01', 3, 10),
	(19, 9, 'I-02', 3, 10),
	(20, 10, 'J-01', 4, 15),
	(21, 10, 'J-02', 4, 15);
/*!40000 ALTER TABLE "racks" ENABLE KEYS */;

-- Дамп структуры для таблица public.storage_cells
CREATE TABLE IF NOT EXISTS "storage_cells" (
	"cell_id" SERIAL NOT NULL,
	"rack_id" INTEGER NULL DEFAULT NULL,
	"cell_code" VARCHAR(20) NOT NULL,
	"level_number" INTEGER NULL DEFAULT NULL,
	"max_weight" NUMERIC(10,2) NULL DEFAULT NULL,
	"max_volume" NUMERIC(10,2) NULL DEFAULT NULL,
	PRIMARY KEY ("cell_id"),
	CONSTRAINT "storage_cells_rack_id_fkey" FOREIGN KEY ("rack_id") REFERENCES "racks" ("rack_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.storage_cells: 89 rows
/*!40000 ALTER TABLE "storage_cells" DISABLE KEYS */;
INSERT INTO "storage_cells" ("cell_id", "rack_id", "cell_code", "level_number", "max_weight", "max_volume") VALUES
	(1, 1, 'A-01-1', 1, 50.00, 0.10),
	(2, 1, 'A-01-2', 2, 50.00, 0.10),
	(3, 1, 'A-01-3', 3, 50.00, 0.10),
	(4, 1, 'A-01-4', 4, 50.00, 0.10),
	(5, 1, 'A-01-5', 5, 50.00, 0.10),
	(6, 2, 'A-02-1', 1, 50.00, 0.10),
	(7, 2, 'A-02-2', 2, 50.00, 0.10),
	(8, 2, 'A-02-3', 3, 50.00, 0.10),
	(9, 2, 'A-02-4', 4, 50.00, 0.10),
	(10, 2, 'A-02-5', 5, 50.00, 0.10),
	(11, 3, 'A-03-1', 1, 50.00, 0.10),
	(12, 3, 'A-03-2', 2, 50.00, 0.10),
	(13, 3, 'A-03-3', 3, 50.00, 0.10),
	(14, 3, 'A-03-4', 4, 50.00, 0.10),
	(15, 3, 'A-03-5', 5, 50.00, 0.10),
	(16, 4, 'B-01-1', 1, 40.00, 0.08),
	(17, 4, 'B-01-2', 2, 40.00, 0.08),
	(18, 4, 'B-01-3', 3, 40.00, 0.08),
	(19, 4, 'B-01-4', 4, 40.00, 0.08),
	(20, 5, 'B-02-1', 1, 40.00, 0.08),
	(21, 5, 'B-02-2', 2, 40.00, 0.08),
	(22, 5, 'B-02-3', 3, 40.00, 0.08),
	(23, 5, 'B-02-4', 4, 40.00, 0.08),
	(24, 6, 'C-01-1', 1, 30.00, 0.05),
	(25, 6, 'C-01-2', 2, 30.00, 0.05),
	(26, 6, 'C-01-3', 3, 30.00, 0.05),
	(27, 7, 'C-02-1', 1, 30.00, 0.05),
	(28, 7, 'C-02-2', 2, 30.00, 0.05),
	(29, 7, 'C-02-3', 3, 30.00, 0.05),
	(30, 8, 'D-01-1', 1, 50.00, 0.10),
	(31, 8, 'D-01-2', 2, 50.00, 0.10),
	(32, 8, 'D-01-3', 3, 50.00, 0.10),
	(33, 8, 'D-01-4', 4, 50.00, 0.10),
	(34, 8, 'D-01-5', 5, 50.00, 0.10),
	(35, 9, 'D-02-1', 1, 50.00, 0.10),
	(36, 9, 'D-02-2', 2, 50.00, 0.10),
	(37, 9, 'D-02-3', 3, 50.00, 0.10),
	(38, 9, 'D-02-4', 4, 50.00, 0.10),
	(39, 9, 'D-02-5', 5, 50.00, 0.10),
	(40, 10, 'E-01-1', 1, 40.00, 0.08),
	(41, 10, 'E-01-2', 2, 40.00, 0.08),
	(42, 10, 'E-01-3', 3, 40.00, 0.08),
	(43, 10, 'E-01-4', 4, 40.00, 0.08),
	(44, 11, 'E-02-1', 1, 40.00, 0.08),
	(45, 11, 'E-02-2', 2, 40.00, 0.08),
	(46, 11, 'E-02-3', 3, 40.00, 0.08),
	(47, 11, 'E-02-4', 4, 40.00, 0.08),
	(48, 12, 'F-01-1', 1, 50.00, 0.10),
	(49, 12, 'F-01-2', 2, 50.00, 0.10),
	(50, 12, 'F-01-3', 3, 50.00, 0.10),
	(51, 12, 'F-01-4', 4, 50.00, 0.10),
	(52, 12, 'F-01-5', 5, 50.00, 0.10),
	(53, 13, 'F-02-1', 1, 50.00, 0.10),
	(54, 13, 'F-02-2', 2, 50.00, 0.10),
	(55, 13, 'F-02-3', 3, 50.00, 0.10),
	(56, 13, 'F-02-4', 4, 50.00, 0.10),
	(57, 13, 'F-02-5', 5, 50.00, 0.10),
	(58, 14, 'G-01-1', 1, 40.00, 0.08),
	(59, 14, 'G-01-2', 2, 40.00, 0.08),
	(60, 14, 'G-01-3', 3, 40.00, 0.08),
	(61, 14, 'G-01-4', 4, 40.00, 0.08),
	(62, 15, 'G-02-1', 1, 40.00, 0.08),
	(63, 15, 'G-02-2', 2, 40.00, 0.08),
	(64, 15, 'G-02-3', 3, 40.00, 0.08),
	(65, 15, 'G-02-4', 4, 40.00, 0.08),
	(66, 16, 'H-01-1', 1, 50.00, 0.10),
	(67, 16, 'H-01-2', 2, 50.00, 0.10),
	(68, 16, 'H-01-3', 3, 50.00, 0.10),
	(69, 16, 'H-01-4', 4, 50.00, 0.10),
	(70, 16, 'H-01-5', 5, 50.00, 0.10),
	(71, 17, 'H-02-1', 1, 50.00, 0.10),
	(72, 17, 'H-02-2', 2, 50.00, 0.10),
	(73, 17, 'H-02-3', 3, 50.00, 0.10),
	(74, 17, 'H-02-4', 4, 50.00, 0.10),
	(75, 17, 'H-02-5', 5, 50.00, 0.10),
	(76, 18, 'I-01-1', 1, 30.00, 0.05),
	(77, 18, 'I-01-2', 2, 30.00, 0.05),
	(78, 18, 'I-01-3', 3, 30.00, 0.05),
	(79, 19, 'I-02-1', 1, 30.00, 0.05),
	(80, 19, 'I-02-2', 2, 30.00, 0.05),
	(81, 19, 'I-02-3', 3, 30.00, 0.05),
	(82, 20, 'J-01-1', 1, 40.00, 0.08),
	(83, 20, 'J-01-2', 2, 40.00, 0.08),
	(84, 20, 'J-01-3', 3, 40.00, 0.08),
	(85, 20, 'J-01-4', 4, 40.00, 0.08),
	(86, 21, 'J-02-1', 1, 40.00, 0.08),
	(87, 21, 'J-02-2', 2, 40.00, 0.08),
	(88, 21, 'J-02-3', 3, 40.00, 0.08),
	(89, 21, 'J-02-4', 4, 40.00, 0.08);
/*!40000 ALTER TABLE "storage_cells" ENABLE KEYS */;

-- Дамп структуры для таблица public.storage_zones
CREATE TABLE IF NOT EXISTS "storage_zones" (
	"zone_id" SERIAL NOT NULL,
	"warehouse_id" INTEGER NULL DEFAULT NULL,
	"zone_name" VARCHAR(100) NOT NULL,
	"temperature_conditions" VARCHAR(50) NULL DEFAULT NULL,
	"humidity_conditions" VARCHAR(50) NULL DEFAULT NULL,
	"capacity" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("zone_id"),
	CONSTRAINT "storage_zones_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "warehouses" ("warehouse_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.storage_zones: -1 rows
/*!40000 ALTER TABLE "storage_zones" DISABLE KEYS */;
INSERT INTO "storage_zones" ("zone_id", "warehouse_id", "zone_name", "temperature_conditions", "humidity_conditions", "capacity") VALUES
	(1, 1, 'Зона А', '18-22°C', '40-60%', 1000),
	(2, 1, 'Зона B', '10-15°C', '30-50%', 800),
	(3, 1, 'Холодильная зона', '2-6°C', NULL, 500),
	(4, 2, 'Основная зона', '18-22°C', '40-60%', 700),
	(5, 2, 'Хрупкие товары', '18-22°C', '30-50%', 300),
	(6, 3, 'Зона 1', '18-22°C', '40-60%', 600),
	(7, 3, 'Зона 2', '10-15°C', '30-50%', 400),
	(8, 4, 'Основное хранение', '18-22°C', '40-60%', 900),
	(9, 4, 'Опасные материалы', '10-15°C', '30-50%', 200),
	(10, 5, 'Общая зона', '18-22°C', '40-60%', 500);
/*!40000 ALTER TABLE "storage_zones" ENABLE KEYS */;

-- Дамп структуры для таблица public.suppliers
CREATE TABLE IF NOT EXISTS "suppliers" (
	"supplier_id" SERIAL NOT NULL,
	"supplier_name" VARCHAR(100) NOT NULL,
	"contact_person" VARCHAR(100) NULL DEFAULT NULL,
	"phone" VARCHAR(20) NULL DEFAULT NULL,
	"email" VARCHAR(100) NULL DEFAULT NULL,
	"address" TEXT NULL DEFAULT NULL,
	"rating" NUMERIC(3,2) NULL DEFAULT NULL,
	PRIMARY KEY ("supplier_id")
);

-- Дамп данных таблицы public.suppliers: -1 rows
/*!40000 ALTER TABLE "suppliers" DISABLE KEYS */;
INSERT INTO "suppliers" ("supplier_id", "supplier_name", "contact_person", "phone", "email", "address", "rating") VALUES
	(1, 'Электросити', 'Андрей Соколов', '+79161234567', 'andrey.sokolov@electrocity.ru', 'Москва, ул. Ленина, 1', 4.80),
	(2, 'Мир продуктов', 'Татьяна Иванова', '+79167654321', 'tatyana.ivanova@mirproduktov.ru', 'Санкт-Петербург, Невский пр., 10', 4.50),
	(3, 'ОфисМаркет', 'Игорь Николаев', '+79162345678', 'igor.nikolaev@officemarket.ru', 'Екатеринбург, ул. Малышева, 5', 4.20),
	(4, 'ТехноПарк', 'Евгения Петрова', '+79168765432', 'evgenia.petrova@technopark.ru', 'Новосибирск, Красный пр., 20', 4.70),
	(5, 'МебельХолл', 'Артем Васильев', '+79163456789', 'artem.vasiliev@mebelhall.ru', 'Казань, ул. Баумана, 15', 4.30),
	(6, 'ПродуктТрейд', 'Светлана Козлова', '+79169876543', 'svetlana.kozlova@producttrade.ru', 'Ростов-на-Дону, ул. Большая Садовая, 30', 4.10),
	(7, 'СпортМастер', 'Виктор Морозов', '+79164567890', 'viktor.morozov@sportmaster.ru', 'Москва, ул. Тверская, 25', 4.60),
	(8, 'КанцОпт', 'Алина Семенова', '+79160987654', 'alina.semenova@kanzopt.ru', 'Санкт-Петербург, Лиговский пр., 50', 4.00),
	(9, 'СтройЛандия', 'Павел Григорьев', '+79165678901', 'pavel.grigoriev@stroilandia.ru', 'Краснодар, ул. Красная, 100', 4.40),
	(10, 'ИгрушкиОпт', 'Юлия Воронцова', '+79160123456', 'yulia.vorontsova@igrushkiopt.ru', 'Владивосток, ул. Светланская, 10', 4.90);
/*!40000 ALTER TABLE "suppliers" ENABLE KEYS */;

-- Дамп структуры для представление public.supplier_orders_view
-- Создание временной таблицы для обработки ошибок зависимостей представлений
CREATE TABLE "supplier_orders_view" (
	"order_id" INTEGER NULL,
	"supplier_name" VARCHAR(100) NULL,
	"order_date" DATE NULL,
	"expected_delivery_date" DATE NULL,
	"status" VARCHAR(50) NULL,
	"total_amount" NUMERIC(12,2) NULL,
	"manager_name" TEXT NULL,
	"items_count" BIGINT NULL
) ENGINE=MyISAM;

-- Дамп структуры для таблица public.supply_orders
CREATE TABLE IF NOT EXISTS "supply_orders" (
	"order_id" SERIAL NOT NULL,
	"supplier_id" INTEGER NULL DEFAULT NULL,
	"order_date" DATE NULL DEFAULT CURRENT_DATE,
	"expected_delivery_date" DATE NULL DEFAULT NULL,
	"status" VARCHAR(50) NULL DEFAULT 'Создан',
	"total_amount" NUMERIC(12,2) NULL DEFAULT NULL,
	"manager_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("order_id"),
	CONSTRAINT "supply_orders_manager_id_fkey" FOREIGN KEY ("manager_id") REFERENCES "employees" ("employee_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "supply_orders_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "suppliers" ("supplier_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.supply_orders: -1 rows
/*!40000 ALTER TABLE "supply_orders" DISABLE KEYS */;
INSERT INTO "supply_orders" ("order_id", "supplier_id", "order_date", "expected_delivery_date", "status", "total_amount", "manager_id") VALUES
	(1, 1, '2023-01-10', '2023-01-15', 'Доставлен', 350000.00, 1),
	(2, 2, '2023-02-05', '2023-02-10', 'Доставлен', 15000.00, 1),
	(3, 3, '2023-03-12', '2023-03-18', 'Доставлен', 50000.00, 4),
	(4, 4, '2023-04-20', '2023-04-25', 'Доставлен', 280000.00, 4),
	(5, 5, '2023-05-15', '2023-05-20', 'В пути', 120000.00, 7),
	(6, 6, '2023-06-01', '2023-06-08', 'Обработка', 30000.00, 7),
	(7, 7, '2023-06-10', '2023-06-17', 'Создан', 45000.00, 10),
	(8, 8, '2023-06-15', '2023-06-22', 'Создан', 25000.00, 10),
	(9, 1, '2023-06-20', '2023-06-27', 'Создан', 180000.00, 13),
	(10, 2, '2023-06-25', '2023-07-02', 'Создан', 20000.00, 13);
/*!40000 ALTER TABLE "supply_orders" ENABLE KEYS */;

-- Дамп структуры для таблица public.supply_order_items
CREATE TABLE IF NOT EXISTS "supply_order_items" (
	"order_item_id" SERIAL NOT NULL,
	"order_id" INTEGER NULL DEFAULT NULL,
	"product_id" INTEGER NULL DEFAULT NULL,
	"quantity" INTEGER NOT NULL,
	"unit_price" NUMERIC(12,2) NOT NULL,
	"received_quantity" INTEGER NULL DEFAULT 0,
	PRIMARY KEY ("order_item_id"),
	CONSTRAINT "supply_order_items_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "supply_orders" ("order_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "supply_order_items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.supply_order_items: -1 rows
/*!40000 ALTER TABLE "supply_order_items" DISABLE KEYS */;
INSERT INTO "supply_order_items" ("order_item_id", "order_id", "product_id", "quantity", "unit_price", "received_quantity") VALUES
	(1, 1, 1, 5, 55000.00, 5),
	(2, 1, 2, 3, 65000.00, 3),
	(3, 1, 3, 2, 70000.00, 2),
	(4, 2, 4, 100, 50.00, 100),
	(5, 2, 5, 30, 250.00, 30),
	(6, 2, 6, 50, 30.00, 50),
	(7, 3, 7, 20, 1200.00, 20),
	(8, 3, 8, 5, 4000.00, 5),
	(9, 3, 9, 50, 25.00, 50),
	(10, 4, 10, 10, 4500.00, 10),
	(11, 4, 11, 200, 15.00, 200),
	(12, 4, 12, 20, 200.00, 20),
	(13, 5, 13, 15, 350.00, 0),
	(14, 5, 14, 10, 2500.00, 0),
	(15, 5, 15, 2, 35000.00, 0),
	(16, 6, 4, 50, 50.00, 0),
	(17, 6, 5, 20, 250.00, 0),
	(18, 6, 6, 30, 30.00, 0),
	(19, 7, 7, 10, 1200.00, 0),
	(20, 7, 8, 3, 4000.00, 0),
	(21, 8, 9, 100, 25.00, 0),
	(22, 8, 10, 2, 4500.00, 0),
	(23, 9, 1, 3, 55000.00, 0),
	(24, 9, 2, 2, 65000.00, 0),
	(25, 10, 4, 80, 50.00, 0),
	(26, 10, 5, 25, 250.00, 0),
	(27, 10, 6, 40, 30.00, 0);
/*!40000 ALTER TABLE "supply_order_items" ENABLE KEYS */;

-- Дамп структуры для таблица public.warehouses
CREATE TABLE IF NOT EXISTS "warehouses" (
	"warehouse_id" SERIAL NOT NULL,
	"warehouse_name" VARCHAR(100) NOT NULL,
	"address" TEXT NOT NULL,
	"total_area" NUMERIC(10,2) NULL DEFAULT NULL,
	"usable_area" NUMERIC(10,2) NULL DEFAULT NULL,
	"manager_id" INTEGER NULL DEFAULT NULL,
	"phone" VARCHAR(20) NULL DEFAULT NULL,
	PRIMARY KEY ("warehouse_id")
);

-- Дамп данных таблицы public.warehouses: -1 rows
/*!40000 ALTER TABLE "warehouses" DISABLE KEYS */;
INSERT INTO "warehouses" ("warehouse_id", "warehouse_name", "address", "total_area", "usable_area", "manager_id", "phone") VALUES
	(1, 'Центральный склад', 'Москва, ул. Промышленная, 1', 5000.00, 4500.00, NULL, '+74951234567'),
	(2, 'Северный склад', 'Санкт-Петербург, пр. Энтузиастов, 10', 3000.00, 2700.00, NULL, '+78127654321'),
	(3, 'Южный склад', 'Ростов-на-Дону, ул. Заводская, 5', 2500.00, 2200.00, NULL, '+78632345678'),
	(4, 'Восточный склад', 'Екатеринбург, ул. Машиностроителей, 15', 3500.00, 3150.00, NULL, '+73436765432'),
	(5, 'Западный склад', 'Калининград, ул. Портова, 20', 2000.00, 1800.00, NULL, '+74015678901');
/*!40000 ALTER TABLE "warehouses" ENABLE KEYS */;

-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS "expired_products";
CREATE VIEW "expired_products" AS  SELECT i.inventory_id,
    p.product_name,
    p.barcode,
    i.quantity,
    i.production_date,
    i.expiry_date,
    w.warehouse_name,
    sz.zone_name,
    sc.cell_code,
    (i.expiry_date - CURRENT_DATE) AS days_until_expiry
   FROM (((((inventory i
     JOIN products p ON ((i.product_id = p.product_id)))
     JOIN storage_cells sc ON ((i.cell_id = sc.cell_id)))
     JOIN racks r ON ((sc.rack_id = r.rack_id)))
     JOIN storage_zones sz ON ((r.zone_id = sz.zone_id)))
     JOIN warehouses w ON ((sz.warehouse_id = w.warehouse_id)))
  WHERE (i.expiry_date < CURRENT_DATE);;

-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS "products_in_stock";
CREATE VIEW "products_in_stock" AS  SELECT p.product_id,
    p.product_name,
    pt.type_name,
    c.category_name,
    m.manufacturer_name,
    sum(i.quantity) AS total_quantity,
    pp.selling_price,
    ((sum(i.quantity))::numeric * pp.selling_price) AS total_value
   FROM (((((products p
     JOIN product_types pt ON ((p.type_id = pt.type_id)))
     JOIN categories c ON ((p.category_id = c.category_id)))
     JOIN manufacturers m ON ((p.manufacturer_id = m.manufacturer_id)))
     JOIN inventory i ON ((p.product_id = i.product_id)))
     JOIN product_prices pp ON (((p.product_id = pp.product_id) AND (pp.is_current = true))))
  GROUP BY p.product_id, p.product_name, pt.type_name, c.category_name, m.manufacturer_name, pp.selling_price;;

-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS "supplier_orders_view";
CREATE VIEW "supplier_orders_view" AS  SELECT so.order_id,
    s.supplier_name,
    so.order_date,
    so.expected_delivery_date,
    so.status,
    so.total_amount,
    (((e.first_name)::text || ' '::text) || (e.last_name)::text) AS manager_name,
    count(soi.order_item_id) AS items_count
   FROM (((supply_orders so
     JOIN suppliers s ON ((so.supplier_id = s.supplier_id)))
     JOIN employees e ON ((so.manager_id = e.employee_id)))
     LEFT JOIN supply_order_items soi ON ((so.order_id = soi.order_id)))
  GROUP BY so.order_id, s.supplier_name, e.first_name, e.last_name;;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
