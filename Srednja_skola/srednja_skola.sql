#srednja_skola
drop database if exists srednja_skola;
create database srednja_skola;
#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\srednja_skola.sql
use srednja_skola;

create table srednja_skola(
    sifra int not null primary key auto_increment,
    naziv varchar(50)

);

create table razred(
    sifra int not null primary key auto_increment,
    broj_ucioince int,
    broj_ucenika int,
    srednja_skola int
    
);

create table ucenik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    prisutan boolean,
    razred int
  
);

create table profesor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
    
);

create table razred_profesor(
    razred int,
    profesor int
);

alter table razred_profesor add foreign key(razred) references razred(sifra);
alter table razred add foreign key(srednja_skola) references srednja_skola(sifra);
alter table razred_profesor add foreign key(profesor) references profesor(sifra);
alter table ucenik add foreign key(razred) references razred(sifra);