# Search for books with 'Harry Potter' in the title
SELECT * FROM `book_catalog_view`
WHERE Title LIKE '%Harry Potter%';

# Search for books by author 'Stephen King'
SELECT * FROM `book_catalog_view`
WHERE `Author(s)` LIKE '%Stephen King%';

# Search for books in the fantasy genre
SELECT * FROM `book_catalog_view`
WHERE `Genre(s)` LIKE '%Fantasy%';

# Show books borrowed by user Luke Atmey (account view, viewable by account owner or staff)
SELECT * FROM `borrowed_books_view`
WHERE `Name` = 'Luke Atmey';

# Test insert queries

# Add new book to inventory (staff-accesible view)
INSERT INTO `genres`(`genre_name`)
    SELECT 'Non-Fiction'
    WHERE NOT EXISTS (
        SELECT `genre_name` FROM `genres`
        WHERE `genre_name` = 'Non-Fiction')
LIMIT 1;

INSERT INTO `genres`(`genre_name`)
    SELECT 'Science'
    WHERE NOT EXISTS (
        SELECT `genre_name` FROM `genres`
        WHERE `genre_name` = 'Science')
LIMIT 1;

INSERT INTO `genres`(`genre_name`)
    SELECT 'Cosmology'
    WHERE NOT EXISTS (
        SELECT `genre_name` FROM `genres`
        WHERE `genre_name` = 'Cosmology')
LIMIT 1;
INSERT INTO `authors`(`author_name`)
    VALUES ('Stephen Hawking');
INSERT INTO `books`(`book_isbn`, `book_title`, `book_description`, `book_publisher`, `book_call_number`)
    VALUES ('8432298420',
    'A Brief History of Time',
    "Award-winning Stephen Hawking book on the cosmos",
    'Experimental Publishing',
    '523.1 H392b');
INSERT INTO `book_genre`(`book_isbn`, `genre_id`)
    VALUES
        ('8432298420', 
        (SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Non-Fiction')),
        ('8432298420', 
        (SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Science')),
        ('8432298420', 
        (SELECT `genre_id` FROM `genres` WHERE `genre_name` = 'Cosmology'));
INSERT INTO `book_author`(`book_isbn`, `author_id`)
    VALUES
        ('8432298420',
        (SELECT `author_id` FROM `authors` WHERE `author_name` = 'Stephen Hawking'));

# Add more copies of existing book to inventory
UPDATE `books`
    SET `book_copies_owned` = `book_copies_owned` + 1
WHERE `book_isbn` = '8432298420';

# Remove copies of existing book from inventory
UPDATE `books`
    SET `book_copies_owned` = `book_copies_owned` - 1
WHERE `book_isbn` = '8432298420'
AND `book_copies_owned` > 0;

# Register new user
INSERT INTO `address`(`address_number`, `address_street`, `address_city`, `address_state`, `address_zip`)
SELECT
    '6', '6th street', 'Little Rock', 'KS', '12345'
WHERE NOT EXISTS (
    SELECT `address_number`, `address_street`, `address_city`, `address_state`, `address_zip` FROM `address`
    WHERE `address_number` = '6' AND
    `address_street` = '6th street' AND
    `address_city` = 'Little Rock' AND
    `address_state` = 'KS' AND
    `address_zip` = '12345'
);
INSERT INTO `users`(`user_name`, `user_phone_number`, `user_email`, `user_password`, `user_type`, `address_id`)
VALUES
    ('Joey Wheeler', '18000487774', 'jowheel@gmail.com', SHA1('12345'), 'user',
    (SELECT `address_id` FROM `address`
    WHERE `address_number` = '6' AND
    `address_street` = '6th street' AND
    `address_city` = 'Little Rock' AND
    `address_state` = 'KS' AND
    `address_zip` = '12345')
);

# Register new user with same address as existing user
INSERT INTO `address`(`address_number`, `address_street`, `address_city`, `address_state`, `address_zip`)
SELECT
    '1', '1st street', 'Little Rock', 'KS', '12345'
WHERE NOT EXISTS (
    SELECT `address_number`, `address_street`, `address_city`, `address_state`, `address_zip` FROM `address`
    WHERE `address_number` = '1' AND
    `address_street` = '1st street' AND
    `address_city` = 'Little Rock' AND
    `address_state` = 'KS' AND
    `address_zip` = '12345'
);
INSERT INTO `users`(`user_name`, `user_phone_number`, `user_email`, `user_password`, `user_type`, `address_id`)
VALUES
    ('Peter Griffin', '18009382311', 'beter@gmail.com', SHA1('familyguy'), 'user',
    (SELECT `address_id` FROM `address`
    WHERE `address_number` = '1' AND
    `address_street` = '1st street' AND
    `address_city` = 'Little Rock' AND
    `address_state` = 'KS' AND
    `address_zip` = '12345'));

# Lend/borrow a book from the library
INSERT INTO `borrowed_book` (`user_id`, `book_isbn`, `borrow_date`)
VALUES (
    3,
    '1501175467',
    CURDATE()
);
# Keep borrowing until borrow limit reached
INSERT INTO `borrowed_book` (`user_id`, `book_isbn`, `borrow_date`)
VALUES (
    3,
    '9781451694918',
    CURDATE()
);
# Should fail on this insert
INSERT INTO `borrowed_book` (`user_id`, `book_isbn`, `borrow_date`)
VALUES (
    3,
    '0791075672',
    CURDATE()
);
# Other users should be able to continue borrowing
INSERT INTO `borrowed_book` (`user_id`, `book_isbn`, `borrow_date`)
VALUES (
    4,
    '1501175467',
    CURDATE()
);