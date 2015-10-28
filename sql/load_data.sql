use group36pa3;
INSERT INTO User (username, firstname, lastname, password, email)
  VALUES ('sportslover', 'Paul', 'Walker', 'paulpass93', 'sportslover@hotmail.com');

INSERT INTO User (username, firstname, lastname, password, email)
  VALUES ('traveler', 'Rebecca', 'Travolta', 'rebeccapass15', 'rebt@explorer.org');

INSERT INTO User (username, firstname, lastname, password, email)
  VALUES ('spacejunkie', 'Bob', 'Spacey', 'bob1pass', 'bspace@spacejunkies.net');

INSERT INTO Album (title, created, lastupdated, username, access)
  VALUES ('I love sports', '2014-09-15', '2015-09-15', 'sportslover', 'public'),
  ('I love football', '2001-10-25', '2012-04-20', 'sportslover', 'public'),
  ('Around The World', '2004-03-13', '2007-07-30', 'traveler', 'public'),
  ('Cool Space Shots', '2003-08-02', '2010-11-14', 'spacejunkie', 'private');

INSERT INTO Photo (picid, url, format, date)
VALUES ('football_s1', 'football_s1.jpg', 'jpg', '2015-09-18'),
('football_s2', 'football_s2.jpg', 'jpg', '2015-09-18'),
('football_s3', 'football_s3.jpg', 'jpg', '2015-09-18'),
('football_s4', 'football_s4.jpg', 'jpg', '2015-09-18'),
('space_EagleNebula', 'space_EagleNebula.jpg', 'jpg', '2015-09-18'),
('space_GalaxyCollision', 'space_GalaxyCollision.jpg', 'jpg', '2015-09-18'),
('space_HelixNebula', 'space_HelixNebula.jpg', 'jpg', '2015-09-18'),
('space_MilkyWay', 'space_MilkyWay.jpg', 'jpg', '2015-09-18'),
('space_OrionNebula', 'space_OrionNebula.jpg', 'jpg', '2015-09-18'),
('sports_s1', 'sports_s1.jpg', 'jpg', '2015-09-18'),
('sports_s2', 'sports_s2.jpg', 'jpg', '2015-09-18'),
('sports_s3', 'sports_s3.jpg', 'jpg', '2015-09-18'),
('sports_s4', 'sports_s4.jpg', 'jpg', '2015-09-18'),
('sports_s5', 'sports_s5.jpg', 'jpg', '2015-09-18'),
('sports_s6', 'sports_s6.jpg', 'jpg', '2015-09-18'),
('sports_s7', 'sports_s7.jpg', 'jpg', '2015-09-18'),
('sports_s8', 'sports_s8.jpg', 'jpg', '2015-09-18'),
('world_EiffelTower', 'world_EiffelTower.jpg', 'jpg', '2015-09-18'),
('world_firenze', 'world_firenze.jpg', 'jpg', '2015-09-18'),
('world_GreatWall', 'world_GreatWall.jpg', 'jpg', '2015-09-18'),
('world_Isfahan', 'world_Isfahan.jpg', 'jpg', '2015-09-18'),
('world_Istanbul', 'world_Istanbul.jpg', 'jpg', '2015-09-18'),
('world_Persepolis', 'world_Persepolis.jpg', 'jpg', '2015-09-18'),
('world_Reykjavik', 'world_Reykjavik.jpg', 'jpg', '2015-09-18'),
('world_Seoul', 'world_Seoul.jpg', 'jpg', '2015-09-18'),
('world_Stonehenge', 'world_Stonehenge.jpg', 'jpg', '2015-09-18'),
('world_TajMahal', 'world_TajMahal.jpg', 'jpg', '2015-09-18'),
('world_TelAviv', 'world_TelAviv.jpg', 'jpg', '2015-09-18'),
('world_tokyo', 'world_tokyo.jpg', 'jpg', '2015-09-18'),
('world_WashingtonDC', 'world_WashingtonDC.jpg', 'jpg', '2015-09-18');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s1', '', 0),
(1, 'sports_s2', '', 1),
(1, 'sports_s3', '', 2),
(1, 'sports_s4', '', 3),
(1, 'sports_s5', '', 4),
(1, 'sports_s6', '', 5),
(1, 'sports_s7', '', 6),
(1, 'sports_s8', '', 7),
(2, 'football_s1', '', 0),
(2, 'football_s2', '', 1),
(2, 'football_s3', '', 2),
(2, 'football_s4', '', 3),
(3, 'world_EiffelTower', '', 0),
(3, 'world_firenze', '', 1),
(3, 'world_GreatWall', '', 2),
(3, 'world_Isfahan', '', 3),
(3, 'world_Istanbul', '', 4),
(3, 'world_Persepolis', '', 5),
(3, 'world_Reykjavik', '', 6),
(3, 'world_Seoul', '', 7),
(3, 'world_Stonehenge', '', 8),
(3, 'world_TajMahal', '', 9),
(3, 'world_TelAviv', '', 10),
(3, 'world_tokyo', '', 11),
(3, 'world_WashingtonDC', '', 12),
(4, 'space_EagleNebula', '', 0),
(4, 'space_GalaxyCollision', '', 1),
(4, 'space_HelixNebula', '', 2),
(4, 'space_MilkyWay', '', 3),
(4, 'space_OrionNebula', '', 4);

