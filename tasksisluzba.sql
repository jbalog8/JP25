drop database if exists taksisluzba;
create database taksisluzba;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\tasksisluzba.sql
use taksisluzba;

create table taxisluzba(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    vozac int not null,
    vozilo int
);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11),
    vozilo int

);

create table putnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    brojmobitela varchar(50),
    adresapolazista varchar(50),
    adresaodredista varchar(50)
);

create table vozilo(
    sifra int not null primary key auto_increment,
    markavozila varchar(50),
    registarskaoznaka varchar(50),
    brojvozila varchar(50),
    upotreba boolean

);

create table voznja(
    taxisluzba int,
    vozilo int ,
    putnik int ,
    vozac int 
);


alter table voznja add foreign key (taxisluzba)references taxisluzba(sifra);
alter table voznja add foreign key (putnik) references putnik(sifra);
alter table voznja add foreign key (vozilo) references vozilo(sifra);
alter table voznja add foreign key (vozac) references vozac(sifra);