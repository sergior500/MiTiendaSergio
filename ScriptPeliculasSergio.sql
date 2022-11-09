CREATE DATABASE sergioPeliculas;

CREATE USER 'romero'@'%' IDENTIFIED BY 'sergio';

GRANT ALL PRIVILEGES ON sergioPeliculas.* to 'romero'@'%';


CREATE TABLE sergioPeliculas.categoria(
id INT(6) AUTO_INCREMENT,
nombre VARCHAR(20),
descripcion VARCHAR(1000),

CONSTRAINT PK_CATEGORIA PRIMARY KEY (id)
);

CREATE TABLE  sergioPeliculas.peliculas (
id INT(6) AUTO_INCREMENT,
titulo VARCHAR(150) unique,
descripcion VARCHAR(1000),
precio REAL,
id_categoria INT(6),

CONSTRAINT PK_PELICULAS PRIMARY KEY (id),
CONSTRAINT FK_PELICULAS FOREIGN KEY (id_categoria) REFERENCES categoria(id) ON DELETE CASCADE
);



CREATE TABLE sergioPeliculas.USUARIO(
NombreUsuario VARCHAR(20),
contrasena VARCHAR(50),
nombre VARCHAR(20),
apellido VARCHAR(20),
fechaNacimiento date,
genero VARCHAR(6),
admin boolean,

CONSTRAINT PK_USUARIO PRIMARY KEY (NombreUsuario)
);

CREATE TABLE sergioPeliculas.USUARIO_PELICULAS(
NombreUsuario VARCHAR(20),
id_pelicula INT(6),

CONSTRAINT PK_USUARIO_PELICULAS PRIMARY KEY (id_pelicula,NombreUsuario),
CONSTRAINT FK_USUARIO_PELICULAS FOREIGN KEY (id_pelicula) REFERENCES peliculas(id) ON DELETE CASCADE,
CONSTRAINT FK2_USUARIO_PELICULAS FOREIGN KEY (NombreUsuario) REFERENCES USUARIO(NombreUsuario) ON DELETE CASCADE
);




-- Categorias

insert into sergioPeliculas.categoria (nombre, descripcion) values ('Drama', 'nam ultrices');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Documentary', 'nunc');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Horror', 'turpis eget elit');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Comedy', 'dui vel nisl duis');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Documentary', 'sapien placerat');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Romance', 'scelerisque mauris sit');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Crime', 'quis libero nullam sit');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Thriller', 'id turpis integer aliquet');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Fantasy', 'a');
insert into sergioPeliculas.categoria (nombre, descripcion) values ('Action', 'pellentesque volutpat dui');



-- Peliculas

insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('My Beautiful Laundrette', 'tellus semper interdum', 16.75, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Pooh''s Grand Adventure: The Search for Christopher Robin', 'et commodo', 1.55, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Gorky Park', 'dolor', 16.68, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Someone''s Gaze', 'justo aliquam quis turpis', 14.69, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Old Dogs', 'diam in magna bibendum', 5.12, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Pearl Jam Twenty', 'eget massa tempor convallis nulla', 7.93, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('In Gold We Trust (600 kilos d''or pur)', 'molestie sed', 10.42, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Life and Death of Colonel Blimp, The', 'a pede posuere nonummy integer', 13.12, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Interstate 60', 'magna vestibulum', 17.24, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Fifty Pills', 'rhoncus mauris enim leo', 2.47, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('BloodRayne', 'libero convallis eget', 5.35, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Village People Radio Show (Apa khabar orang kampung)', 'felis sed interdum venenatis', 4.52, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Brewster''s Millions', 'nisl ut volutpat sapien', 1.76, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Battle of Shaker Heights, The', 'ultrices libero non mattis', 13.7, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Fraternity Demon', 'rhoncus aliquam lacus morbi quis', 8.75, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Night of the Hunted, The (Nuit des traquées, La)', 'et ultrices', 2.46, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Tales of Vesperia: The First Strike (Teiruzu obu vesuperia: The first strike)', 'sapien placerat', 10.49, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('100 Years at the Movies', 'vestibulum velit id pretium', 3.74, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Three Musketeers, The', 'ut massa quis', 11.54, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Moby Dick', 'quisque arcu libero rutrum ac', 4.01, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('It''s Good to Be Alive', 'convallis eget eleifend', 16.06, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('The Whisperer in Darkness', 'tortor', 5.11, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Merlin', 'nec euismod scelerisque', 14.98, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Night Train', 'eget vulputate ut ultrices', 9.16, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Female Demon Ohyaku (Yôen dokufuden hannya no ohyaku)', 'ut mauris eget massa tempor', 17.69, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Blended', 'posuere', 16.49, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Red Hook Summer', 'porttitor id consequat', 18.46, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Devils, The', 'dolor sit amet', 14.13, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Crossing Over', 'commodo vulputate justo', 10.24, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Gentleman''s Agreement', 'mattis nibh', 14.63, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Prince of Persia: The Sands of Time', 'ultrices posuere cubilia', 8.11, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Drag Me to Hell', 'vel augue', 13.96, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Love Bug, The', 'cubilia curae', 15.99, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Factory Girl', 'nibh in lectus pellentesque at', 18.49, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Dona Flor and Her Two Husbands (Dona Flor e Seus Dois Maridos)', 'vel pede morbi', 17.94, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Dreams on Spec', 'vestibulum rutrum rutrum', 10.14, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Accidental Golfer, The (Den ofrivillige golfaren)', 'suscipit', 3.36, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Spirit of the Beehive, The (Espíritu de la colmena, El)', 'lacus curabitur at ipsum', 11.06, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('North Star, The', 'in ante vestibulum', 16.78, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Aaja Nachle', 'in leo maecenas pulvinar lobortis', 16.87, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Wanted', 'rutrum at lorem', 13.78, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Ninja', 'laoreet ut rhoncus aliquet', 14.5, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Harder They Come, The', 'libero nam', 7.63, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Z.P.G.', 'ut rhoncus aliquet', 5.03, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Little Traitor, The', 'sed tincidunt eu felis fusce', 7.74, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Mutant Chronicles', 'bibendum imperdiet nullam orci', 17.77, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Macabre', 'suspendisse potenti in eleifend quam', 6.25, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Plastic', 'morbi quis tortor id', 12.91, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Captivity', 'quam sollicitudin', 4.2, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Cats Don''t Dance', 'dolor sit amet consectetuer', 16.77, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Late Autumn (Man-choo)', 'quisque erat eros viverra eget', 5.5, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Waltzes from Vienna', 'eget nunc donec quis orci', 2.01, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Screaming Man, A (Un homme qui crie)', 'aliquet at', 17.91, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Iron Giant, The', 'pede libero quis orci nullam', 13.38, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Ex-Lady', 'vitae nisi nam', 12.24, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Come Out and Play', 'nulla quisque arcu libero rutrum', 11.7, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('8 Diagram Pole Fighter, The (a.k.a. Invincible Pole Fighter) (Wu Lang ba gua gun)', 'sit amet diam in magna', 6.11, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Riley Rewind', 'lacinia erat vestibulum', 9.37, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Under the Bombs', 'pharetra', 13.01, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Half Baked', 'nisl duis bibendum felis sed', 1.76, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Chilly Scenes of Winter (Head Over Heels)', 'in tempus sit amet', 4.92, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Where the Wild Things Are', 'nonummy maecenas tincidunt lacus at', 1.5, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Liar Liar', 'sagittis dui', 13.96, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Countdown to Looking Glass', 'et', 5.33, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Better Than Sex', 'et magnis dis parturient', 3.97, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Change of Plans (Le code a changé)', 'nulla sed vel enim', 14.12, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Transistor Love Story (Monrak Transistor)', 'mi sit', 13.91, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Universal Soldier: Day of Reckoning', 'sodales scelerisque mauris', 18.88, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('French Connection, The', 'semper est quam', 3.17, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Sensation of Sight, The', 'at', 11.66, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Gate of Hell (Jigokumon)', 'nisi venenatis tristique', 4.25, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Impostor', 'cubilia curae', 5.17, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Crazy Stone (Fengkuang de shitou)', 'lobortis est', 3.17, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Invisible Circus, The', 'mauris viverra', 18.33, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Mission, The', 'sit amet justo morbi ut', 17.71, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Loving You', 'amet', 13.14, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Innocents, The', 'turpis sed ante', 18.33, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Light Gradient', 'dui maecenas', 16.44, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Loser', 'diam', 10.84, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Mr. Thank You (Arigatô-san)', 'dignissim vestibulum vestibulum', 1.61, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Hole, The (Dong)', 'commodo', 17.93, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Sex and Breakfast', 'aliquet', 16.16, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Moulin Rouge', 'posuere cubilia curae', 12.89, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('ChromeSkull: Laid to Rest 2', 'vitae quam suspendisse potenti', 13.24, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Rosso', 'sed', 11.5, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Nemesis 2: Nebula', 'vestibulum', 3.3, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Lan Yu', 'tincidunt eu felis', 4.92, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Dark Matter', 'mi nulla ac enim in', 11.08, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Chicago Overcoat', 'duis aliquam convallis nunc proin', 6.51, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Only Son, The (Hitori musuko)', 'ultrices phasellus id', 2.26, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Once Upon a Time in Shanghai', 'tortor eu pede', 16.77, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('All Night Long', 'eget orci', 10.82, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('What Matters Most', 'ligula sit amet eleifend pede', 10.51, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Ladybug Ladybug ', 'ante', 13.19, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Pink Cadillac', 'amet consectetuer adipiscing elit', 15.01, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Not Suitable for Children', 'vestibulum', 15.46, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Je m''appelle Elisabeth', 'quam sapien varius ut blandit', 1.67, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Nothing But Trouble', 'nulla', 17.59, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Bloody Murder 2: Closing Camp', 'eget congue eget semper', 18.22, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Judge and the Assassin, The (Juge et l''assassin, Le)', 'ridiculus mus vivamus', 2.49, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Ghost Breakers, The', 'eu est congue elementum', 2.05, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Paddington', 'vestibulum', 16.31, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Citizen X', 'enim', 2.5, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('My Left Eye Sees Ghosts (Ngo joh aan gin diy gwai)', 'sollicitudin mi sit amet', 8.95, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('1-900', 'sed nisl nunc rhoncus', 11.63, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Taken 2', 'viverra pede ac diam', 6.41, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Parasomnia', 'dis parturient montes nascetur', 1.03, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Anna Karenina', 'sociis natoque penatibus', 15.51, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Piece of the Action, A', 'convallis eget eleifend', 9.88, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('SubUrbia', 'non interdum in', 11.35, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Extraordinary Stories (Historias extraordinarias)', 'luctus cum sociis', 8.53, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Life After Tomorrow', 'justo etiam', 7.86, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Rachel Getting Married', 'venenatis tristique fusce congue', 18.79, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Rid of Me', 'in est risus auctor sed', 1.36, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Babar The Movie', 'risus', 16.35, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Marilena de la P7', 'phasellus id sapien in sapien', 3.01, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Robin Hood', 'praesent', 12.53, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Hercules and the Lost Kingdom', 'vulputate ut', 14.58, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Beyond the Black Rainbow', 'nullam sit amet', 1.59, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Enforcer, The', 'potenti', 7.65, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Let''s Be Cops', 'tempor turpis nec euismod', 10.21, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Evilspeak', 'fringilla', 4.05, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Ito: A Diary of an Urban Priest (Seitti - kilvoittelijan päiväkirja)', 'quis augue', 12.17, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Boy, Did I Get a Wrong Number!', 'consequat dui nec nisi', 3.42, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Kobe Doin'' Work', 'ac est lacinia', 12.2, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Walk All Over Me', 'non', 6.84, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('They Call Me Bruce? (a.k.a. A Fistful of Chopsticks)', 'eros suspendisse accumsan', 3.71, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Comet in Moominland', 'id lobortis', 12.55, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('False as Water (Falsk som vatten)', 'dolor sit amet consectetuer', 12.95, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Funeral in Berlin', 'turpis enim blandit', 15.52, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Mysterious Object at Noon (Dokfa nai meuman)', 'auctor sed tristique in tempus', 3.47, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Warrior, The', 'non lectus aliquam sit', 7.82, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Freddy vs. Jason', 'amet consectetuer adipiscing elit proin', 7.31, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Knock on Wood', 'praesent blandit nam nulla integer', 4.22, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Mystics in Bali (Leák)', 'dui luctus rutrum nulla', 16.06, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Grande école', 'blandit ultrices', 14.92, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Final Darkness, The (Buio Omega)', 'ut nunc', 9.67, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Kiss Before Dying, A', 'sapien quis libero nullam sit', 12.24, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Harlan: In the Shadow of Jew Suess (Harlan - Im Schatten von Jud Süss)', 'eu mi nulla', 14.64, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Mister Magoo''s Christmas Carol', 'nunc viverra', 5.2, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Ghost Rider', 'elit sodales scelerisque', 3.26, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Murphy''s Law', 'quisque arcu libero', 14.22, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Who the Hell Is Juliette? (¿Quién diablos es Juliette?)', 'nulla', 13.72, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Rio', 'blandit', 17.28, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Love Me or Leave Me', 'tortor', 15.33, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Wanderers, The', 'libero rutrum ac lobortis', 16.39, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('The Wait', 'ornare consequat lectus in', 17.0, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Chairman of the Board', 'blandit', 2.3, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Suzhou River (Suzhou he)', 'mi nulla ac enim', 2.77, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Grand Canyon', 'diam', 2.91, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('American Swing', 'ac diam', 5.47, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Bleeding, The', 'augue', 11.49, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Fish Called Wanda, A', 'pulvinar', 5.95, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Wedding Party, The (Die Bluthochzeit)', 'urna pretium nisl', 4.27, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Sweet Bird of Youth', 'ante vel ipsum praesent blandit', 4.94, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Late Great Planet Earth, The', 'felis sed interdum venenatis turpis', 13.4, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Fiendish Plot of Dr. Fu Manchu, The', 'ultrices vel augue vestibulum', 4.93, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Shadow Riders, The', 'est phasellus sit amet', 15.1, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Small Town Gay Bar', 'fermentum donec ut', 12.52, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Babylon 5: A Call to Arms', 'scelerisque quam turpis adipiscing lorem', 17.71, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Robot Monster', 'sagittis nam congue risus', 11.49, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Two Girls and a Guy', 'elit proin interdum mauris non', 6.39, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Black Ice (Musta jää)', 'aliquam sit amet diam', 1.66, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Dante''s Inferno', 'pellentesque ultrices mattis', 3.09, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Sleeping Dogs Lie (a.k.a. Stay)', 'sit amet eros suspendisse accumsan', 13.48, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Get Hard', 'velit id', 12.31, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Flowers of St. Francis (Francesco, giullare di Dio)', 'ipsum primis in faucibus', 13.05, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Little Black Book', 'posuere cubilia', 18.11, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Drona', 'morbi quis tortor id', 14.85, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Common Wealth (Comunidad, La)', 'pharetra', 18.86, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Hatchet', 'adipiscing elit proin', 5.43, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Curse of the Golden Flower (Man cheng jin dai huang jin jia)', 'ligula sit amet eleifend pede', 17.34, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Crime of Passion', 'ac diam', 4.56, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Memphis Belle: A Story of a Flying Fortress, The', 'dapibus at diam nam tristique', 13.44, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Manxman, The', 'cras', 15.1, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Dialogues with Solzhenitsyn (Uzel)', 'et ultrices posuere', 16.19, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Finding Neverland', 'at turpis donec posuere', 11.06, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Don McKay', 'orci luctus et', 2.31, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Viva Riva!', 'dictumst morbi vestibulum velit id', 9.8, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Smart Set, The', 'habitasse platea dictumst morbi', 9.06, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('We''ll Never Have Paris', 'quam turpis adipiscing lorem', 15.43, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Trip, The', 'consectetuer adipiscing elit proin risus', 16.27, 10);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Alpha and Omega 2: A Howl-iday Adventure (Alpha & Omega 2)', 'sem praesent id massa id', 1.81, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Too Early, Too Late (Trop tôt, trop tard)', 'felis donec semper', 9.97, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Hi-Line, The', 'lacus', 12.83, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Our Little Differences (Die feinen Unterschiede)', 'ligula in lacus curabitur', 14.69, 9);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Law of Enclosures, The', 'curae donec pharetra magna vestibulum', 6.6, 5);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Die Weihnachtsklempner', 'in purus eu', 18.0, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Rasputin', 'velit', 16.63, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Bolivia', 'nisi volutpat eleifend donec ut', 2.2, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('2081', 'arcu', 18.91, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Mondo Topless', 'mauris viverra diam', 8.08, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Hard Luck', 'quis orci', 16.93, 8);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Five-Year Engagement, The', 'odio donec vitae', 11.77, 6);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Oh, Sun (Soleil O)', 'ac', 7.66, 2);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Enforcer 2, The', 'sit amet sapien', 10.19, 4);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Abraham Lincoln', 'odio', 16.36, 3);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Scusa ma ti chiamo amore', 'cum sociis natoque', 1.44, 1);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Quand je serai petit', 'lobortis', 2.51, 7);
insert into sergioPeliculas.peliculas (titulo, descripcion, precio, id_categoria) values ('Gospel of John, The', 'sociis natoque', 14.92, 10);

-- Usuarios

insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('bseifert0', 'j17WOpa', 'Blane', 'Seifert', '2022-09-24', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('dgillford1', '1AIt0yub', 'Deana', 'Gillford', '2021-12-22', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('bfontel2', '4UqRvqM', 'Brandyn', 'Fontel', '2022-09-20', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('ksemens3', 'flW9l3', 'Ketty', 'Semens', '2022-08-01', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('gdobbinson4', 'kcEMTfgxq', 'Gregg', 'Dobbinson', '2022-06-12', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('nleinweber5', 'tb1TFOO0', 'Nealon', 'Leinweber', '2021-12-20', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('amackeague6', 'gpVn3h', 'Ali', 'MacKeague', '2022-01-28', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('chatley7', '2RNKuvE', 'Candida', 'Hatley', '2022-09-20', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('agillyatt8', '303awqNWW', 'Alvinia', 'Gillyatt', '2022-10-13', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('gmeddemmen9', 'wK4Hh2', 'Gallard', 'Meddemmen', '2022-07-09', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('pisakowicza', 'xErGNoCqI6', 'Patrizius', 'Isakowicz', '2022-05-07', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('codyvoyb', '7Co1GMalurx', 'Claretta', 'O''Dyvoy', '2022-06-26', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('vgrimsdalec', 'QnVjpdRrP', 'Von', 'Grimsdale', '2022-10-14', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('awillcottd', '5IzTKt6W2VJG', 'Aarika', 'Willcott', '2022-08-06', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('gdugalle', 'w2AGcFrgWAM2', 'Gustave', 'Dugall', '2022-08-13', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('cyettsf', 'TPJAE7c1', 'Carlee', 'Yetts', '2022-03-22', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hthonasong', 'bHDoM2ARc', 'Henryetta', 'Thonason', '2022-04-02', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('cpeleh', 'J4XYlIN', 'Cale', 'Pele', '2022-08-29', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('gfarlambei', 'ebyLyhyFVTa', 'Gaby', 'Farlambe', '2022-05-20', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('cgounotj', 'DQuLBEf0u', 'Christopher', 'Gounot', '2022-07-13', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('rgreenrdek', 'NdAfzf6aJn6N', 'Roxine', 'Greenrde', '2022-07-26', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('ehughmanl', 'CrPxATFM', 'Emelia', 'Hughman', '2022-05-04', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('senriquesm', 'duLbPNF', 'Sallyann', 'Enriques', '2022-02-17', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('vgantlettn', 'Vgz6DqPitFV', 'Valenka', 'Gantlett', '2022-02-01', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('kpulfordo', '3Mg6HImAk', 'Ky', 'Pulford', '2022-02-13', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('fdaulbyp', 'y5WyxBQzQjD', 'Ferd', 'D''Aulby', '2022-03-31', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('jgrovehamq', 'E5m9yXTmqt5', 'Jermaine', 'Groveham', '2022-02-08', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('tattenbarrowr', '5ZMIJ2ZAE', 'Thatch', 'Attenbarrow', '2022-05-19', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hwarlawes', 'cYZGam2', 'Hunfredo', 'Warlawe', '2022-02-04', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('fsibberingt', 'cvcl2V7', 'Farah', 'Sibbering', '2022-06-05', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('achicchettou', 'uLgRbQlxFqQ', 'Abraham', 'Chicchetto', '2022-08-25', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('qredleyv', 'UK58jE6t', 'Quincey', 'Redley', '2022-05-19', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('ntampenw', 'tKG1aV3lFx', 'Nicol', 'Tampen', '2022-08-09', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('acornishx', 'ztXRHDVOj', 'Aurilia', 'Cornish', '2022-06-11', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('dpriddeny', '5NTQFTqO', 'Damiano', 'Pridden', '2022-04-01', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('dglavisz', 'h9KSK2Pq', 'Donica', 'Glavis', '2021-11-02', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('jcrangle10', '1amp9P9y', 'Jammal', 'Crangle', '2022-05-30', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('rsemble11', 'rgKWFtXFpc', 'Reamonn', 'Semble', '2022-06-22', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('tpiatkow12', 'TExpUDmF', 'Tracey', 'Piatkow', '2022-06-27', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('sleggis13', 'X62qNBhX0bcO', 'Siusan', 'Leggis', '2022-03-07', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('lpellant14', 'kv62EcaP', 'Lilli', 'Pellant', '2022-05-21', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('sheys15', 'inDEqYTk', 'Sly', 'Heys', '2022-03-12', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('kvancassel16', 'vobJkxx1ZlcY', 'Kore', 'Van Cassel', '2022-03-24', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('etapscott17', 'crS5f4H4', 'Erskine', 'Tapscott', '2022-04-18', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hramsier18', '4y2g3i', 'Harwell', 'Ramsier', '2022-06-28', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('agillingham19', 'hKGOFw5Rrl', 'Audrie', 'Gillingham', '2022-11-02', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('sfucher1a', 'ZApirpU5', 'Sigrid', 'Fucher', '2022-03-17', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('snutley1b', 'u7eiEQ5', 'Stephanie', 'Nutley', '2022-01-25', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('lhenrot1c', 'o9Vy0x', 'Lita', 'Henrot', '2022-04-08', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('athornebarrow1d', 'zao6JHL4v', 'Alano', 'Thornebarrow', '2022-01-25', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('gismail1e', 'cUI9JXmv0u', 'Gerda', 'Ismail', '2021-11-19', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('rrambaut1f', 'X5ZT5eFOZLS', 'Randi', 'Rambaut', '2022-08-12', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('msitlinton1g', 'BQdTvhiOZR', 'Milty', 'Sitlinton', '2021-11-19', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('fdmiterko1h', 'BKut0cmAoTL', 'Falkner', 'Dmiterko', '2022-05-27', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('krustman1i', 'gBQMxDrDdu2F', 'Kenneth', 'Rustman', '2022-10-31', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('kkeaves1j', 'ZpW2TqT3', 'Karilynn', 'Keaves', '2021-12-08', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('blongthorn1k', 'hcOySCtt78W', 'Berti', 'Longthorn', '2022-01-28', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hpicot1l', 'WWniCVgPHuiK', 'Hadleigh', 'Picot', '2022-02-04', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('dchapling1m', 'V0zRjwrAXS', 'Drucill', 'Chapling', '2022-05-18', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('sdavidovitz1n', '7nR4PgoshES', 'Sarene', 'Davidovitz', '2022-10-19', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('gozanne1o', 'DMad1s', 'Grace', 'Ozanne', '2022-08-05', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('bashdown1p', 'YX4opS', 'Byron', 'Ashdown', '2021-12-22', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hpeirce1q', 'MaQnNAU', 'Hector', 'Peirce', '2022-01-26', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('akordt1r', '9kCndL9XN', 'Alistair', 'Kordt', '2022-02-14', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('tgrose1s', 'qWvwsXU', 'Theadora', 'Grose', '2022-05-30', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('niannetti1t', 'pa47n5', 'Nate', 'Iannetti', '2022-04-02', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('ahorry1u', 'vZBVQzezF', 'Adaline', 'Horry', '2022-02-07', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('eflanagan1v', 'J0RCTwG', 'Edee', 'Flanagan', '2022-06-03', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('jchalice1w', 'ngHiUT', 'Jory', 'Chalice', '2022-06-19', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('aoutright1x', 'H6fDUN3K', 'Alric', 'Outright', '2022-08-07', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('rhaston1y', 'dpwzbV', 'Reidar', 'Haston', '2022-08-13', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('dmcgucken1z', 'iXbKPSvREVKn', 'Dosi', 'McGucken', '2022-02-15', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('bhenkens20', 'cP3fbb', 'Benedetto', 'Henkens', '2022-01-15', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('dbartali21', 'nafNbmh5Kc', 'Dolly', 'Bartali', '2022-10-18', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('tscrimshaw22', '4zNJV20B7', 'Tamqrah', 'Scrimshaw', '2022-01-13', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('vreadman23', 'uwaicD0M', 'Vickie', 'Readman', '2022-01-29', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('rdivell24', 'IZK1mhQucN', 'Riki', 'Divell', '2021-12-27', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('cmcjarrow25', 'UnDeZ6Zgx0eK', 'Coretta', 'McJarrow', '2022-09-04', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hferraro26', 'rHVsI0K', 'Haily', 'Ferraro', '2022-04-21', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('nchaize27', 'dY7A44Oplz', 'Nev', 'Chaize', '2021-11-13', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('ahambric28', 'U98Ofk', 'Alexandro', 'Hambric', '2022-02-19', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('mparrot29', 'bVKtb7YtRrd', 'Moise', 'Parrot', '2022-03-24', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('lsandeson2a', 'dOUdCI1', 'Lorene', 'Sandeson', '2022-07-26', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('latteridge2b', '5TUshIL', 'Lianna', 'Atteridge', '2022-01-12', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hwadesworth2c', 'VthHJ0U', 'Herbie', 'Wadesworth', '2022-01-01', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('kdunnico2d', 'bwrmElj7RSEp', 'Kalli', 'Dunnico', '2022-06-22', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('chonywill2e', 'nAWgiet92Uy', 'Chico', 'Honywill', '2022-02-02', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('fescott2f', 'aqvxwHwxmLJ', 'Fredrick', 'Escott', '2022-07-19', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hbonar2g', 'Et17HxnKGZC', 'Hadleigh', 'Bonar', '2022-10-20', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('kettritch2h', 'anFhkQMyE', 'Kienan', 'Ettritch', '2022-06-18', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hcalcraft2i', '3dqLpNwSYBZ', 'Harmony', 'Calcraft', '2022-06-14', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('tblissitt2j', 'Z6yDmMLmiA', 'Tybie', 'Blissitt', '2021-12-25', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('gstoggell2k', '6wUf5cBkCTQ', 'Glenine', 'Stoggell', '2021-11-15', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('sohogertie2l', 'aK4R3Z8', 'Silvana', 'O''Hogertie', '2022-03-18', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('hchampniss2m', 'yCV2gm', 'Henrieta', 'Champniss', '2022-09-16', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('mdambrogio2n', 'cPiZLRA0vBel', 'Marja', 'D''Ambrogio', '2021-12-09', 'Female', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('pgregorowicz2o', '7Djid5K3J', 'Paquito', 'Gregorowicz', '2022-08-03', 'Male', false);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('kaberchirder2p', 'G6G8xl155Y3s', 'Kassey', 'Aberchirder', '2022-01-28', 'Female', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('sdeeson2q', 'QSiHX7m8D', 'Saxon', 'Deeson', '2022-03-20', 'Male', true);
insert into  sergioPeliculas.USUARIO  (NombreUsuario, contrasena, nombre, apellido, fechaNacimiento, genero, admin) values ('bwisam2r', 'nQP5ht9Khu', 'Beniamino', 'Wisam', '2021-12-07', 'Male', true);