INSERT INTO AlbumAccess (albumid, username)
VALUES (1, 'traveler'),
(1, 'spacejunkie'),
(2, 'traveler'),
(3, 'sportslover'),
(3, 'spacejunkie'),
(4, 'sportslover');

INSERT INTO Comment (picid, message, username, date) VALUES ('football_s3','This is awesome!','traveler','2015-10-05 21:23:23');
INSERT INTO Comment (picid, message, username, date) VALUES ('football_s3','This is out of this world!','spacejunkie','2015-10-05 21:23:23');
INSERT INTO Comment (picid, message, username, date) VALUES ('football_s3','We should go to a soccer game sometime!','spacejunkie','2015-10-05 21:23:23');
INSERT INTO Comment (picid, message, username, date) VALUES ('football_s2','Sweet football_s2 pic!','spacejunkie','2015-10-05 21:23:25');
INSERT INTO Comment (picid, message, username, date) VALUES ('football_s1','Sweet football_s1 pic!','spacejunkie','2015-10-05 21:24:45');
INSERT INTO Comment (picid, message, username, date) VALUES ('football_s3','Sweet football_s3 pic!','spacejunkie','2015-10-05 21:24:53');
INSERT INTO Comment (picid, message, username, date) VALUES ('football_s1','I\'d love to visit the stadium in football_s1 someday!!','traveler','2015-10-05 21:25:42');
INSERT INTO Comment (picid, message, username, date) VALUES ('football_s2','I\'d love to visit the stadium in football_s2 someday!!','traveler','2015-10-05 21:25:49');
INSERT INTO Comment (picid, message, username, date) VALUES ('football_s3','I\'d love to visit the stadium in football_s3 someday!!','traveler','2015-10-05 21:25:58');


INSERT INTO Favorite (picid, username, date) VALUES ('football_s3','spacejunkie','2015-10-05 22:23:23');
INSERT INTO Favorite (picid, username, date) VALUES ('football_s3','sportslover','2015-10-05 21:23:23');
INSERT INTO Favorite (picid, username, date) VALUES ('football_s2','spacejunkie','2015-10-05 23:23:35');
INSERT INTO Favorite (picid, username, date) VALUES ('football_s2','sportslover','2015-10-05 23:45:35');
INSERT INTO Favorite (picid, username, date) VALUES ('football_s2','traveler','2015-10-05 21:10:35');
INSERT INTO Favorite (picid, username, date) VALUES ('football_s1','traveler','2015-10-05 23:10:35');
INSERT INTO Favorite (picid, username, date) VALUES ('football_s1','spacejunkie','2015-10-05 23:15:35');

UPDATE Contain SET caption='What do you want me to do?' WHERE picid='football_s3';
