#opg
drop database if exists opg;
create database opg character set utf8;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\opg.sql
use opg;

create table sirovina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    vrsta varchar(50) not null
);

create table proizvod(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2),
    djelatnik int
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    zanimanje varchar(50)
);

create table proizvod_sirovina(
    proizvod int,
    sirovina int
);

alter table proizvod_sirovina add foreign key (proizvod) references proizvod(sifra);
alter table proizvod_sirovina add foreign key (sirovina) references sirovina(sifra);
alter table proizvod add foreign key(djelatnik) references djelatnik(sifra);