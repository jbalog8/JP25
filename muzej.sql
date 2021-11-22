drop database if exists muzej;
create database muzej;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\muzej.sql
use muzej;

create table muzej(
    sifra int not null primary key auto_increment,
    naziv varchar (50),
    adresa varchar (50),
    radnovrijeme datetime,
    kustos int not null,
    izlozba int not null 
);

create table izlozba(
    sifra int not null primary key auto_increment,
    naziv varchar (50),
    djela int,
    kustos int not null,
    datumizlozbe datetime,
    sponzor int not null
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

create table sponzor(
    sifra int not null primary key auto_increment,
    izlozba int,
    naziv varchar(50)
);


alter table muzej add foreign key(izlozba) references izlozba(sifra);

alter table sponzor add foreign key (izlozba) references izlozba(sifra);

alter table izlozba add foreign key (kustos) references kustos(sifra);
