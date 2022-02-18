-- База данных для ресурса kinopoisk состоит из 15 таблиц
-- Такая структура позволяет не дублировать данные и инкапсулировать связи
-- Основными в БД являются таблицы films (содержит основную информацию о фильме)
-- и users (содержит всю информацию о пользователе)
-- в таблицу profiles_films вынесена вся информация о фильме.
-- Разделение films и profiles_films позвлит сократь время обработки запроса информации
-- таблици жанров, актеров, режиссеров и стран вынесены отдельно.
-- для взаимосвязи фильмов и вышеперечисленных таблиц реализованы отдельные таблицы связей.
-- существую две таблицы (user_list и score) с одинаковым (напервый взгляд) содержанием,
-- но они выполняют разные задачи:
-- user_list содержит просмотренные фильмы (оценка фильма не овязательна), благодаря этой таблице можно
-- делать выборку имеено по пользователям (в дальнейшем с возможностью расширения функциональности).
-- таблица score заполняется автоматически через триггеры, если пользователь ставит оценку. Черед 
-- данную таблицу уже можно делать выборки по популярности фильма 




-- **********Создание таблиц БД************

-- Основная сущность - фильмы
CREATE TABLE films (
    id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,  
    name_original VARCHAR(150) NOT NULL,  
    date_of_addition DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'дата добавления на кинопоиск(новинки)', 
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
 
-- Основная информация о фильмах
CREATE TABLE profiles_films (
    film_id INT NOT NULL UNIQUE,
    name_rus VARCHAR(150) NOT NULL COMMENT 'название на русском',  
    description TEXT COMMENT 'описание',
    is_serial ENUM('0', '1') DEFAULT '0' NOT NULL COMMENT 'сериал или нет',
    date_release YEAR NOT NULL COMMENT 'год выхода',
    time_study TIME NOT NULL COMMENT 'длительность фильма',  
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- таблица эпизодов с ссылкой нам сам файл
CREATE TABLE serials_episodes (
    film_id INT NOT NULL,
    num_episod INT NOT NULL,
    name_episod VARCHAR(150) NOT NULL, 
    metadata VARCHAR(150) NOT NULL COMMENT 'ссылка на сам файл фильма, тип измениться после заполения данными',
    size INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- таблица трейлеров с ссылкой на сам файл трейера
CREATE TABLE trailers (
    film_id INT,
    metadata VARCHAR(150) NOT NULL COMMENT 'ссылка на сам файл трейлера, тип измениться после заполения данными',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ); 

-- страна  фильма
CREATE TABLE countries (
    id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
    );

-- жарны фильмов 
CREATE TABLE genres (
    id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
    );
   
-- принадлежность фильмов к жанрам
 CREATE TABLE genres_of_films ( 
    film_id INT NOT NULL,
    genre_id INT NOT NULL
    ); 
   
-- режиссеры
CREATE TABLE directors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    surname VARCHAR(150) NOT NULL,
    birthday DATE NOT NULL,
    country_id INT NOT NULL
    ); 

-- актеры  
CREATE TABLE actors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    surname VARCHAR(150) NOT NULL,
    birthday DATE,
    country_id INT NOT NULL
    ); 

-- оценки фильмам 
CREATE TABLE score (
    film_id INT NOT NULL,
    user_id INT NOT NULL,
    score INT NOT NULL
    );

-- связь фильма и режиссёра   
CREATE TABLE films_directors (
    film_id INT NOT NULL,
    director_id INT NOT NULL
    );

-- связь фильма и актера
CREATE TABLE films_actors (
    film_id INT NOT NULL,
    actor_id INT NOT NULL
    );  

-- связь фильма и страны
CREATE TABLE films_country (
    film_id INT NOT NULL,
    country_id INT NOT NULL
    ); 

-- пользователь сервисом
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    surname VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    birthday DATE NOT NULL,
    gender ENUM ('f', 'm') NOT NULL
    );

 -- список фильмов пользователя 
 CREATE TABLE user_list (
    user_id INT NOT NULL,
    user_film_id INT NOT NULL COMMENT 'просмотренные фильмы',
    user_score INT  COMMENT 'оценка фильму'
    );
 -- таблицы user_list и csore по содержанию похожи, но выполняют разные фунции:
   -- user_list использует поле user_film_id как выборку уже просмотренных фильмов (оценку можно и не ставить)
   -- а вот в csore попадают только оцененные фильмы

-- **********Заполнение таблиц БД************ 
-- таблицы films, users, actors, directors, profiles_films, countries, genres_of_films, films_directors,
   -- films_actors, films_country
   -- зполняем через http://filldb.info/

-- проверка корректности данных
SHOW TABLES;
-- ----------------------------------------
SELECT * FROM countries LIMIT 10;
-- ----------------------------------------
SELECT * FROM films LIMIT 10;
-- меняем update_at, если оно меньше, чем дата выхода или 7 ноября 2003 года	
UPDATE films SET update_at =NOW() WHERE update_at < date_of_addition OR update_at < '2003-11-07';
-- -----------------------------------------
SELECT * FROM users LIMIT 10;
-- меняем дату, если возраст меньше 16 лет
UPDATE users SET birthday='1985-11-06' WHERE (YEAR(NOW()) - YEAR(birthday)) < 16 ;
-- -----------------------------------------
SELECT * FROM actors LIMIT 10;
-- создаем рандом country_id
UPDATE actors SET
	country_id = FLOOR(1 + RAND()*100); 
