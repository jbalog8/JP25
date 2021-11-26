drop database if exists samostan;
create database samostan;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\samostan.sql
use samostan;

create table samostan(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    svecenik int not null,
    zadatci int not null
);

create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11),
    samostan int,
    zadatci int not null

);


create table zadatci(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    vrijemetrajanja decimal(18,2),
    samostan int,
    svecenik int not null

);


alter table svecenik add foreign key (samostan) references samostan(sifra);

alter table zadatci add foreign key (samostan) references samostan(sifra);

alter table zadatci add foreign key (svecenik) references svecenik(sifra);
