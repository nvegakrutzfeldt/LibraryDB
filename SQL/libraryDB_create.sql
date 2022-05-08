CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(15) NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_id_UNIQUE` (`author_id`)
);

CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_number` varchar(5) NULL,
  `address_street` varchar(50) NULL,
  `address_city` varchar(20) NULL,
  `address_state` varchar(20) NULL,
  `address_zip` varchar(15) NULL,
PRIMARY KEY (`address_id`)
);

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NULL,
  `user_phone_number` varchar(20) NULL,
  `user_email` varchar(50) NULL,
  `user_password` varchar(20) NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user',
  `address_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  CONSTRAINT `users_fk_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
);

CREATE TABLE `books` (
  `book_isbn` bigint NOT NULL,
  `book_title` varchar(50) NULL,
  `book_description` varchar(100) NULL DEFAULT 'No description',
  `book_amount_owned` int NULL DEFAULT 1,
  `book_publisher` varchar(30) NULL,
  `book_call_number` varchar(50) NULL,
  PRIMARY KEY (`book_isbn`),
  UNIQUE KEY `book_isbn_UNIQUE` (`book_isbn`)
);

CREATE TABLE `book_author` (
  `author_id` int NOT NULL,
  `book_isbn` bigint NOT NULL,
  PRIMARY KEY (`author_id`,`book_isbn`),
  KEY `book_isbn_idx` (`book_isbn`),
  CONSTRAINT `book_author_fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `book_author_fk_book_isbn` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`book_isbn`)
);

CREATE TABLE `borrowed_book` (
  `borrow_id` int NOT NULL AUTO_INCREMENT,
  `borrow_date` date NOT NULL DEFAULT (CURRENT_DATE),
  `user_id` int NOT NULL,
  `book_isbn` bigint NOT NULL,
  PRIMARY KEY (`borrow_id`),
  UNIQUE KEY `borrow_id_UNIQUE` (`borrow_id`),
  KEY `borrowed_book_fk_user_id_idx` (`user_id`),
  KEY `borrowed_book_fk_book_isbn_idx` (`book_isbn`),
  CONSTRAINT `borrowed_book_fk_book_isbn` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`book_isbn`),
  CONSTRAINT `borrowed_book_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);

CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(30) NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_id_UNIQUE` (`genre_id`)
);

CREATE TABLE `book_genre` (
  `genre_id` int NOT NULL,
  `book_isbn` bigint NOT NULL,
  PRIMARY KEY(`genre_id`, `book_isbn`),
  CONSTRAINT `book_genre_fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`),
  CONSTRAINT `book_genre_fk_book_isbn` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`book_isbn`)
);