drop database if exists frizerskisalon;
create database frizerskisalon;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\frizerski.sql
use frizerskisalon;

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar (50) not null,
    cijena decimal (18,2),
    vrijeme datetime,
    djelatnica int not null
);

create table djelatnica(
    sifra int not null primary key auto_increment,
    ime varchar (50) not null,
    prezime varchar (50) not null,
    oib char (11)

);

create table korisnik(
    sifra int not null primary key auto_increment,
    djelatnica int not null,
    ime varchar (50),
    prezime varchar (50),
    usluga int,
    vrijeme datetime

);


alter table korisnik add foreign key (usluga) references usluga(sifra);

alter table usluga add foreign key (djelatnica) references djelatnica(sifra);

alter table korisnik add foreign key (djelatnica) references djelatnica(sifra);