drop database if exists djecjivrtic;
create database djecjivrtic;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c\djecjivrtic.sql
use djecjivrtic;

create table vrtic(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    skupine int,
    odgajateljica int
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    obrazovanje int

);

create table skupine(
    sifra int not null primary key auto_increment,
    nazivskupine varchar (50),
    brojdjece int,
    odgajateljica int
);

create table obrazovanje(
    sifra int not null primary key auto_increment,
    razinaobazovanja varchar(50)
    
);

alter table vrtic add foreign key (odgajateljica) references odgajateljica(sifra);
alter table odgajateljica add foreign key (obrazovanje) references obrazovanje(sifra);
alter table skupine add foreign key (odgajateljica)references odgajateljica(sifra);
alter table vrtic add foreign key (skupine) references skupine(sifra);
