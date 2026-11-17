# Аналіз плану виконання запиту (EXPLAIN)

Запит:

```sql
SELECT * FROM `Products` WHERE `price` = 380.00;
```

## План «ДО» створення індексу

| id | select_type | table | type | possible_keys | key | key_len | ref | rows | Extra |
|----|-------------|-------|------|---------------|-----|---------|-----|------|-------|
| 1 | SIMPLE | Products | ALL | NULL | NULL | NULL | NULL | 13 | Using where |

## Створення індексу

```sql
CREATE INDEX `idx_products_price` ON `Products` (`price`);
```

## План «ПІСЛЯ» створення індексу

| id | select_type | table | type | possible_keys | key | key_len | ref | rows | Extra |
|----|-------------|-------|------|---------------|-----|---------|-----|------|-------|
| 1 | SIMPLE | Products | ref | idx_products_price | idx_products_price | 5 | const | 1 | ___ |

## Висновок

До створення індексу `type = ALL`: СКБД виконувала повне сканування таблиці
(Full Table Scan) і перевіряла всі 13 рядків таблиці (`rows = 13`).

Після створення індексу `idx_products_price` `type = ref`, а в колонках
`possible_keys` і `key` вказано цей індекс. Планувальник знаходить рядки з
потрібною ціною через індекс (`ref = const` — порівняння з константою 380.00),
тому оцінка кількості рядків для перевірки зменшилася з 13 до 1.
На великих таблицях це суттєво пришвидшує пошук.