-- -----------------------------------------
SELECT * FROM directors LIMIT 10;
-- создаем рандом country_id
UPDATE directors SET
	country_id = FLOOR(1 + RAND()*100); 
-- -----------------------------------------
SELECT * FROM profiles_films LIMIT 10;
-- меняем update_at, если оно меньге create_at
UPDATE profiles_films SET update_at =NOW() WHERE update_at < created_at;
-- -----------------------------------------
SELECT * FROM films_actors LIMIT 10;
UPDATE films_actors SET 
  film_id = FLOOR(1 + RAND() * 100),
  actor_id = FLOOR(1 + RAND() * 100);
-- -----------------------------------------
SELECT * FROM films_country LIMIT 10;
UPDATE films_country SET 
  film_id = FLOOR(1 + RAND() * 100),
  country_id = FLOOR(1 + RAND() * 100); 
-- -----------------------------------------
SELECT * FROM films_directors LIMIT 10;
UPDATE films_directors SET 
  film_id = FLOOR(1 + RAND() * 100),
  director_id = FLOOR(1 + RAND() * 100);
-- -----------------------------------------
-- заполняем genres_of_films корректными значениями
SELECT * FROM genres_of_films LIMIT 10;
UPDATE genres_of_films SET 
  film_id = FLOOR(1 + RAND() * 100),
  genre_id = FLOOR(1 + RAND() * 14);

