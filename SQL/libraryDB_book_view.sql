CREATE VIEW `book_catalog_view` AS
    (
        SELECT `books`.`book_isbn` AS 'ISBN',
            `books`.`book_title` AS 'Title',
            GROUP_CONCAT(DISTINCT `authors`.`author_name` SEPARATOR ', ') AS 'Author(s)',
            GROUP_CONCAT(DISTINCT `genres`.`genre_name` SEPARATOR ', ') AS 'Genre(s)',
            `books`.`book_description` AS 'Description',
            `books`.`book_publisher` AS 'Publisher',
            `books`.`book_amount_owned` AS 'Amount_owned',
            (
                SELECT COUNT(*)
                    FROM `borrowed_book`
                    WHERE ISBN = `borrowed_book`.`book_isbn`
            ) AS 'Amount_borrowed',
            (
                SELECT
                    (SELECT Amount_owned)
                   -(SELECT Amount_borrowed)
            ) AS 'Amount_available'
        FROM `books`
        INNER JOIN `book_author`
            ON `books`.`book_isbn` = `book_author`.`book_isbn`
        INNER JOIN `authors`
            ON `authors`.`author_id` = `book_author`.`author_id`
        INNER JOIN `book_genre`
            ON `books`.`book_isbn` = `book_genre`.`book_isbn`
        INNER JOIN `genres`
            ON `genres`.`genre_id` = `book_genre`.`genre_id`
        GROUP BY ISBN
    )
ORDER BY `books`.`book_title`;