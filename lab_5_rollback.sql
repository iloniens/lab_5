-- Лабораторна робота 5. Демонстрація ROLLBACK
-- База даних: aesthetic_stationery
-- 1. Дивимося на ціну "ДО" (було 95.00)
SELECT * FROM `Products` WHERE `id` = 6;

-- 2. Починаємо транзакцію
START TRANSACTION;

-- 3. Виконуємо DML-операцію, яку потім скасуємо
UPDATE `Products`
SET `price` = 999.00
WHERE `id` = 6;

-- 4. Ціна змінилася (лише всередині транзакції)
SELECT * FROM `Products` WHERE `id` = 6;

-- 5. Скасовуємо всі зміни
ROLLBACK;

-- 6. Дивимося на ціну "ПІСЛЯ" — знову 95.00
SELECT * FROM `Products` WHERE `id` = 6;