-- заполняем serials_episodes
SELECT * FROM serials_episodes LIMIT 10;
INSERT INTO serials_episodes (`film_id`,`num_episod`,`name_episod`,`metadata`,`size`,`created_at`,`update_at`)
VALUES (82,10,"ut erat.","in consectetuer",4791493,"2017-03-19 02:21:27","2021-05-13 01:11:03"),(44,5,"suscipit nonummy.","dictum magna.",3617567,"2015-12-15 02:41:52","2021-06-03 02:58:18"),(81,3,"senectus","lacinia orci,",508949,"2015-10-28 05:42:54","2020-09-26 14:45:22"),(78,1,"nulla.","metus. Vivamus",792384,"2005-01-20 16:37:14","2020-09-12 04:14:02"),(20,9,"Donec","lobortis ultrices.",4618380,"2012-11-19 00:36:57","2021-11-12 04:45:17"),(93,8,"sapien, gravida","ornare. Fusce",4211030,"2017-11-21 05:20:07","2021-08-06 08:01:21"),(91,6,"urna.","libero et",394145,"2018-11-05 20:16:17","2022-03-02 11:24:45"),(15,2,"libero","semper tellus",1929579,"2007-07-15 16:41:39","2020-10-10 15:57:51"),(78,1,"lacus. Ut","congue. In",594968,"2004-04-30 11:50:22","2022-04-30 17:50:10"),(76,6,"nonummy","nunc, ullamcorper",3969575,"2019-12-11 00:39:52","2020-09-29 03:33:51"),(68,3,"blandit at,","enim commodo",3347775,"2014-02-14 21:11:01","2022-05-09 12:09:39"),(61,6,"vestibulum nec,","Cum sociis",1174378,"2013-01-18 06:14:23","2021-03-01 03:54:00"),(81,2,"mattis","suscipit, est",998618,"2004-06-26 00:22:57","2021-06-18 18:31:20"),(54,2,"commodo","lectus. Cum",433741,"2016-12-30 12:54:13","2021-01-04 19:15:54"),(21,2,"tempus, lorem","nibh enim,",3078527,"2011-05-03 19:05:01","2021-11-16 09:30:03"),(24,5,"sit amet","ac urna.",4685142,"2012-05-04 11:03:41","2022-03-11 03:09:20"),(29,6,"tempus","hendrerit id,",4920106,"2013-05-11 06:08:21","2021-09-13 02:46:54"),(86,5,"et, rutrum","sed orci",123745,"2014-09-30 13:54:46","2020-06-04 04:30:00"),(40,9,"Nullam lobortis","pretium et,",2407984,"2021-09-12 23:15:00","2021-10-03 22:33:10"),(8,1,"Mauris nulla.","est. Mauris",1991437,"2004-12-30 04:52:29","2020-09-17 05:21:25"),(50,1,"Pellentesque ultricies","egestas. Fusce",2468354,"2012-05-20 17:53:31","2021-05-19 07:49:48"),(29,4,"lorem","rutrum magna.",624174,"2019-03-15 18:16:26","2020-11-08 18:58:54"),(76,1,"nisl sem,","sapien, gravida",4743624,"2011-12-26 09:27:11","2020-07-07 20:28:59"),(17,5,"ornare.","nonummy ac,",10011,"2016-02-27 12:41:54","2021-10-03 21:54:58"),(6,9,"Ut","justo eu",748037,"2005-12-21 02:19:53","2021-05-12 16:37:20"),(58,7,"Nulla dignissim.","leo. Vivamus",1250880,"2012-11-28 02:55:12","2021-04-10 14:12:42"),(18,3,"risus. Nulla","Aliquam nec",3495182,"2014-05-30 01:02:33","2022-04-15 17:51:29"),(3,9,"Mauris nulla.","amet, consectetuer",515812,"2010-09-18 02:12:35","2021-05-25 07:30:46"),(65,6,"nibh","fringilla mi",707958,"2018-09-22 18:40:30","2022-05-13 12:37:28"),(34,7,"enim.","elementum, lorem",805147,"2014-11-30 11:37:19","2021-07-10 06:48:49"),(63,10,"adipiscing non,","pellentesque, tellus",4165841,"2020-01-15 10:01:37","2021-04-07 11:25:32"),(53,3,"ullamcorper eu,","diam dictum",663073,"2015-12-06 05:13:57","2022-01-27 06:48:58"),(20,8,"sed","odio, auctor",4270578,"2009-03-18 09:20:22","2021-09-19 00:29:41"),(69,6,"ac mi","in, tempus",116331,"2004-05-13 22:28:58","2020-11-09 15:23:41"),(24,7,"sed,","risus quis",3496073,"2006-05-17 20:28:29","2020-11-14 07:40:13"),(36,7,"orci luctus","a, scelerisque",1948711,"2021-06-12 15:41:34","2022-02-07 18:37:17"),(78,2,"interdum libero","Phasellus at",726005,"2003-10-07 13:35:10","2021-03-17 14:38:31"),(27,9,"malesuada vel,","ac, feugiat",4942104,"2022-04-14 16:23:07","2021-09-25 07:09:22"),(27,6,"semper","ut nisi",1142483,"2010-08-03 07:51:51","2020-09-02 07:39:23"),(74,9,"sollicitudin orci","In mi",812182,"2011-09-26 08:45:25","2021-04-17 00:02:19"),(45,7,"lacinia at,","arcu. Sed",2701752,"2017-03-23 08:01:30","2021-02-03 23:37:24"),(28,7,"mi fringilla","lobortis augue",724790,"2012-02-06 23:30:30","2022-01-30 19:12:40"),(52,2,"sem ut","Donec felis",2513927,"2017-12-31 21:41:17","2020-07-25 18:03:48"),(11,9,"Quisque libero","tincidunt dui",4327826,"2006-08-22 06:38:04","2021-03-06 07:20:26"),(93,1,"enim. Nunc","Duis sit",3688067,"2015-11-25 02:58:58","2022-03-04 01:49:29"),(85,3,"Suspendisse","elit, pretium",3215237,"2014-09-23 07:10:27","2022-02-08 17:18:20"),(57,10,"eu, ultrices","mauris erat",4757321,"2010-11-03 09:48:50","2021-03-27 16:14:48"),(66,1,"pharetra ut,","elit, pretium",2229475,"2010-01-14 05:57:20","2022-03-14 04:15:17"),(22,8,"ultricies adipiscing,","justo. Proin",1314234,"2007-12-17 02:52:14","2021-12-19 20:40:46"),(37,2,"egestas, urna","elit, pellentesque",3717522,"2012-09-16 07:08:40","2021-05-17 08:00:14"),(31,4,"egestas.","rhoncus id,",2065710,"2009-10-09 17:47:11","2020-09-22 17:45:09"),(82,3,"porttitor vulputate,","ipsum. Suspendisse",231322,"2015-03-02 22:28:37","2020-12-06 06:50:16"),(37,6,"vitae,","Suspendisse sagittis.",2920128,"2016-08-17 05:04:42","2021-08-05 06:54:50"),(99,9,"Proin non","dui, nec",4619780,"2019-11-28 08:08:22","2021-11-15 15:19:57"),(8,8,"neque vitae","accumsan convallis,",4425466,"2019-08-30 17:58:38","2022-05-01 16:25:19"),(23,8,"nonummy.","mauris ut",409287,"2013-02-10 14:23:28","2020-07-18 05:48:14"),(38,9,"magna.","in, hendrerit",1441478,"2019-06-22 13:25:41","2020-12-15 23:14:00"),(25,7,"magna nec","vestibulum. Mauris",891232,"2007-03-31 05:07:55","2021-05-18 08:03:56"),(29,6,"ut, nulla.","Pellentesque habitant",3708642,"2008-12-22 09:34:21","2021-02-08 05:16:03"),(86,7,"dui quis","et netus",4240616,"2021-06-13 23:18:57","2021-03-23 13:17:40"),(42,10,"a,","malesuada. Integer",2726250,"2008-12-03 23:49:25","2021-05-05 17:45:43"),(93,3,"aliquam adipiscing","vitae, aliquet",2410376,"2003-07-26 10:07:31","2021-04-23 02:24:18"),(57,1,"tempus","enim nisl",1729057,"2005-04-12 18:11:23","2021-03-21 22:34:51"),(40,8,"nibh","Cras eu",3226206,"2018-08-18 22:27:20","2020-11-22 19:41:19"),(71,2,"cursus.","Suspendisse aliquet,",4273136,"2004-12-03 15:05:11","2021-06-17 07:23:20"),(80,8,"volutpat.","ut mi.",4054462,"2011-07-08 07:00:22","2020-10-01 15:42:26"),(91,4,"velit","ornare, libero",4656888,"2018-09-07 00:24:44","2021-09-17 05:18:51"),(8,8,"Nam","montes, nascetur",74867,"2015-12-22 03:11:43","2021-08-12 16:06:32"),(1,5,"ipsum. Curabitur","lacus vestibulum",1355816,"2003-11-26 08:36:07","2021-08-03 16:26:59"),(76,4,"tincidunt aliquam","Vestibulum ante",3810359,"2014-10-07 21:11:53","2021-01-04 13:37:17"),(73,10,"dictum","ac arcu.",2760975,"2007-04-15 10:38:19","2022-03-16 23:34:41"),(37,8,"ante. Nunc","Quisque nonummy",2275694,"2020-02-25 03:55:54","2021-12-04 23:38:53"),(92,4,"mollis. Integer","hendrerit a,",152560,"2005-10-24 20:57:46","2020-09-14 07:29:41"),(44,6,"ultrices","nec, euismod",2353870,"2016-01-30 11:25:19","2021-07-01 01:00:39"),(54,4,"urna. Ut","hymenaeos. Mauris",2864810,"2021-04-11 13:28:28","2020-07-19 20:19:03"),(47,7,"pretium et,","dignissim magna",221799,"2013-05-02 11:35:28","2021-03-04 16:19:54"),(52,6,"tempor erat","eu augue",167000,"2013-08-19 12:57:55","2020-10-07 04:32:11"),(6,5,"gravida nunc","viverra. Maecenas",4474665,"2016-07-28 20:22:01","2021-08-05 02:50:13"),(42,2,"vitae,","nunc, ullamcorper",3705080,"2013-07-30 08:15:28","2021-06-30 04:48:01"),(32,3,"convallis dolor.","eu elit.",1464631,"2013-02-08 15:51:52","2021-05-29 13:45:42"),(48,8,"Duis","arcu eu",600356,"2004-02-24 05:27:45","2021-03-03 00:32:36"),(43,1,"aliquam","Phasellus dapibus",4307346,"2018-06-03 06:03:42","2020-07-31 11:34:56"),(10,10,"porttitor","malesuada. Integer",1520673,"2014-08-24 21:25:45","2021-02-22 17:45:40"),(99,6,"sit amet","lobortis quis,",2899810,"2015-01-11 14:37:31","2021-09-15 19:42:49"),(28,7,"Nulla","ultricies sem",4423986,"2017-01-29 00:06:17","2021-06-30 08:09:43"),(99,2,"Nullam feugiat","tincidunt. Donec",1989160,"2003-12-20 14:03:05","2021-06-22 05:07:51"),(4,1,"mollis. Phasellus","luctus aliquet",1300357,"2021-05-31 13:56:00","2021-02-05 15:15:25"),(15,4,"dictum.","eget magna.",2790698,"2015-06-30 21:34:23","2021-09-09 19:05:01"),(93,10,"Aliquam erat","sem elit,",3825936,"2005-08-02 09:46:29","2021-02-27 04:25:30"),(27,10,"Maecenas","mattis velit",887977,"2009-01-14 17:25:24","2021-03-27 07:56:05"),(98,1,"pretium","at sem",4642466,"2017-03-06 07:38:10","2020-06-05 23:06:14"),(52,5,"viverra. Maecenas","arcu. Nunc",891869,"2010-06-04 22:49:48","2020-09-06 13:38:27"),(9,4,"vel","suscipit, est",2439047,"2014-04-29 14:27:55","2022-03-04 10:08:15"),(49,5,"tempor","tristique senectus",2586285,"2017-08-05 12:16:20","2021-06-28 12:43:53"),(10,3,"tristique","neque. Morbi",4146402,"2019-04-02 13:43:45","2021-11-12 08:28:49"),(52,2,"est","senectus et",3115574,"2003-11-29 15:57:58","2020-06-15 04:54:30"),(81,10,"imperdiet","massa non",4607830,"2022-05-11 05:14:13","2021-07-02 06:40:14"),(30,1,"consectetuer mauris","id risus",2155149,"2022-01-26 20:10:48","2022-01-27 06:26:39"),(96,5,"amet","sit amet",2570219,"2017-03-09 19:32:42","2022-02-16 16:23:51"),(78,5,"at arcu.","euismod enim.",3464419,"2007-04-18 23:33:04","2021-12-13 04:17:03");

