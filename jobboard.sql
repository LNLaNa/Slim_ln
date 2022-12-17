-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 16 2022 г., 11:56
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `jobboard`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Name'),
(2, 'Name1'),
(3, 'cat3'),
(4, 'asdasd'),
(5, 'asdaasdasdasd'),
(6, '213213'),
(7, '1'),
(8, '2'),
(9, '3'),
(10, '5');

-- --------------------------------------------------------

--
-- Структура таблицы `experiences`
--

CREATE TABLE `experiences` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `experiences`
--

INSERT INTO `experiences` (`id`, `name`) VALUES
(1, 'ex1'),
(2, 'ex2');

-- --------------------------------------------------------

--
-- Структура таблицы `firms`
--

CREATE TABLE `firms` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `firms`
--

INSERT INTO `firms` (`id`, `name`, `src`) VALUES
(1, 'Word', 'img/svg_icon/5.svg'),
(2, 'Exel', 'img/svg_icon/4.svg'),
(3, 'PowerPoint', 'img/svg_icon/3.svg'),
(4, 'Access', 'img/svg_icon/1.svg');

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'male'),
(2, 'female');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `Salary` int NOT NULL,
  `text` text NOT NULL,
  `id_categories` int NOT NULL,
  `id_gender` int NOT NULL,
  `id_experiences` int NOT NULL,
  `id_job_types` int NOT NULL,
  `id_qualifications` int NOT NULL,
  `id_locations` int NOT NULL,
  `id_firm` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `Salary`, `text`, `id_categories`, `id_gender`, `id_experiences`, `id_job_types`, `id_qualifications`, `id_locations`, `id_firm`, `date`, `description`) VALUES
(1, 'a', 12, 'asd', 1, 2, 1, 2, 1, 1, 1, '2022-12-12', 'asdasdasdasdasdasd'),
(2, 'asd', 122, 'asdas', 2, 1, 1, 2, 1, 1, 2, '2013-12-10', 'asdasdasdasd'),
(3, 'asd', 32123, 'asd', 2, 1, 1, 2, 1, 1, 3, '2022-12-19', 'asdasdasdasdasd'),
(4, 'asd', 123, 'asd', 1, 2, 2, 1, 1, 1, 4, '2022-12-12', 'asdasdasdasd'),
(5, 'qwe', 12, 'eqweqw', 1, 2, 1, 1, 1, 1, 1, '2022-12-05', 'asdasdasdasd'),
(6, 'job1', 213, 'asdasdas', 7, 2, 2, 2, 2, 1, 4, '2022-12-12', 'asdasdasdasd'),
(7, 'jobs2', 213, 'asdasd', 2, 1, 1, 1, 1, 1, 3, '2022-12-12', 'asdasdasdasdd'),
(8, 'Jobs3', 2131231, 'asdasdad', 2, 1, 2, 1, 1, 1, 3, '2022-12-13', 'dasdasdasdasd'),
(9, '111111', 12, 'asdasdasd', 1, 1, 1, 1, 1, 1, 1, NULL, 'asdasdasdasdasdasa');

-- --------------------------------------------------------

--
-- Структура таблицы `job_types`
--

CREATE TABLE `job_types` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `job_types`
--

INSERT INTO `job_types` (`id`, `name`) VALUES
(1, 'Full'),
(2, 'Part');

-- --------------------------------------------------------

--
-- Структура таблицы `locations`
--

CREATE TABLE `locations` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `locations`
--

INSERT INTO `locations` (`id`, `name`) VALUES
(1, 'USA');

-- --------------------------------------------------------

--
-- Структура таблицы `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `qualifications`
--

INSERT INTO `qualifications` (`id`, `name`) VALUES
(1, 'q1'),
(2, 'q2');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `firms`
--
ALTER TABLE `firms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categories` (`id_categories`),
  ADD KEY `id_experiences` (`id_experiences`),
  ADD KEY `id_gender` (`id_gender`),
  ADD KEY `id_job_types` (`id_job_types`),
  ADD KEY `id_locations` (`id_locations`),
  ADD KEY `id_qualifications` (`id_qualifications`),
  ADD KEY `id_firm` (`id_firm`);

--
-- Индексы таблицы `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `firms`
--
ALTER TABLE `firms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`id_experiences`) REFERENCES `experiences` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_ibfk_3` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_ibfk_4` FOREIGN KEY (`id_job_types`) REFERENCES `job_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_ibfk_5` FOREIGN KEY (`id_locations`) REFERENCES `locations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_ibfk_6` FOREIGN KEY (`id_qualifications`) REFERENCES `qualifications` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_ibfk_7` FOREIGN KEY (`id_firm`) REFERENCES `firms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
