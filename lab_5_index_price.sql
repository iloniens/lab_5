-- Лабораторна робота 5. Аналіз та оптимізація запиту
-- База даних: aesthetic_stationery

-- 1. План "ДО": індексу на price немає
EXPLAIN SELECT * FROM `Products` WHERE `price` = 380.00;

-- 2. Створюємо індекс для колонки price
CREATE INDEX `idx_products_price` ON `Products` (`price`);

-- 3. План "ПІСЛЯ": той самий запит
EXPLAIN SELECT * FROM `Products` WHERE `price` = 380.00;