UPDATE serials_episodes SET update_at =NOW() WHERE update_at < created_at; 

UPDATE serials_episodes 
  SET metadata= CONCAT('{"',
  (SELECT name_original FROM films WHERE id = serials_episodes.film_id),
  '":"', 
  CONCAT(name_episod, ' ', metadata),
  '"}');
ALTER TABLE serials_episodes MODIFY COLUMN metadata JSON;

-- заполняем trailers
SELECT * FROM trailers LIMIT 10;
INSERT INTO `trailers` (`film_id`,`metadata`,`created_at`,`update_at`) VALUES (79,"ornare, elit","2012-12-02 11:09:39","2022-05-13 01:44:10"),(14,"at arcu.","2007-11-30 23:44:13","2021-07-13 15:31:44"),(13,"penatibus et","2011-03-28 11:51:45","2020-10-10 22:19:19"),(94,"eu, accumsan","2004-08-17 09:29:38","2020-10-23 00:40:05"),(27,"dui. Fusce","2019-05-02 15:39:10","2021-09-16 07:25:09"),(29,"cursus et,","2017-10-26 09:20:42","2020-06-05 12:17:03"),(61,"congue. In","2021-03-18 04:47:18","2021-01-14 19:13:14"),(28,"orci, in","2021-02-28 06:17:54","2022-05-05 02:48:07"),(4,"et pede.","2020-02-12 18:34:06","2022-02-10 10:54:39"),(82,"In faucibus.","2021-06-29 14:01:54","2020-05-22 21:35:37"),(80,"morbi tristique","2021-08-19 05:45:52","2022-03-24 23:04:40"),(29,"nisl arcu","2012-06-30 02:03:03","2022-02-20 16:18:31"),(46,"commodo hendrerit.","2007-04-08 03:18:52","2020-08-15 09:00:23"),(5,"est arcu","2017-07-31 15:03:27","2022-04-23 13:01:51"),(44,"in consequat","2012-03-13 22:58:52","2020-07-28 23:59:13"),(44,"venenatis lacus.","2007-06-22 02:02:21","2020-12-04 14:25:11"),(51,"Donec consectetuer","2018-04-01 02:54:01","2021-08-03 12:10:25"),(10,"dis parturient","2019-07-02 22:53:17","2021-07-10 14:28:22"),(48,"malesuada vel,","2006-01-19 04:00:56","2021-03-25 19:50:53"),(12,"nec, malesuada","2014-06-29 20:53:14","2022-04-18 05:10:41"),(10,"quam. Pellentesque","2014-08-09 02:15:30","2021-04-27 00:08:33"),(70,"Praesent luctus.","2015-07-21 08:56:57","2021-01-02 11:49:36"),(45,"mollis. Duis","2010-11-16 13:13:35","2022-01-30 10:36:05"),(7,"habitant morbi","2010-07-20 10:02:03","2021-05-21 18:31:04"),(66,"parturient montes,","2005-04-12 10:23:54","2020-12-21 06:32:40"),(84,"lectus pede,","2010-02-16 00:02:11","2021-08-06 22:37:39"),(93,"auctor quis,","2011-07-24 11:48:40","2021-04-26 07:11:10"),(54,"augue id","2008-11-09 08:24:24","2020-09-18 00:17:02"),(27,"dui nec","2013-09-14 19:27:34","2021-09-11 11:02:21"),(9,"pharetra, felis","2004-02-13 00:42:07","2020-08-04 03:09:12"),(46,"ut cursus","2004-10-02 17:33:38","2021-01-08 10:52:30"),(57,"lacus. Etiam","2014-03-25 19:35:01","2022-01-11 18:09:38"),(45,"sapien, gravida","2007-03-07 03:45:26","2021-12-16 06:33:43"),(55,"varius. Nam","2009-03-30 13:56:37","2021-08-31 01:06:11"),(71,"augue eu","2004-06-25 16:43:03","2021-07-14 18:14:30"),(76,"metus vitae","2021-12-13 20:00:18","2022-02-10 19:55:39"),(40,"Donec feugiat","2013-01-23 18:17:15","2022-02-04 00:46:48"),(89,"eu, odio.","2018-02-27 12:54:47","2020-07-05 17:44:21"),(79,"dolor sit","2015-12-07 10:43:07","2021-03-23 14:16:20"),(18,"pellentesque a,","2008-01-20 12:02:57","2022-05-16 10:59:00"),(10,"nunc. In","2010-03-29 07:10:46","2022-02-08 15:06:14"),(96,"tristique senectus","2004-10-31 18:39:50","2021-08-17 17:26:30"),(27,"dictum sapien.","2010-04-03 00:26:38","2020-06-27 05:50:40"),(1,"est. Nunc","2011-04-11 04:48:22","2020-07-25 10:57:51"),(40,"mauris sit","2021-06-25 20:12:39","2021-07-10 13:09:43"),(65,"lacinia. Sed","2003-08-08 22:30:19","2020-08-21 05:18:29"),(21,"ridiculus mus.","2008-10-15 19:34:10","2021-11-08 16:57:04"),(100,"enim. Etiam","2009-12-29 01:48:16","2021-10-22 05:33:19"),(37,"sociis natoque","2009-08-27 17:31:48","2021-04-26 18:27:39"),(12,"arcu. Sed","2018-09-18 12:56:20","2021-03-16 02:03:28"),(18,"id, erat.","2020-05-29 14:51:34","2021-12-10 12:43:58"),(64,"massa. Suspendisse","2021-04-18 01:14:02","2022-05-15 22:43:12"),(25,"erat. Vivamus","2008-09-19 09:47:10","2021-07-27 05:54:55"),(73,"in consectetuer","2011-07-15 21:26:06","2021-11-15 02:43:44"),(9,"Vivamus euismod","2016-11-01 07:50:31","2022-01-16 02:49:33"),(50,"ultrices sit","2015-12-08 07:00:39","2021-12-09 19:55:31"),(46,"nibh lacinia","2021-04-28 05:31:30","2021-04-12 07:04:35"),(7,"odio. Nam","2019-06-02 03:20:26","2020-09-07 23:51:59"),(53,"felis ullamcorper","2014-08-07 23:46:32","2020-09-29 05:32:28"),(62,"interdum libero","2007-09-14 08:14:24","2022-04-13 02:52:09"),(64,"molestie dapibus","2015-04-26 00:08:32","2020-09-22 10:20:20"),(30,"In tincidunt","2018-03-02 01:54:28","2020-09-11 12:14:40"),(51,"pharetra, felis","2020-04-02 05:54:13","2020-06-23 15:25:31"),(58,"cursus a,","2010-09-18 16:58:49","2021-08-06 01:26:24"),(30,"adipiscing lobortis","2022-01-25 21:59:17","2021-07-15 08:02:29"),(3,"Suspendisse tristique","2014-12-10 03:54:59","2020-08-29 13:54:04"),(83,"eu, placerat","2017-05-21 15:02:14","2021-11-07 05:19:01"),(93,"diam. Duis","2018-10-07 10:02:42","2020-08-16 03:09:09"),(27,"rutrum magna.","2014-05-12 16:15:29","2020-09-25 19:00:55"),(93,"Fusce dolor","2004-02-06 15:56:14","2022-03-14 07:56:57"),(56,"lacus pede","2009-02-11 15:04:38","2021-09-12 23:22:37"),(50,"amet diam","2012-03-07 05:32:31","2021-01-22 10:22:46"),(46,"Sed pharetra,","2008-10-31 22:48:04","2020-06-03 13:14:30"),(41,"diam. Pellentesque","2012-11-05 08:17:16","2020-06-10 14:03:01"),(95,"ligula. Nullam","2019-12-27 20:27:51","2020-10-16 03:07:33"),(70,"mus. Donec","2012-08-30 23:09:50","2021-02-25 19:45:18"),(26,"ullamcorper. Duis","2020-03-29 16:18:16","2022-05-01 06:01:26"),(98,"Curabitur consequat,","2019-05-07 14:46:21","2020-11-01 11:46:46"),(80,"ut, nulla.","2012-01-23 14:48:13","2021-07-17 08:12:56"),(79,"leo. Morbi","2003-07-02 06:06:02","2021-08-29 13:45:59"),(46,"tincidunt. Donec","2022-05-18 19:57:26","2020-08-03 22:09:18"),(53,"id, ante.","2014-12-06 07:09:13","2021-08-04 03:26:06"),(1,"velit dui,","2004-06-17 03:47:39","2022-03-23 03:08:11"),(18,"massa rutrum","2007-11-01 15:34:24","2020-08-16 04:13:52"),(50,"velit. Pellentesque","2010-04-04 05:20:02","2021-09-15 19:32:42"),(32,"pede, ultrices","2022-02-24 00:38:30","2020-06-16 02:18:44"),(21,"Quisque fringilla","2007-12-27 17:39:56","2021-02-11 05:44:45"),(7,"Pellentesque habitant","2016-05-14 19:15:44","2021-04-29 15:19:49"),(17,"et tristique","2005-03-10 09:21:28","2022-01-15 14:13:10"),(24,"Sed eu","2016-07-29 13:20:57","2021-06-22 05:25:31"),(90,"Quisque ornare","2003-11-30 01:41:40","2021-04-27 14:07:16"),(30,"luctus aliquet","2019-02-14 04:47:05","2020-08-24 13:32:08"),(47,"Proin eget","2010-09-02 18:41:32","2020-07-24 04:41:23"),(90,"enim nisl","2011-09-24 12:40:51","2021-02-28 12:55:26"),(20,"sit amet,","2017-10-04 06:16:52","2021-02-17 12:15:03"),(61,"Nam interdum","2008-07-10 20:02:00","2021-11-03 06:10:11"),(1,"quis accumsan","2015-02-25 04:45:52","2021-04-08 00:28:19"),(15,"dui nec","2005-03-19 11:33:18","2020-07-13 23:19:55"),(66,"non, cursus","2014-01-26 00:05:09","2021-04-19 17:03:21"),(15,"magna sed","2006-01-27 22:11:28","2021-02-10 22:46:35");
UPDATE trailers SET update_at =NOW() WHERE update_at < created_at;
UPDATE trailers SET metadata = CONCAT('{"',
  (SELECT name_original FROM films WHERE id = film_id),
  '":"trailer"}'); 
