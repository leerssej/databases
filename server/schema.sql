DROP DATABASE IF EXISTS chat;

CREATE DATABASE chat;

USE chat;
-- ---
-- Table 'messages'
-- 
-- ---

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` INTEGER AUTO_INCREMENT,
  `user_id` INTEGER,
  `room_id` INTEGER,
  `message` TEXT,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`)
);

-- -- ---
-- -- Table 'usernames'
-- -- 
-- -- ---

DROP TABLE IF EXISTS `usernames`;
		
CREATE TABLE `usernames` (
  `id` INTEGER AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY (`id`)
);

-- -- ---
-- -- Table 'rooms'
-- -- 
-- -- ---

DROP TABLE IF EXISTS `rooms`;
		
CREATE TABLE `rooms` (
  `id` INTEGER AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY (`id`)
);


-- -- ---
-- -- Table 'friends'
-- -- 
-- -- ---

DROP TABLE IF EXISTS `friends`;
		
CREATE TABLE `friends` (
  `id` INTEGER AUTO_INCREMENT,
  `user_id` INTEGER,
  `friend_id` INTEGER,
  PRIMARY KEY (`id`)
);

-- -- ---
-- -- Foreign Keys 
-- -- ---

ALTER TABLE `messages` ADD FOREIGN KEY (user_id) REFERENCES `usernames` (`id`);
ALTER TABLE `messages` ADD FOREIGN KEY (room_id) REFERENCES `rooms` (`id`);
ALTER TABLE `friends` ADD FOREIGN KEY (user_id) REFERENCES `usernames` (`id`);
ALTER TABLE `friends` ADD FOREIGN KEY (friend_id) REFERENCES `usernames` (`id`);


-- insurance or if multi level processing needed
-- ---
-- Table 'landing'
-- 
-- ---

DROP TABLE IF EXISTS `landing`;
		
CREATE TABLE `landing` (
  `id` INTEGER AUTO_INCREMENT,
  `username` VARCHAR(255),
  `roomname` VARCHAR(255),
  `message` TEXT,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`)
);

-- -- ---
-- -- Table Properties
-- -- ---

-- ALTER TABLE `usernames` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `friends` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- -- ---
-- -- Test Data
-- -- ---

-- INSERT INTO `usernames` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `rooms` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `messages` (`id`,`user_id`,`room_id`,`message`,`created_at`,`updated_at`) VALUES
-- ('','','','','','');
-- INSERT INTO `friends` (`id`,`user_id`,`friend_id`) VALUES
-- ('','','');


/*  Execute this file from the command line by typing:
 *    mysql -u student < server/schema.sql
 *  to create the database and the tables.*/

