use gameowner;
create database gameowner;
/* Talbe of Users */

create table Users (
	id_user int not null auto_increment,
	Username varchar(30) not null,
    email varchar(30) not null,
    login varchar(30) not null,
    Userpassword varchar(30) not null,
    country varchar(30) not null default 'Brasil',
    primary key(id_user)
    
) default charset = utf8;

/* Talbe of games */

create table gameslist (
	id_game int not null auto_increment,
	game_name varchar(30) not null,
    price int not null,
    genres varchar(30),
    primary key(id_game)
    
) default charset utf8;

/* Table of who have determined game Relation N to N*/

create table HaveThatGame(
	id_user int not null,
    id_game int not null,
	foreign key(id_user) references Users(id_user),
    foreign key(id_game) references gameslist(id_game)
) default charset = utf8;

/* add foreign key to users */
alter table Users
add column favorite_game int;

alter table Users
add foreign key (favorite_game) references gameslist(id_game);

/* Describe and show content on each table */
describe Users;
select * from users;

describe gameslist;
select * from gameslist;

describe HaveThatGame;
select * from HaveThatGame;




/* Isert who user have determined game */
insert into HaveThatGame values
(4, 5);

/* List that shows what game each user have */
select u.id_user, u.Username, g.game_name from Users u join HaveThatGame h
on u.id_user = h.id_user /*and u.id_user = 9*/
join gameslist g
on h.id_game = g.id_game
order by u.Username;