ALTER TABLE trailers MODIFY COLUMN metadata JSON;

-- заполняем genres
SELECT * FROM genres;
INSERT INTO genres (name) VALUES
 ('action'),
 ('comedy'),
 ('sci-fi '),
 ('documentary'),
 ('drama'),
 ('family'),
 ('horror'),
 ('short'),
 ('adventure'),
 ('disaster'),
 ('thriller'),
 ('musical'),
 ('cartoon'),
 ('detective');
-- перед заполнением user_list
-- создаем триггер для score
SELECT * FROM score LIMIT 10;
-- для score создаем правило, проверяющее оценку и корректность film_id и user_id
DELIMITER //

CREATE TRIGGER film_id_and_user_id_is_NULL BEFORE INSERT ON score
FOR EACH ROW
BEGIN
	DECLARE film_id, user_id INT;
    IF (NEW.film_id = NULL AND NEW.user_id = NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'film_id and user_id can be NULL';
    END IF;
END //


-- правило для автозаполнения таблицы score

DELIMITER //

CREATE TRIGGER score_is_not_NULL_insert AFTER INSERT ON user_list
FOR EACH ROW
BEGIN
	DECLARE user_score INT;
    IF NEW.user_score IS NOT NULL THEN
        INSERT INTO score (film_id, user_id, score) 
          VALUES (NEW.user_film_id, NEW.user_id, NEW.user_score) ;
    END IF;
END //

DELIMITER //

CREATE TRIGGER score_is_not_NULL_update AFTER UPDATE ON user_list
FOR EACH ROW
BEGIN
	DECLARE user_score INT;
    IF NEW.user_score IS NOT NULL THEN
        INSERT INTO score (film_id, user_id, score) 
          VALUES (NEW.user_film_id, NEW.user_id, NEW.user_score) ;
    END IF;
END //


-- заполняем user_list
SELECT * FROM user_list LIMIT 10;
INSERT INTO user_list (`user_id`,`user_film_id`,`user_score`) 
  VALUES 
  (56,56,2),(41,12,9),(35,4,NULL),(96,70,4),(41,69,5),(43,63,5),(31,78,7),(32,91,5),(15,45,1),
  (93,31,2),(71,19,9),(68,22,4),(76,7,6),(20,47,9),(70,8,9),(70,57,5),(95,38,10),(12,48,7),
  (39,57,1),(43,36,1),(2,5,6),(43,92,9),(12,37,4),(34,35,NULL),(34,43,6),(17,59,NULL),(62,17,8),
  (94,64,2),(26,51,NULL),(68,17,8),(15,76,NULL),(95,86,9),(89,97,3),(27,57,9),(41,53,7),(96,33,4),
  (32,73,6),(6,48,2),(18,24,4),(76,33,10),(99,69,6),(54,14,7),(51,51,5),(20,32,7),(59,90,1),(41,97,7),
  (2,35,4),(55,20,9),(47,51,NULL),(89,53,5),(4,59,5),(95,99,8),(15,76,2),(29,61,7),(93,39,1),(23,64,1),
  (84,7,9),(12,71,9),(55,41,3),(42,79,4),(3,79,1),(51,33,6),(7,48,NULL),(53,45,1),(26,35,6),(9,91,6),
  (33,43,8),(41,30,NULL),(71,78,5),(74,63,3),(61,79,4),(68,17,5),(5,42,9),(16,46,5),(2,16,3),(57,82,4),
  (6,45,1),(79,67,NULL),(80,88,5),(93,26,9),(49,42,6),(88,24,5),(68,40,NULL),(19,23,2),(67,49,8),(90,77,5),
  (31,56,9),(96,15,4),(74,50,5),(44,4,7),(45,1,2),(5,47,2),(97,12,10),(52,93,4),(12,67,10),(93,22,NULL),
  (42,37,6),(33,74,3),(2,7,6),(83,20,8);

 
-- *******Создаем внешние ключи*******
 
DESC profiles_films;

ALTER TABLE profiles_films
  ADD CONSTRAINT profiles_films_film_id_fk 
    FOREIGN KEY (film_id) REFERENCES films(id);
   
DESC genres_of_films;

ALTER TABLE genres_of_films
  ADD CONSTRAINT genres_of_films_film_id_fk 
    FOREIGN KEY (film_id) REFERENCES films(id),
  ADD CONSTRAINT genres_of_films_genre_id_fk
    FOREIGN KEY (genre_id) REFERENCES genres(id);
   
DESC score;

ALTER TABLE score
  ADD CONSTRAINT score_film_id_fk 
    FOREIGN KEY (film_id) REFERENCES films(id),
  ADD CONSTRAINT score_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);


