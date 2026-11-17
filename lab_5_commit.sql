-- Лабораторна робота 5. Демонстрація COMMIT
-- База даних: aesthetic_stationery
-- 1. Дивимося на ціну "ДО" (було 410.00)
SELECT * FROM `Products` WHERE `id` = 11;

-- 2. Починаємо транзакцію
START TRANSACTION;

-- 3. Виконуємо DML-операцію
UPDATE `Products`
SET `price` = 420.00 -- нова ціна
WHERE `id` = 11;

-- 4. Завершуємо транзакцію та зберігаємо зміни
COMMIT;

-- 5. Дивимося на ціну "ПІСЛЯ"
SELECT * FROM `Products` WHERE `id` = 11;
