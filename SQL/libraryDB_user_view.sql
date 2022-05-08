CREATE VIEW `user_view` AS
    SELECT `users`.`user_id`,
        `users`.`user_name` AS 'Name',
        `users`.`user_phone_number` AS 'Phone_number',
        `users`.`user_email` AS 'Email_address',
        `users`.`user_type` AS 'User_type',
        `address`.`address_number` AS 'Street_number',
        `address`.`address_street` AS 'Street',
        `address`.`address_city` AS 'City',
        `address`.`address_state` AS 'State',
        `address`.`address_zip` AS 'ZIP_code'
    FROM `users`
    INNER JOIN `address`
        ON `users`.`address_id` = `address`.`address_id`
;