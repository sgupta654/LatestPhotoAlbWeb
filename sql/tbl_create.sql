USE group36pa3;
CREATE TABLE User (username VARCHAR(20) NOT NULL, firstname VARCHAR(20), lastname VARCHAR(20), password VARCHAR(20), email VARCHAR(40), Primary Key(username));
CREATE TABLE Album (albumid INT UNSIGNED NOT NULL AUTO_INCREMENT, title VARCHAR(50), created DATE NOT NULL, lastupdated DATE NOT NULL, username VARCHAR(20) NOT NULL, access VARCHAR(10) NOT NULL, Primary Key(albumid), CONSTRAINT fk_username Foreign Key(username) REFERENCES User(username) ON UPDATE CASCADE ON DELETE CASCADE);
CREATE TABLE Photo (picid VARCHAR(40) NOT NULL, url VARCHAR(255) NOT NULL, format CHARACTER(3), date DATE NOT NULL, Primary Key(picid));
CREATE TABLE Contain (albumid INT UNSIGNED NOT NULL AUTO_INCREMENT, picid VARCHAR(40) NOT NULL, caption VARCHAR(255), sequencenum INT NOT NULL, Primary Key(albumid, picid), CONSTRAINT fk_albumid Foreign Key(albumid) REFERENCES Album(albumid) ON UPDATE CASCADE ON DELETE CASCADE, CONSTRAINT fk_picid Foreign Key(picid) REFERENCES Photo(picid) ON UPDATE CASCADE ON DELETE CASCADE);
CREATE TABLE AlbumAccess (albumid INT UNSIGNED NOT NULL, username VARCHAR(20) NOT NULL, Primary Key(albumid, username), CONSTRAINT fk_albumid1 Foreign Key(albumid) REFERENCES Album(albumid) ON UPDATE CASCADE ON DELETE CASCADE, CONSTRAINT fk_username1 Foreign Key(username) REFERENCES User(username) ON UPDATE CASCADE ON DELETE CASCADE);
DROP TABLE if exists Comment;
CREATE TABLE Comment (
	commentid integer primary key not null auto_increment,
	picid varchar(40) not null,
	message varchar(140) not null,
	username varchar(20) not null,
	date timestamp default current_timestamp,

	foreign key (picid) references Photo (picid)
);

DROP TABLE if exists Favorite;
CREATE TABLE Favorite (
	favoriteid integer primary key not null auto_increment,
	picid varchar(40) not null,
	username varchar(20) not null,
	date timestamp default current_timestamp,

	foreign key (picid) references Photo (picid),
	foreign key (username) references User (username)
);