DESC user_list;

ALTER TABLE user_list
  ADD CONSTRAINT user_list_user_film_id_fk 
    FOREIGN KEY (user_film_id) REFERENCES films(id),
  ADD CONSTRAINT user_list_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);

DESC trailers;

ALTER TABLE trailers
  ADD CONSTRAINT trailers_film_id_fk 
    FOREIGN KEY (film_id) REFERENCES films(id);

DESC actors;

ALTER TABLE actors
  ADD CONSTRAINT actors_country_id_fk 
    FOREIGN KEY (country_id) REFERENCES countries(id);

DESC directors;

ALTER TABLE directors
  ADD CONSTRAINT directors_country_id_fk 
    FOREIGN KEY (country_id) REFERENCES countries(id);

DESC serials_episodes;

ALTER TABLE serials_episodes
  ADD CONSTRAINT serials_episodes_film_id_fk 
    FOREIGN KEY (film_id) REFERENCES films(id);

DESC films_directors;

ALTER TABLE films_directors
  ADD CONSTRAINT films_directors_film_id_fk 
    FOREIGN KEY (film_id) REFERENCES films(id),
   ADD CONSTRAINT films_directors_director_id_fk 
    FOREIGN KEY (director_id) REFERENCES directors(id);
   
DESC films_actors;

