SELECT `borrowed_book`.`borrow_id`,
    `books`.`book_title` AS 'Title',
    `books`.`book_isbn` AS 'ISBN',
    `users`.`user_id` ,
    `users`.`user_name` AS 'Name',
    `borrowed_book`.`borrow_date`,
    (
        SELECT DATE_ADD(`borrowed_book`.`borrow_date`, INTERVAL 31 DAY)
    ) AS 'due_date',
    `borrowed_book`.`borrow_late_fine` AS 'late_fine_per_day'
FROM `borrowed_book` JOIN `users` JOIN `books`
ON `borrowed_book`.`user_id` = `users`.`user_id` AND `borrowed_book`.`book_isbn` = `books`.`book_isbn`;