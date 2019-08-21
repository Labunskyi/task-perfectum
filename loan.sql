-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 07 2019 г., 17:13
-- Версия сервера: 10.1.37-MariaDB
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `loan`
--

-- --------------------------------------------------------

--
-- Структура таблицы `loan`
--

CREATE TABLE `loan` (
  `id` int(5) NOT NULL,
  `id_creditor` int(5) NOT NULL,
  `debit` float DEFAULT NULL,
  `date` timestamp(5) NOT NULL DEFAULT CURRENT_TIMESTAMP(5) ON UPDATE CURRENT_TIMESTAMP(5),
  `id_debtor` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `loan`
--

INSERT INTO `loan` (`id`, `id_creditor`, `debit`, `date`, `id_debtor`) VALUES
(1, 1, 5000, '2019-08-07 10:18:12.37165', 2),
(2, 1, 5000, '2019-08-07 10:21:51.15396', 2),
(3, 1, 10000, '2019-08-07 10:32:30.34852', 3),
(7, 2, 5000, '2019-08-07 10:46:47.56355', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `loan_creditors`
--

CREATE TABLE `loan_creditors` (
  `id_creditor` int(5) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `loan_creditors`
--

INSERT INTO `loan_creditors` (`id_creditor`, `username`) VALUES
(1, 'Vova'),
(2, 'Vasya');

-- --------------------------------------------------------

--
-- Структура таблицы `loan_debtors`
--

CREATE TABLE `loan_debtors` (
  `id_debtor` int(5) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `loan_debtors`
--

INSERT INTO `loan_debtors` (`id_debtor`, `username`) VALUES
(1, 'Petya'),
(2, 'Vova'),
(3, 'Jony');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_creditor` (`id_creditor`),
  ADD KEY `id_debtor` (`id_debtor`);

--
-- Индексы таблицы `loan_creditors`
--
ALTER TABLE `loan_creditors`
  ADD PRIMARY KEY (`id_creditor`),
  ADD KEY `id_creditor` (`id_creditor`);

--
-- Индексы таблицы `loan_debtors`
--
ALTER TABLE `loan_debtors`
  ADD PRIMARY KEY (`id_debtor`),
  ADD UNIQUE KEY `id_debtor` (`id_debtor`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `loan_creditors`
--
ALTER TABLE `loan_creditors`
  MODIFY `id_creditor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `loan_debtors`
--
ALTER TABLE `loan_debtors`
  MODIFY `id_debtor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`id_creditor`) REFERENCES `loan_creditors` (`id_creditor`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`id_debtor`) REFERENCES `loan_debtors` (`id_debtor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/* 
2) INSERT INTO `loan` (`debit`, `id_creditor`, `id_debtor`) VALUES ('5000.00', '1', '2'); 
3) SELECT SUM(`debit`) FROM `loan` WHERE `id_debtor` = 2 AND `id_creditor` = 1;
4) SELECT OUTPUT.sum - INPUT.sum AS Balance 
FROM (SELECT SUM(debit) sum 
    FROM loan 
    WHERE id_creditor=2) OUTPUT, 
    (SELECT SUM(debit) sum 
    FROM loan 
    WHERE id_debtor=2) INPUT;
5) SELECT SUM(`debit`), `id_debtor` FROM `loan` WHERE `id_creditor` = 1 GROUP BY `id_debtor`;
*/