ALTER TABLE films_actors
  ADD CONSTRAINT films_actors_film_id_fk 
    FOREIGN KEY (film_id) REFERENCES films(id),
   ADD CONSTRAINT films_actors_actor_id_fk 
    FOREIGN KEY (actor_id) REFERENCES actors(id);
   
DESC films_country;

ALTER TABLE films_country
  ADD CONSTRAINT films_country_film_id_fk 
    FOREIGN KEY (film_id) REFERENCES films(id),
   ADD CONSTRAINT films_country_actor_id_fk 
    FOREIGN KEY (country_id) REFERENCES countries(id);
   
 -- *********Создаем индексы****************

SHOW INDEX FROM actors;

CREATE INDEX actors_surname_name_idx ON actors(surname, name);

SHOW INDEX FROM directors;

CREATE INDEX directors_surname_name_idx ON directors(surname, name);

SHOW INDEX FROM films;

CREATE INDEX films_date_of_addition_idx ON films(date_of_addition);

SHOW INDEX FROM profiles_films;

CREATE INDEX profiles_films_name_rus_idx ON profiles_films(name_rus);

SHOW INDEX FROM score;

CREATE INDEX score_score_idx ON score(score);

SHOW INDEX FROM serials_episodes;

CREATE INDEX serials_episodes_film_id_num_episod_idx ON serials_episodes(film_id, num_episod);

