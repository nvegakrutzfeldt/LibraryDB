CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL,
  `publisher_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `publisher_id_UNIQUE` (`publisher_id`)
);

CREATE TABLE `author` (
  `author_id` int NOT NULL,
  `author_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_id_UNIQUE` (`author_id`)
);

CREATE TABLE `journals` (
  `journal_id` int NOT NULL,
  `journal_name` varchar(100) DEFAULT NULL,
  `journal_description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journal_id_UNIQUE` (`journal_id`)
);

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `user_phone_number` int DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_city` varchar(20) DEFAULT NULL,
  `user_state` varchar(20) DEFAULT NULL,
  `user_zip` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
);

CREATE TABLE `article` (
  `article_id` int NOT NULL,
  `article_title` varchar(100) DEFAULT NULL,
  `article_edition` int DEFAULT NULL,
  `article_category` varchar(30) DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `journal_id` int DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `article_id_UNIQUE` (`article_id`),
  KEY `article_fk_journal_id_idx` (`journal_id`),
  KEY `article_fk_publisher_id_idx` (`publisher_id`),
  CONSTRAINT `article_fk_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`),
  CONSTRAINT `article_fk_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`)
);

CREATE TABLE `books` (
  `book_isbn` int NOT NULL,
  `book_title` varchar(50) DEFAULT NULL,
  `book_genre` varchar(30) DEFAULT NULL,
  `book_description` varchar(100) DEFAULT NULL,
  `book_available_quantity` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  PRIMARY KEY (`book_isbn`),
  UNIQUE KEY `book_isbn_UNIQUE` (`book_isbn`),
  KEY `publisher_id_idx` (`publisher_id`),
  CONSTRAINT `books_fk_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`)
);

CREATE TABLE `book_author` (
  `author_id` int NOT NULL,
  `book_isbn` int NOT NULL,
  PRIMARY KEY (`author_id`,`book_isbn`),
  KEY `book_isbn_idx` (`book_isbn`),
  CONSTRAINT `book_author_fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `book_author_fk_book_isbn` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`book_isbn`)
);

CREATE TABLE `article_author` (
  `author_id` int NOT NULL,
  `article_id` int NOT NULL,
  PRIMARY KEY (`author_id`,`article_id`),
  KEY `article_author_fk_article_id_idx` (`article_id`),
  CONSTRAINT `article_author_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `article_author_fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
);

CREATE TABLE `borrowed_book` (
  `borrow_id` int NOT NULL,
  `borrow_date` datetime DEFAULT NULL,
  `borrow_late_fine` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `book_isbn` int DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  UNIQUE KEY `borrow_id_UNIQUE` (`borrow_id`),
  KEY `borrowed_book_fk_user_id_idx` (`user_id`),
  KEY `borrowed_book_fk_book_isbn_idx` (`book_isbn`),
  CONSTRAINT `borrowed_book_fk_book_isbn` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`book_isbn`),
  CONSTRAINT `borrowed_book_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);