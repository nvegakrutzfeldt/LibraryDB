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