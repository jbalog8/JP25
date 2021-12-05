drop database if exists doktor;
create database doktor character set utf8;
use doktor;

create table doktor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2),
    email varchar(50)
);

create table medicinskasestra(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2),
    email varchar(50)
);

create table pacijent(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    mbo char(9) not null,
    oib char(11) not null
);

create table lijecenje(
    sifra int not null primary key auto_increment,
    doktor int not null,
    pacijent int not null,
    trajanje int 
);

create table medicinskasestra_lijecenje(
    medicinskasestra int not null,
    lijecenje int not null
);

alter table lijecenje add foreign key(doktor) references doktor(sifra);
alter table lijecenje add foreign key(pacijent) references pacijent(sifra);
alter table medicinskasestra_lijecenje add foreign key(medicinskasestra) references medicinskasestra(sifra);
alter table medicinskasestra_lijecenje add foreign key(lijecenje) references lijecenje(sifra);