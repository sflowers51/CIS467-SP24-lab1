# Botscryout Documentation
1. Created the E-R diagram using dbdiagram.io. Normalized all the tables in the data model [botscryoutDataModel](https://github.com/LTsoccer/botscryout/blob/main/botscryoutDataModel.pdf)
The prayers table contains the information about the prayers.
The users table contains the information about the users.
The prayersCreators table is the intersection table for prayers and users to see who created a prayer. 
The prayersTags table is the intersection table for prayers and tags to see what tags are with a prayer. 
The prayersScriptures table is the intersection table for prayers and scriptures to see what scriptures are with a prayer. 
The likes table is the intersection table for prayers and users to see who liked a prayer and the time it was liked. 
The saves table is the intersection table for prayers and users to see who saved a prayer and the time it was saved. 

2. Generated the [botscryoutCreateDatabase](https://github.com/LTsoccer/botscryout/blob/main/botscryoutCreateDatabase.sql) file from the data model. Created the botscryout schema and added unique constraints for the composite keys in the file.

3. Downloaded the spreadsheet of data and split it apart to upload it into the database. Spreadsheets are in the [botscryoutData](https://github.com/LTsoccer/botscryout/tree/main/botscryoutData) folder. 
Double quotes in the prayers had to be replaced with single quotes to allow the data to be imported.

4. Exported the database with all the data inserted in the [botscryoutDatabase](https://github.com/LTsoccer/botscryout/blob/main/botscryoutDatabase.sql) file.