-- *********Создаем представления*********** 
-- Выводит название фильма и режиссер
CREATE VIEW directors_of_films AS 
   SELECT 
     profiles_films.name_rus AS film_name, 
     CONCAT(directors.name, ' ', directors.surname) AS directors
   FROM profiles_films JOIN films_directors ON profiles_films.film_id = films_directors.film_id
  JOIN directors ON directors.id=films_directors.director_id ORDER BY profiles_films.film_id;  
SELECT * FROM directors_of_films;

-- Выводит название фильма и актеров
CREATE VIEW actors_of_films AS 
   SELECT 
     profiles_films.name_rus AS film_name, 
     CONCAT(actors.name, ' ', actors.surname) AS actors
   FROM profiles_films JOIN films_actors ON profiles_films.film_id = films_actors.film_id
  JOIN actors ON actors.id=films_actors.actor_id ORDER BY profiles_films.film_id;  
SELECT * FROM actors_of_films;

-- Выводит название фильма и страну
CREATE VIEW country_of_films AS 
   SELECT 
     profiles_films.name_rus AS film_name, 
     countries.name AS country
   FROM profiles_films JOIN films_country ON profiles_films.film_id = films_country.film_id
  JOIN countries ON countries.id=films_country.country_id ORDER BY profiles_films.film_id;  
SELECT * FROM country_of_films;
 
-- ********Создаем запросы***************

-- Покажем среднюю оценку фильма
SELECT 
films.name_original AS name,
AVG(score.score) AS score 
FROM films LEFT JOIN score ON films.id = score.film_id
GROUP BY films.id;

-- название фильма
-- количество просмотров фильма
-- жанры фильма
-- средняя оценка фильма
-- минимальная оенка фильма
-- максимальная оценка фильма
-- самый молодой зритель фильма
-- самый старший зритель фильма
-- средний возраст зрителя

SELECT 
profiles_films.name_rus AS film,
COUNT(user_list.user_id) AS num_of_views,
GROUP_CONCAT(DISTINCT genres.name) AS ganres,
AVG(score.score) AS avg_score,
MIN(score.score) AS min_score,
MAX(score.score) AS max_score,
MIN(YEAR(NOW()) - YEAR(users.birthday)) AS younder_users,
MAX(YEAR(NOW()) - YEAR(users.birthday)) AS oldest_age_users,
AVG(YEAR(NOW()) - YEAR(users.birthday)) AS avg_age_users
  FROM profiles_films 
  LEFT JOIN
    user_list ON profiles_films.film_id = user_list.user_film_id
  LEFT JOIN
    genres_of_films ON profiles_films.film_id = genres_of_films.film_id 
  LEFT JOIN 
    genres ON genres.id = genres_of_films.genre_id 
  LEFT JOIN 
    score ON score.film_id = profiles_films.film_id 
  LEFT JOIN 
    users ON users.id = user_list.user_id
  GROUP BY profiles_films.film_id;
 
-- имя пользователя
-- просматриваемый жанры у каждого пользователя
-- количество просмотров пользователя
-- количество оценок пользователя
-- средняя оценка рользователя

 
 SELECT 
 CONCAT(users.name, ' ', users.surname) AS user,
 GROUP_CONCAT(DISTINCT genres.name) AS genres,
 COUNT(user_list.user_film_id) AS all_views,
 COUNT(user_list.user_score) AS all_score,
 AVG(user_list.user_score) AS avg_score
 FROM users
 LEFT JOIN user_list ON users.id = user_list.user_id
 LEFT JOIN genres_of_films ON genres_of_films.film_id = user_list.user_film_id
 LEFT JOIN genres ON genres.id = genres_of_films.film_id
 GROUP BY users.id;

