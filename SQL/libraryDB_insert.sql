INSERT INTO `publishers`(`publisher_id`, `publisher_name`)
VALUES
    (0, 'Dark Night Publishing'),
    (1, 'Skybound Publishing'),
    (2, 'Adventure Publishing'),
    (3, 'Royal Publishing'),
    (4, 'Coffee House Publishing');
INSERT INTO `books`(`book_isbn`, `book_title`, `book_description`, `book_amount_owned`, `publisher_id`)
VALUES
    (000000000000, 'It', "Stephen King's 22nd novel", 5, 0),
    (000000000001, 'The Shining', "Stephen King's 3rd novel", 7, 1),
    (000000000002, 'The Talisman', "Stephen King's 16th novel", 2, 2),
    (000000000003, "Harry Potter and the Sorcerer's Stone", "The first book in the Harry Potter Series", 12, 3),
    (000000000004, 'Harry Potter and the Goblet of Fire', "The fourth book in the Harry Potter Series", 10, 3),
    (000000000005, '1984', "A chilling depiction of a tyrannical government born from modern ideologies", 8, 4);

INSERT INTO `genres`(`genre_id`, `genre_name`)
VALUES
    (0, 'Fiction'),
    (1, 'Horror'),
    (2, 'Fantasy'),
    (3, "Children's"),
    (4, 'Dystopian');

INSERT INTO `book_genre`(`genre_id`, `book_isbn`)
VALUES
    (0, 000000000000),
    (0, 000000000001),
    (0, 000000000002),
    (0, 000000000003),
    (0, 000000000004),
    (0, 000000000005),
    (1, 000000000000),
    (1, 000000000001),
    (1, 000000000002),
    (2, 000000000003),
    (2, 000000000004),
    (3, 000000000003),
    (3, 000000000004),
    (4, 000000000005);

INSERT INTO `authors`(`author_id`, `author_name`)
VALUES
    (0, 'Stephen King'),
    (1, 'Peter Straub'),
    (2, 'J.K. Rowling'),
    (3, 'George Orwell');

INSERT INTO `book_author`(`author_id`, `book_isbn`)
VALUES
    (0, 000000000000),
    (0, 000000000001),
    (0, 000000000002),
    (1, 000000000002),
    (2, 000000000003),
    (2, 000000000004),
    (3, 000000000005);

INSERT INTO `users`(`user_id`, `user_name`, `user_phone_number`, `user_email`, `user_password`, `user_type`, `user_address`, `user_city`, `user_state`, `user_zip`)
VALUES
    (0, 'Annie May', '18003334444', 'annmay@gmail.com', 'password', 'staff', '1 1st street', 'Little Rock', 'KS', 12345),
    (1, 'Joe Schmoe', '18001234567', 'joemoe@gmail.com', 'password1', 'staff', '2 2nd street', 'Little Rock', 'KS', 12345),
    (2, 'Luke Atmey', '18009310463', 'lookatme@gmail.com', 'password12', 'user', '3 3rd street', 'Little Rock', 'KS', 12345),
    (3, 'Will Powers', '18006638299', 'wpowers@gmail.com', 'password123', 'user', '4 4th street', 'Little Rock', 'KS', 12345),
    (4, 'Winston Payne', '18009375216', 'winstonp@gmail.com', 'password1234', 'user', '5 5th street', 'Little Rock', 'KS', 12345);

INSERT INTO `borrowed_book`(`borrow_id`, `borrow_date`, `borrow_late_fine`, `user_id`, `book_isbn`)
VALUES
    (0, '2022-02-18 13:21:14', 1, 2, 000000000003),
    (1, '2022-02-19 08:12:01', 1, 2, 000000000004),
    (2, '2022-02-15 18:22:19', 1, 3, 000000000002),
    (3, '2022-03-19 17:47:55', 1, 3, 000000000001),
    (4, '2022-04-26 05:25:55', 1, 4, 000000000002),
    (5, '2022-02-16 12:23:03', 1, 4, 000000000005);