-- Лабораторна робота 5. Комплексна бізнес-транзакція "Оформлення замовлення"
-- База даних: aesthetic_stationery
-- До виконання: stock_quantity товару id = 1 (Midori MD Notebook A5) = 18

START TRANSACTION;

-- КРОК 1: створюємо замовлення для користувача з id = 1
INSERT INTO `Orders` (`user_id`, `status`)
VALUES (1, 'pending');

-- зберігаємо id щойно створеного замовлення
SET @new_order_id = LAST_INSERT_ID();

-- КРОК 2: додаємо в замовлення товар id = 1, 2 шт. за поточною ціною товару
INSERT INTO `Order_Items` (`order_id`, `product_id`, `quantity`, `price_at_purchase`)
VALUES (@new_order_id, 1, 2, (SELECT `price` FROM `Products` WHERE `id` = 1));

-- КРОК 3: списуємо 2 одиниці товару id = 1 зі складу
UPDATE `Products`
SET `stock_quantity` = `stock_quantity` - 2
WHERE `id` = 1;

-- якщо всі кроки пройшли без помилок — зберігаємо зміни разом
COMMIT;

-- Перевірка результату
SELECT * FROM `Orders` ORDER BY `id` DESC LIMIT 1;
SELECT * FROM `Order_Items` WHERE `order_id` = (SELECT MAX(`id`) FROM `Orders`);
SELECT `id`, `name`, `stock_quantity` FROM `Products` WHERE `id` = 1;
