CREATE VIEW `borrowed_books_view` AS
    SELECT `borrowed_book`.`borrow_id`,
        `users`.`user_name` AS 'Name',
        `books`.`book_title` AS 'Title',
        `books`.`book_isbn` AS 'ISBN',
        
        `borrowed_book`.`borrow_date`,
        (
            SELECT DATE_ADD(`borrowed_book`.`borrow_date`, INTERVAL 31 DAY)
        ) AS 'due_date',
        (
            SELECT (CURDATE() - due_date) * 0.25
            WHERE CURDATE() - due_date > 31
        ) AS 'late_fine'
    FROM `borrowed_book` JOIN `users` JOIN `books`
    ON `borrowed_book`.`user_id` = `users`.`user_id` AND `borrowed_book`.`book_isbn` = `books`.`book_isbn`
ORDER BY `users`.`user_name`;