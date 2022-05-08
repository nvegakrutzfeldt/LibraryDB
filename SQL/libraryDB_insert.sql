# Initial populate
INSERT INTO `books`(`book_isbn`, `book_title`, `book_description`, `book_copies_owned`, `book_publisher`, `book_call_number`)
VALUES
    ('1501175467', 'It', "Stephen King's 22nd novel", 5, 'Dark Night Publishing', 'PS3561.I483 I8 2017'),
    ('0385121679', 'The Shining', "Stephen King's 3rd novel", 7, 'Skybound Publishing', 'PZ4.K5227 Sh PS3561.I483'),
    ('9781451694918', 'The Talisman', "Stephen King's 16th novel", 2, 'Adventure Publishing', 'PS3561.I483 T3 2012'),
    ('9780545790352', "Harry Potter and the Sorcerer's Stone", "The first book in the Harry Potter Series", 12, 'Royal Publishing', 'PZ7.R79835 Har 2015'),
    ('0545582954', 'Harry Potter and the Goblet of Fire', "The fourth book in the Harry Potter Series", 10, 'Royal Publishing', 'PZ7.R79835 Hal 2013'),
    ('0791075672', '1984', "A chilling depiction of a tyrannical government born from modern ideologies", 8, 'Coffee House Publishing', 'PR6029.R8 N494 2003')
;

INSERT INTO `genres`(`genre_name`)
VALUES
    ('Fiction'),
    ('Horror'),
    ('Fantasy'),
    ('Science Fiction'),
    ('Dystopian')
;

INSERT INTO `book_genre`(`genre_id`, `book_isbn`)
VALUES
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fiction'), '1501175467'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fiction'), '0385121679'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fiction'), '9781451694918'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fiction'), '9780545790352'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fiction'), '0545582954'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fiction'), '0791075672'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Horror'), '1501175467'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Horror'), '0385121679'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Horror'), '9781451694918'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fantasy'), '9781451694918'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fantasy'), '9780545790352'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Fantasy'), '0545582954'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Science Fiction'), '0791075672'),
    ((SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Dystopian'), '0791075672')
;

INSERT INTO `authors`(`author_name`)
VALUES
    ('Stephen King'),
    ('Peter Straub'),
    ('J.K. Rowling'),
    ('George Orwell')
;

INSERT INTO `book_author`(`author_id`, `book_isbn`)
VALUES
    ((SELECT `author_id` FROM `authors` WHERE `author_name` = 'Stephen King'), '1501175467'),
    ((SELECT `author_id` FROM `authors` WHERE `author_name` = 'Stephen King'), '0385121679'),
    ((SELECT `author_id` FROM `authors` WHERE `author_name` = 'Stephen King'), '9781451694918'),
    ((SELECT `author_id` FROM `authors` WHERE `author_name` = 'Peter Straub'), '9781451694918'),
    ((SELECT `author_id` FROM `authors` WHERE `author_name` = 'J.K. Rowling'), '9780545790352'),
    ((SELECT `author_id` FROM `authors` WHERE `author_name` = 'J.K. Rowling'), '0545582954'),
    ((SELECT `author_id` FROM `authors` WHERE `author_name` = 'George Orwell'), '0791075672')
;

INSERT INTO `address`(`address_number`,`address_street`, `address_city`, `address_state`, `address_zip`)
VALUES
    ('1', '1st street', 'Little Rock', 'KS', '12345'),
    ('2', '2nd street', 'Little Rock', 'KS', '12345'),
    ('3', '3rd street', 'Little Rock', 'KS', '12345'),
    ('4', '4th street', 'Little Rock', 'KS', '12345'),
    ('5', '5th street', 'Little Rock', 'KS', '12345')
;

INSERT INTO `users`(`user_name`, `user_phone_number`, `user_email`, `user_password`, `user_type`, `address_id`)
VALUES
    ('Annie May', '18003334444', 'annmay@gmail.com', SHA1('password'), 'staff', 
        (SELECT `address_id` FROM `address` WHERE `address_number` = '1' AND `address_street` = '1st street' AND `address_city` = 'Little Rock')),
    ('Joe Schmoe', '18001234567', 'joemoe@gmail.com', SHA1('password1'), 'staff',
        (SELECT `address_id` FROM `address` WHERE `address_number` = '2' AND `address_street` = '2nd street' AND `address_city` = 'Little Rock')),
    ('Luke Atmey', '18009310463', 'lookatme@gmail.com', SHA1('password12'), 'user',
        (SELECT `address_id` FROM `address` WHERE `address_number` = '3' AND `address_street` = '3rd street' AND `address_city` = 'Little Rock')),
    ('Will Powers', '18006638299', 'wpowers@gmail.com', SHA1('password123'), 'user',
        (SELECT `address_id` FROM `address` WHERE `address_number` = '4' AND `address_street` = '4th street' AND `address_city` = 'Little Rock')),
    ('Winston Payne', '18009375216', 'winstonp@gmail.com', SHA1('password1234'), 'user',
        (SELECT `address_id` FROM `address` WHERE `address_number` = '5' AND `address_street` = '5th street' AND `address_city` = 'Little Rock'))
;

INSERT INTO `borrowed_book`(`borrow_date`, `user_id`, `book_isbn`)
VALUES
    ('2022-02-18 13:21:14', (SELECT `user_id` FROM `users` WHERE `user_name` = 'Luke Atmey'), '9780545790352'),
    ('2022-02-19 08:12:01', (SELECT `user_id` FROM `users` WHERE `user_name` = 'Luke Atmey'), '0545582954'),
    ('2022-02-15 18:22:19', (SELECT `user_id` FROM `users` WHERE `user_name` = 'Will Powers'), '9781451694918'),
    ('2022-03-19 17:47:55', (SELECT `user_id` FROM `users` WHERE `user_name` = 'Luke Atmey'), '0385121679'),
    ('2022-04-26 05:25:55', (SELECT `user_id` FROM `users` WHERE `user_name` = 'Winston Payne'), '9781451694918'),
    ('2022-02-16 12:23:03', (SELECT `user_id` FROM `users` WHERE `user_name` = 'Winston Payne'), '0791075672')
;