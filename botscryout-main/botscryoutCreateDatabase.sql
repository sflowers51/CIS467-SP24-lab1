CREATE SCHEMA `BotsCryOut`;
USE `BotsCryOut`;
CREATE TABLE `Prayers` (
  `prayerID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `prompt` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `coverImage` varchar(255) DEFAULT null,
  `audioRecitation` varchar(255) DEFAULT null,
  `aiCreator` varchar(255)
);

CREATE TABLE `Scriptures` (
  `scriptureID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `verses` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `PrayersScriptures` (
  `prayersScriptureID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `scriptureID` integer,
  `prayerID` integer
);

CREATE TABLE `PrayersTags` (
  `prayerTagID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `tagID` integer,
  `prayerID` integer
);

CREATE TABLE `Tags` (
  `tagID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `tagDescription` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `Users` (
  `userID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `PrayersCreators` (
  `prayersCreatorID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `userID` integer,
  `prayerID` integer
);

CREATE TABLE `Likes` (
  `likedID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `prayerID` integer,
  `userID` integer,
  `likedTime` datetime NOT NULL
);

CREATE TABLE `Saves` (
  `savedID` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `prayerID` integer,
  `userID` integer,
  `savedTime` datetime NOT NULL
);

ALTER TABLE `Saves` ADD FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

ALTER TABLE `Likes` ADD FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

ALTER TABLE `PrayersCreators` ADD FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

ALTER TABLE `Saves` ADD FOREIGN KEY (`prayerID`) REFERENCES `Prayers` (`prayerID`);

ALTER TABLE `Likes` ADD FOREIGN KEY (`prayerID`) REFERENCES `Prayers` (`prayerID`);

ALTER TABLE `PrayersCreators` ADD FOREIGN KEY (`prayerID`) REFERENCES `Prayers` (`prayerID`);

ALTER TABLE `PrayersScriptures` ADD FOREIGN KEY (`prayerID`) REFERENCES `Prayers` (`prayerID`);

ALTER TABLE `PrayersTags` ADD FOREIGN KEY (`prayerID`) REFERENCES `Prayers` (`prayerID`);

ALTER TABLE `PrayersScriptures` ADD FOREIGN KEY (`scriptureID`) REFERENCES `Scriptures` (`scriptureID`);

ALTER TABLE `PrayersTags` ADD FOREIGN KEY (`tagID`) REFERENCES `Tags` (`tagID`);

ALTER TABLE `PrayersTags` ADD CONSTRAINT `prayerTags` UNIQUE (`prayerID`, `tagID`);

ALTER TABLE `PrayersCreators` ADD CONSTRAINT `prayerCreators` UNIQUE (`prayerID`, `userID`);

ALTER TABLE `PrayersScriptures` ADD CONSTRAINT `prayerScriptures` UNIQUE (`prayerID`, `scriptureID`);

ALTER TABLE `Likes` ADD CONSTRAINT `likes` UNIQUE (`prayerID`, `userID`);

ALTER TABLE `Saves` ADD CONSTRAINT `saves` UNIQUE (`prayerID`, `userID`);

