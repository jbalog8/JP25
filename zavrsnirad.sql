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
    odjel int,
    id_card char(13),
    vrstarada int

);

create table odjel(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    zaposlenici int 
);


create table vrstarada(
    sifra int not null primary key auto_increment,
    redovanrad int,
    prekovremenirad int,
    terenskirad int,
    radodkuce int
);


alter table zaposlenici add foreign key (vrstarada)references vrstarada(sifra);
alter table zaposlenici add foreign key (odjel) references odjel(sifra);
alter table evidencija add foreign key(vrstarada) references vrstarada(sifra);