# task-perfectum

Задание 1.

В файле sort.php находится массив, его нужно отсортировать по такому
алгоритму:
- по возрастанию в алфавитном порядке по значению[0];
- если значения[0] одинаковы, то по возрастанию по сумме значения[1] и
значения[2].
Например, если исходный массив такой:
g, 6, 3
f, 8, 6
a, 5, 3
f, 2, 5
то должен получиться такой массив:
a, 5, 3
f, 2, 5
f, 8, 6
g, 6, 3

Задание 2.

Представим, что есть несколько человек, которые постоянно дают/возвращают
деньги друг-другу в долг. Нужно продумать структуру базы данных для учета их
взаиморасчетов и написать несколько примеров запросов, которые часто будут
использоваться:
1. запрос на создание всех таблиц в вашей бд
2. запрос на добавление записи о факте займа
3. узнать, сколько Человек 1 должен Человеку 2
4. узнать баланс Человека 1 с учетом всех займов
5. узнать кто и сколько должен Человеку 1
Также можете добавить какие-то примеры запросов от себя.
Достаточно просто показать структуру базы данных и SQL-запросы, переносить
это на PHP не нужно.
