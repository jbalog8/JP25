drop database if exists evidencija;
create database evidencija character set utf8;
#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\zavrsnirad.sql
use evidencija;


create table evidencija(
    sifra int primary key auto_increment,
    datum date not null,
    prijava boolean,
    zaposlenici int,
    vrstarada int
);



create table zaposlenici(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11),
    odijeli int,
    evidencija int

);

create table odijeli(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);


create table vrstarada(
    sifra int not null primary key auto_increment,
    redovanrad int,
    prekovremenirad int,
    terenskirad int,
    radodkuce int
);


alter table zaposlenici add foreign key (evidencija) references evidencija(sifra);
alter table zaposlenici add foreign key (odijeli)  references odijeli(sifra);
alter table evidencija add foreign key(vrstarada) references vrstarada(sifra);