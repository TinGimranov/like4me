-- MySQL dump 10.13  Distrib 5.5.30, for osx10.6 (i386)
--
-- Host: localhost    Database: like4me_development
-- ------------------------------------------------------
-- Server version	5.5.30-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ckeditor_assets`
--

DROP TABLE IF EXISTS `ckeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ckeditor_assetable_type` (`assetable_type`,`type`,`assetable_id`),
  KEY `idx_ckeditor_assetable` (`assetable_type`,`assetable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_assets`
--

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8_unicode_ci,
  `read` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_orders`
--

DROP TABLE IF EXISTS `like_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `type_record` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `gender_min` int(11) DEFAULT NULL,
  `gender_max` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_orders`
--

LOCK TABLES `like_orders` WRITE;
/*!40000 ALTER TABLE `like_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Кратко о сервисе','<p>Привет всем, кто стремится стать популярным на просторах интернета и категорически устал от скучных и однообразных будней! Специально для активных и жаждущих славы мы разработали уникальный проект, способный помочь любому человеку поместить своё имя на уста тысяч и миллионов других людей!&nbsp;</p>\r\n','<p>Привет всем, кто стремится стать популярным на просторах интернета и категорически устал от скучных и однообразных будней! Специально для активных и жаждущих славы мы разработали уникальный проект, способный помочь любому человеку поместить своё имя на уста тысяч и миллионов других людей!</p>\r\n\r\n<p>Как это сделать, спросите вы? Наверняка, это кому-то покажется банальным, но очень просто. Пользуясь нашим ресурсом, вы сможете &laquo;накручивать&raquo; на своей странице в социальных сетях &laquo;сердечки&raquo;, обзавестись сотнями и тысячами друзей Вконтакте и поднять свою собственную группу на первые строчки в рейтингах популярности.</p>\r\n\r\n<p>Иногда приходится слышать, что &laquo;сердечки&raquo; Вконтакте &ndash; лишь простая формальность. Но, пожалуй, каждый из читающих эту статью, видя чью-то страничку с большим количеством лайков, на несколько минут задерживался на ней, переходя по разным разделам и пытаясь понять секрет популярности человека. Это сугубо психологический аспект &ndash; любой человек старается подражать сильным мира сего. Если говорить о сайте Вконтакте, то об успешном человеке можно с лёгкостью судить, оценив количество &laquo;сердечек&raquo; на его странице.</p>\r\n\r\n<p>Наш сервис поможет и тем, кто пытается раскрутить свою группу. Это можно сделать лишь одним способом &ndash; наполнить её как можно большим количеством подписчиков. Разумеется, можно попытаться самостоятельно пригласить огромное число народа со Вконтакте, но где гарантия, что все они согласятся вступить в вашу группу и пробудут там достаточно долго? Такой гарантии никто не даст, если только вы не являетесь пользователем нашего ресурса. Мы можем дать гарантию, что ваша группа в скором времени наполнится огромным числом подписчиков, и они будут в ней на постоянной основе! Есть и ещё один способ раскрутки группы &ndash; наполнение её фейковыми аккаунтами. Но в наши дни система выявления популярности групп уже научилась распознавать количество фейков в конкретной группе, а потому этот вариант придётся отбросить.</p>\r\n\r\n<p>Вместе с нами ваша группа будет всегда наполнена, но при этом процентное содержание в ней фейков будет всегоа равно 0%! О вашем товаре или идее узнают миллионы посетителей Вконтакте, что сразу же отразится на успехе задуманного вами предприятия!</p>\r\n\r\n<p>Мы склонны думать, что дочитав до этого места, вы, скорее всего, заинтересовались столь заманчивым предложением, но пресловутая &laquo;задняя мысль&raquo; утверждает, что ничего не может быть в этом мире просто так, и за подобную раскрутку групп и накрутку &laquo;лайков&raquo; придётся сделать что-то сложное или платить неимоверное количество денег. Так вот, &laquo;задняя мысль&raquo; может быть спокойна &ndash; так как наш сервис открылся недавно, в качестве акции мы предлагаем ощутить все его преимущества любому пользователю совершенно бесплатно! Каково? Сможете ли вы найти подобное предложение где-либо ещё в интернете? Можете не терять время, пытаясь найти аналоги &ndash; их попросту нет.</p>\r\n\r\n<p>Наше предложение уникально, ведь другие подобные компании раскручивают вашу страницу или группу при помощи ботов, что не даст итогового результата. Если даже работа производится &laquo;чисто&raquo; и эффективно, то с вас запросят заоблачную сумму, которая заставит задуматься &ndash; а стоит ли шкурка вычинки?</p>\r\n\r\n<p>Наш сервис избавит вас от подобного рода размышлений. Всё совершенно бесплатно и прозрачно. Учтите, что бесплатная основа сервиса работает в качестве акции, а потому следует спешить, дабы попасть в число счастливчиков, который попросту повезло оказаться среди первых, кто ощутит на себе преимущества нашего уникального проекта.</p>\r\n\r\n<p>И вот теперь самое время вам узнать более конкретно о том, что же вам предстоит сделать. Прежде всего, понадобится пройти несложную процедуру входа на сайт. Для этого не понадобится регистрироваться или указывать свои личные данные со страницы Вконтакте, так что всё совершенно надёжно и безопасно. Когда вы справились с этой задачей, нужно поработать над тем, чтобы собрать некоторое количество лайков на свой баланс. Всё очень просто &ndash; вы увидите предложенные страницы других пользователей Вконтакте, на которых будет необходимо поставить &laquo;сердечко&raquo;. Сколько вы поставите сердечек, столько и попадёт на ваш персональный счёт! Посчитав, что вы собрали уже достаточное количество лайков, вы можете их разместить на своей странице. Чтобы это произошло, нажмите на кнопку &laquo;Накрутить &laquo;Мне нравится&raquo; наверху страницы, после чего укажите, на какую именно страницу Вконтакте должны отправляться сердечки. Сделав это, просто подождите, когда заветные лайки окажутся на указанной странице! Как видите, мы не обманывали вас, говоря о том, что всё предельно просто.</p>\r\n\r\n<p>Опять же, все полученные вами &laquo;сердечки&raquo; будут от реальных пользователей. Они, точно так же, как и вы, будут ставить лайки на указанные страницы, среди которых расположится и ваша.</p>\r\n\r\n<p>Ну что, доводилось вам видеть что-то подобное? Уверяем, что вы не найдёте аналогичный сервис на бесплатной основе нигде!</p>\r\n',0,'2013-02-19 19:36:40','2013-03-06 22:29:04'),(2,'Группа станет прибыльной','<p>В статье пойдёт речь о том, зачем нужно раскручивать группы Вконтате и о конкурентных преимуществах сервиса по раскрутке групп Вконтакте, Будут рассмотрены недостатки раскрутки групп другими способами, которые в своей совокупности делают описываемый сервис действительно уникальным.&nbsp;</p>\r\n','<p>Сайт Вконтакте &ndash; это не только место для общения, но ещё и шанс удачно и быстро продвинуть свой товар на рынок. Сделать это, вроде бы, достаточно просто &ndash; создайте собственную группу, в которой бы появилась возможность размещать информацию о товаре с достаточной регулярностью. Разумеется, это просто, если знать, как можно провернуть описанную выше операцию быстро. Самостоятельно, что называется, &laquo;раскрутить&raquo; группу Вконтакте крайне сложно, потому что придётся вручную приглашать в неё всё новых и новых посетителей. Поверьте, это действительно серьёзный труд, который далеко не каждому под силу. Вот и получается, что изначальная простота мероприятия оборачивается множественными осложнениями, отнимающими у вас время, которое теоретически может быть потрачено с куда большей пользой.</p>\r\n\r\n<p>Но как же другие группы раскручиваются в сжатые сроки? Что следует предпринять, чтобы покупателей товара становилось всё больше за счёт сайта Вконтакте, а вы при этом не прикладывали никаких усилий? Ответ на этот вопрос чаще всего связан с так называемыми &laquo;ботскими&raquo; программами. Для тех, кто не знает, что они собой представляют, поясним &ndash; это специальное программное устройство, которое искусственно создаёт множество учётных записей Вконтакте и добавляет их в указанную группу. То есть, формально число подписчиков группы растёт, но на деле это не приносит вам ровно никакой пользы. Нет, теоретически это может помочь поднять группу в рейтинге, но специальная система сканирования групп на предмет выявления ботов тут же нивелирует заработанное преимущество и ваша задумка, по сути, потерпит крах.</p>\r\n\r\n<p>До недавнего времени проблема быстрой раскрутки групп не имела решения, однако теперь появился совершенно уникальный сервис, при помощи которого любой сможет быстро и легально продвинуть свою собственную группу Вконтакте. Наше предложение заключается в следующем &ndash; вы становитесь пользователем нашего сайта и за минимальную сумму сможете приобрести у нас для своей группы столько РЕАЛЬНЫХ подписчиков, сколько сами пожелаете! Ваша группа не только поднимется в рейтинге, но и станет реально действующей, то есть, приносящей прибыль.</p>\r\n\r\n<p>Схема работы нашего сайта предельно проста &ndash; мы помогаем взаимодействовать множеству пользователей Вконтакте предельно выгодно для каждого из них. То есть, за вступление в вашу группу пользователь получит определённое количество лайков, подписчиков и т.д. Но вас это волновать не будет &ndash; это исключительно наша работа. Вам достаточно сказать нам, какую именно группу вы хотите раскрутить Вконтакте, и наблюдать за тем, как она в считанные дни взлетает в топ-5 запросов по группам на этом сайте. При этом вы ни за что не столкнётесь с опасностью уничтожения прогресса подъёма в рейтинге из-за наводнения группы фейковыми аккаунтами. В группах, которые раскручиваем мы, число &laquo;ботов&raquo; равно 0!</p>\r\n\r\n<p>Как видите, всё предельно прозрачно, просто и доступно для каждого. Потому успешность вашей группы Вконтакте зависит исключительно от вас и вашей решимости продвигать свой продукт на рынок!&nbsp;</p>\r\n',0,'2013-02-19 19:37:12','2013-03-06 22:31:57'),(3,'Lorem ipsum','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci fel','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.\r\n',0,'2013-02-19 19:37:24','2013-02-19 19:46:56');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Вопрос номер 1','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.\r\n',0,'2013-02-19 17:30:03','2013-02-19 18:50:42'),(3,'Вопрос номер 2','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.',0,'2013-02-19 18:50:27','2013-02-19 18:50:47');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130217211021'),('20130217231823'),('20130218110101'),('20130218114111'),('20130218124329'),('20130218130350'),('20130219151619'),('20130219165755'),('20130219172806'),('20130219192136'),('20130220141325'),('20130222211453'),('20130223205316'),('20130306175717');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'app_name','Like for me','2013-02-17 23:54:48','2013-03-05 20:59:55'),(2,'access_token','97e0897665cc575d331151807a7735bcb969f6296e2ddb0cf8f0b2f8be161f18a89586e43bf7ff9a27878','2013-03-06 14:56:26','2013-03-06 15:02:26');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_users`
--

DROP TABLE IF EXISTS `site_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_users`
--

LOCK TABLES `site_users` WRITE;
/*!40000 ALTER TABLE `site_users` DISABLE KEYS */;
INSERT INTO `site_users` VALUES (1,'vkontakte','4707790','Валентин Гимранов',2,'1989-08-06',595,'2013-03-05 20:32:51','2013-03-13 19:08:33');
/*!40000 ALTER TABLE `site_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_orders`
--

DROP TABLE IF EXISTS `subscribe_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_orders`
--

LOCK TABLES `subscribe_orders` WRITE;
/*!40000 ALTER TABLE `subscribe_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textpages`
--

DROP TABLE IF EXISTS `textpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textpages`
--

LOCK TABLES `textpages` WRITE;
/*!40000 ALTER TABLE `textpages` DISABLE KEYS */;
INSERT INTO `textpages` VALUES (2,'Инструкция','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.\r\n','howto',0,'2013-02-18 14:22:03','2013-02-19 19:17:40'),(3,'Услуги','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.\r\n','services',0,'2013-02-18 14:31:00','2013-02-19 19:17:59');
/*!40000 ALTER TABLE `textpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gimranov.valentin@yandex.ru','$2a$10$En.qzTxW5BH00eP6p2ceRePmSkpxo4bj3Pwxy8dd01OvuI.rVCQj.',NULL,NULL,NULL,2,'2013-02-17 21:38:54','2013-02-17 21:14:24','127.0.0.1','127.0.0.1','2013-02-17 21:14:24','2013-02-17 21:38:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-14  0:06:31
