USE vk;

/*Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]*/

CREATE VIEW view1 AS
SELECT user_id, COUNT(*) 'Количество групп'
FROM users_communities
GROUP BY user_id

/*Выведите данные, используя написанное представление [SELECT]*/

SELECT
	COUNT(*) OVER (PARTITION BY user_id) AS count_communities
    , user_id
FROM view1

/*Удалите представление [DROP VIEW]*/

DROP VIEW view1;

/* Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей),
 user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.*/
 

SELECT DISTINCT
	COUNT(*) OVER (PARTITION BY user_id) AS news_count
    , user_id
    ,email 'user_email'
FROM media
JOIN users ON users.id=media.user_id
