# ************************************************************
# Database: minion
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` enum('journalist','editor','admin') NOT NULL DEFAULT 'journalist',
  `login` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;

INSERT INTO `admin_user` (`id`, `role`, `login`, `email`, `name`, `password`, `active`)
VALUES
	(1,'admin','admin','admin@localhost','Admin Name','$2y$10$AgDvbucEVa46YdOyHKq5gOYgWTfsF2PpASkCUm5St7OVIJi5PMLDC',1),
	(2,'admin','stuart','stuart@localhost','Stuart','$2y$10$AgDvbucEVa46YdOyHKq5gOYgWTfsF2PpASkCUm5St7OVIJi5PMLDC',1);

/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_configuration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_configuration`;

CREATE TABLE `cms_configuration` (
  `key` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cms_configuration` WRITE;
/*!40000 ALTER TABLE `cms_configuration` DISABLE KEYS */;

INSERT INTO `cms_configuration` (`key`, `value`)
VALUES
	('ADMIN_EMAIL','minion@localhost'),
	('DEBUG_MODE','1'),
	('PROFILER','1'),
	('TECHNICAL_WORKS','0'),
	('WIDGETS_CACHE','1');

/*!40000 ALTER TABLE `cms_configuration` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `primary` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iso` (`iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;

INSERT INTO `language` (`id`, `iso`, `locale`, `name`, `short_name`, `url`, `sortorder`, `primary`)
VALUES
	(1,'en','en_EN','English','Eng','en',1,'1');

/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;

INSERT INTO `page` (`id`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'index','2014-08-03 15:18:47','2016-12-28 15:15:22'),
	(2,'contacts','2014-08-03 22:25:13','2016-12-28 13:46:55');

/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page_translate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_translate`;

CREATE TABLE `page_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `lang` (`lang`),
  CONSTRAINT `page_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `page_translate` WRITE;
/*!40000 ALTER TABLE `page_translate` DISABLE KEYS */;

INSERT INTO `page_translate` (`id`, `foreign_id`, `lang`, `key`, `value`)
VALUES
	(1,1,'en','title','Homepage'),
	(2,1,'en','meta_title','Homepage'),
	(3,1,'en','meta_description','meta-description of homepage'),
	(4,1,'en','meta_keywords',''),
	(5,1,'en','text','<h1 style=\"text-align: center;\">Minion CMS</h1>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\">Minion CMS - Written in <a href=\"http://phalconphp.com/\" target=\"_blank\" rel=\"noopener noreferrer\">Phalcon PHP Framework</a>&nbsp;(version 3.x). Inherit from <a href=\"https://github.com/oleksandr-torosh/yona-cms\">YonaCMS</a>, but structure folder look like <a href=\"https://github.com/laravel/laravel\">Laravel</a></p>\r\n<p style=\"text-align: center;\">The official repository on&nbsp;<a href=\"https://github.com/vietdien2005/minion-phalcon\" target=\"_blank\" rel=\"noopener noreferrer\">Github</a></p>\r\n<h2>&nbsp;</h2>'),
	(6,2,'en','title','Contacts'),
	(7,2,'en','meta_title','Contacts'),
	(8,2,'en','meta_description','this is my contact'),
	(9,2,'en','meta_keywords','contact'),
	(10,2,'en','text','<h1 style=\"text-align: center;\">Contacts</h1>\r\n<p style=\"text-align: center;\">Github:&nbsp;<a href=\"https://github.com/vietdien2005\">https://github.com/vietdien2005</a></p>\r\n<p style=\"text-align: center;\">Gmail: <a href=\"mailto:damviet112@gmail.com\">damviet112@gmail.com</a></p>\r\n<p style=\"text-align: center;\">Facebook:&nbsp;<a href=\"https://www.facebook.com/damviet92\">https://www.facebook.com/damviet92</a></p>\r\n<p style=\"text-align: center;\">Website: <a href=\"/page/admin/edit/vietdien2005.github.io\">vietdien2005.github.io</a></p>');

/*!40000 ALTER TABLE `page_translate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table publication
# ------------------------------------------------------------

DROP TABLE IF EXISTS `publication`;

CREATE TABLE `publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `preview_inner` enum('1','0') DEFAULT '1',
  `preview_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;

INSERT INTO `publication` (`id`, `type_id`, `slug`, `created_at`, `updated_at`, `date`, `preview_inner`, `preview_src`)
VALUES
	(1,1,'laravel-5-5-will-required-php-7-0','2014-08-22 10:33:26','2016-12-28 11:11:16','2016-12-27 00:00:00','0','img/original/publication/0/1.jpg'),
	(2,1,'laravel-elixir-will-be-reanamed-to-laravel-mix','2014-08-22 10:42:08','2016-12-28 11:10:15','2016-12-27 00:00:00','0','img/original/publication/0/2.jpg'),
	(3,2,'laravel-dusk-is-coming-to-laravel-5-4','2014-11-05 18:00:20','2016-12-28 11:09:18','2014-11-05 00:00:00','1','img/original/publication/0/3.jpg'),
	(4,2,'changes-coming-to-the-laravel-release-cycle','2014-11-06 18:23:17','2016-12-28 11:23:20','2014-11-06 00:00:00','1','img/original/publication/0/4.jpg'),
	(5,1,'leanpub-announces-a-new-pricing-model','2015-04-29 10:42:49','2016-12-28 17:01:43','2016-12-27 00:00:00','0','img/original/publication/0/5.jpg');

/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table publication_translate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `publication_translate`;

CREATE TABLE `publication_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `lang` (`lang`),
  CONSTRAINT `publication_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publication_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `publication_translate` WRITE;
/*!40000 ALTER TABLE `publication_translate` DISABLE KEYS */;

INSERT INTO `publication_translate` (`id`, `foreign_id`, `lang`, `key`, `value`)
VALUES
	(1,1,'en','title','Laravel 5.5 will require PHP 7.0+'),
	(2,1,'en','meta_title','Laravel 5.5 will require PHP 7.0+'),
	(3,1,'en','meta_description',''),
	(4,1,'en','meta_keywords',''),
	(5,1,'en','text','<p>Laravel has always been a framework that isn&rsquo;t afraid to push forward and Taylor just announced on Twitter that Laravel 5.5 will require PHP 7+.</p>\r\n<p>&nbsp;The 5.5 release is not scheduled until July of 2017 so it&rsquo;s still months away, however, it&rsquo;s a good idea to start thinking about upgrading your servers if you are still running PHP 5.x.</p>\r\n<p>Outside of the new developer features PHP 7.0 introduces, it also includes speed improvements that will save your company money. Tumblr recently moved to PHP 7 and they reported:</p>\r\n<p style=\"padding-left: 30px;\"><em>Almost immediately saw the latency drop by half, and the CPU load on the servers decrease at least 50%, often more. Not only were our servers serving pages twice as fast, they were doing it using half the amount of CPU resources.</em></p>\r\n<p>If your code base hasn&rsquo;t started the transition to PHP 7 yet, the official PHP docs has a great migration guide that includes everything you need to check before moving. For those running Laravel v5 and higher then upgrading should be a relatively painless process since it already runs on the latest PHP version.</p>'),
	(6,2,'en','title','Laravel Elixir Will Be Renamed To Laravel Mix'),
	(7,2,'en','meta_title','Laravel Elixir Will Be Renamed To Laravel Mix'),
	(8,2,'en','meta_description',''),
	(9,2,'en','meta_keywords',''),
	(10,2,'en','text','<p>Laravel Elixir first came out in October of 2014 and aimed to make automating concatenation, and general file watching easier than setting it up manually. Built on top of Gulp as a wrapper to remove all the difficult parts it has been a popular addition to Laravel.</p>\r\n<p>The next version of Laravel Elixir is changing the underlying system and will be built on Webpack, instead of Gulp. This will replace the plugin ecosystem, and because of such a significant change, it was time to rename the package.</p>\r\n<p>The new name is Laravel Mix, and it should be released along with Laravel 5.4.</p>\r\n<p>If you have been using the default Elixir then switching should be simple and just require updating or moving over your gulp file to the new setup. Of course, complete documentation will be included in the official release.</p>\r\n<p>For more information on Webpack, they have an excellent high level overview of the concepts behind the system.</p>'),
	(11,3,'en','title','Laravel Dusk Is Coming to Laravel 5.4'),
	(12,3,'en','meta_title','Laravel Dusk Is Coming to Laravel 5.4'),
	(13,3,'en','meta_description',''),
	(14,3,'en','meta_keywords',''),
	(15,3,'en','text','<p>When you write end-to-end tests, Laravel provides a set of useful helper methods which make it easy to click a link, fill an input field, or submit a form. Under the hood, Laravel uses the Symfony BrowserKit component to simulate the behavior of the web browser. However, if your app uses JavaScript and AJAX to load the page, BrowserKit will not work for you.</p>\r\n<p>Laravel Dusk is a new tool that will be introduced in Laravel 5.4 to solve this problem.</p>\r\n<p>Dusk is an end-to-end browser testing tool for JavaScript enabled applications. It aims to provide the right way to do page interaction tests, so you can use Dusk for things like click buttons/links, fill out forms, and even drag and drop!</p>\r\n<p>Dusk is utilizing ChromeDriver and Facebook Php-webdriver for doing end-to-end tests. It can work with any Selenium browser, but it comes with ChromeDriver by default which will save you from installing JDK or Selenium. It makes Dusk very easy to use without the need to go through the tough process of setting up Selenium and starting the server every time. Furthermore, Taylor Otwell mentions Dusk tests are running faster than Selenium.</p>\r\n<p>Dusk will be more natural than BrowserKit; you don&rsquo;t have to wait on something to finish or use sleeping and pausing while waiting for things to appear. Instead, Dusk allows you to wait for some condition to be true in your JavaScript or wait for CSS selectors to be available to have a better way to test JavaScript enabled applications.</p>\r\n<p>Also, Dusk will save screenshots of your failed tests automatically! You can see what the page looked like and what went wrong.</p>\r\n<p>Another nice feature is that it will provide handy helper methods like loginAs, which allows you to give it a user instance.t will log the user in, and the test will go straight to any authenticated URL directly without going through the login screen every time.</p>\r\n<p>Dusk will allow you to open multiple browser windows per test which will make it easy to test apps which have socket integration.You can open two windows and interact with the first and see the result in the second.</p>\r\n<p>Otwell has also provided some information about the Dusk testing environment; your app root will contain a .env.dusk file to define your testing environment. To run your Dusk test, you will not use PHPUnit directly. Instead, you will call a Dusk artisan command which will proxy down to PHPUnit and backup your .env file. Then, it will move the .env.dusk file to be the environment being used for your Dusk test. When finished, it will restore your real .env file back to its place.</p>\r\n<p>Note that you can use the old BrowserKit testing if you have an app using Laravel 5.3 and want to upgrade to 5.4 without losing your current tests. The Laravel BrowserKit Testing package will provide the Laravel 5.3 style &ldquo;BrowserKit&rdquo; testing on Laravel 5.4.</p>'),
	(16,4,'en','title','Changes coming to the Laravel release cycle'),
	(17,4,'en','meta_title','Changes coming to the Laravel release cycle'),
	(18,4,'en','meta_description',''),
	(19,4,'en','meta_keywords',''),
	(20,4,'en','text','<p>Back in 2013, Taylor announced Laravel&rsquo;s official release cycle where each year includes two releases. The first in June and the second in December.</p>\r\n<p>Yesterday, Taylor announced on Twitter that this is going to be changing to a January and July cycle, pushing each release out a month from its current schedule.</p>\r\n<p>This has two primary advantages for the development team and the first is it allows more time for testing after Symfony&rsquo;s release. The second advantage is it&rsquo;ll better coincide with Laracon, the yearly Laravel conference.</p>\r\n<p>For most of the users of Laravel, this will not affect much, Laravel 5.4 will be pushed out one month to launch in January. Then it&rsquo;ll be back to the normal six-month release cycle with the next one coming in July.</p>'),
	(21,5,'en','title','Leanpub announces a new pricing model'),
	(22,5,'en','meta_title','Leanpub announces a new pricing model'),
	(23,5,'en','meta_description',''),
	(24,5,'en','meta_keywords',''),
	(25,5,'en','text','<p>Leanpub is home to many books on Laravel including Easy E-Commerce that I co-authored. Today they have announced a pricing change for all publishers using the service. Creating a book with Leanpub is now $100 per book.</p>\r\n<p style=\"padding-left: 30px;\"><em>Today we are changing the pricing of Leanpub. Until now, Leanpub has been totally free for authors to use. We have earned all of our money from our portion of the storefront revenue. (After the author royalties, PayPal fees and chargeback costs, our gross margin on the storefront is about 8% &ndash; for every $100 of book sales on Leanpub, we earn about $8.) </em></p>\r\n<p>They are also keeping the existing fee structure of keeping 10% and 50 cents per paid sale. However, you are not required to use them as a selling agent. All books created with the service can be sold through your own site. Plus they are also giving discounts to existing authors:</p>\r\n<p style=\"padding-left: 30px;\"><em>We want to reward loyal authors who support Leanpub through their storefront sales. So, we have two discounts based on lifetime royalties earned across all your Leanpub books. Once you&rsquo;ve earned at least $1,000 in royalties, creating a new book costs $49 per book. Once you&rsquo;ve earned at least $10,000 in royalties, creating a new book is free. Hundreds of Leanpub authors will immediately qualify for one of these discounts, and we hope thousands more do in future.</em></p>\r\n<p>I imagine this move will dampen free book authors from using the service but I think this is a good change because I&rsquo;ve seen some write their books with the Leanpub system and then sell it completely through other sites.</p>');

/*!40000 ALTER TABLE `publication_translate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table publication_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `publication_type`;

CREATE TABLE `publication_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) DEFAULT NULL,
  `limit` int(4) DEFAULT NULL,
  `format` enum('list','grid') DEFAULT NULL,
  `display_date` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `publication_type` WRITE;
/*!40000 ALTER TABLE `publication_type` DISABLE KEYS */;

INSERT INTO `publication_type` (`id`, `slug`, `limit`, `format`, `display_date`)
VALUES
	(1,'news',3,'grid','1'),
	(2,'articles',3,'list','0');

/*!40000 ALTER TABLE `publication_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table publication_type_translate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `publication_type_translate`;

CREATE TABLE `publication_type_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `lang` (`lang`),
  CONSTRAINT `publication_type_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publication_type_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `publication_type_translate` WRITE;
/*!40000 ALTER TABLE `publication_type_translate` DISABLE KEYS */;

INSERT INTO `publication_type_translate` (`id`, `foreign_id`, `lang`, `key`, `value`)
VALUES
	(1,1,'en','title','News'),
	(2,1,'en','head_title','News'),
	(3,1,'en','meta_description',''),
	(4,1,'en','meta_keywords',''),
	(5,1,'en','seo_text',''),
	(6,2,'en','title','Articles'),
	(7,2,'en','head_title','Articles'),
	(8,2,'en','meta_description',''),
	(9,2,'en','meta_keywords',''),
	(10,2,'en','seo_text','');

/*!40000 ALTER TABLE `publication_type_translate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translate`;

CREATE TABLE `translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) DEFAULT NULL,
  `phrase` varchar(500) DEFAULT NULL,
  `translation` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`),
  CONSTRAINT `translate_ibfk_1` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `translate` WRITE;
/*!40000 ALTER TABLE `translate` DISABLE KEYS */;

INSERT INTO `translate` (`id`, `lang`, `phrase`, `translation`)
VALUES
	(1,'en','Form validation fails','Form validation fails'),
	(2,'en','Read more','Read more'),
	(3,'en','Back to the publications list','Back to the publications list'),
	(4,'en','SITE NAME','Minion CMS'),
	(5,'en','Home','Home'),
	(6,'en','News','News'),
	(7,'en','Contacts','Contacts'),
	(8,'en','Articles','Articles'),
	(9,'en','Home','Home'),
	(10,'en','News','News'),
	(11,'en','Articles','Articles'),
	(12,'en','Contacts','Contacts'),
	(13,'en','Admin','Admin'),
	(14,'en','YonaCms Admin Panel','YonaCms Admin Panel'),
	(15,'en','Back to publications list','Back to publications list'),
	(16,'en','Page num.','Page num.'),
	(17,'en','Full version','Full version'),
	(18,'en','Mobile version','Mobile version'),
	(19,'en','Services','Services'),
	(20,'en','Printing','Printing'),
	(21,'en','Design','Design'),
	(22,'en','Latest news','Latest news'),
	(23,'en','Entries not found','Entries not found'),
	(24,'en','Back to publications list','Back to publications list'),
	(25,'en','More','More'),
	(26,'en','Error form validation','Error form validation'),
	(27,'en','Page number','Page number');

/*!40000 ALTER TABLE `translate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table widget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widget`;

CREATE TABLE `widget` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `html` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;

INSERT INTO `widget` (`id`, `title`, `html`)
VALUES
	('homepage','Text Homepage','<span class=\"name\">Bello !! I\'m Stuart </span> ');

/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
