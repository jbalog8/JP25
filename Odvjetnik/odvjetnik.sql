#odvjetnik
drop database if exists odvjetnik;
create database odvjetnik character set utf8;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\odvjetnik.sql
use odvjetnik;

create table odvjetnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) 
);

create table klijent(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) ,
    oib char(11)
);

create table obrana(
    sifra int not null primary key auto_increment,
    odvjetnik int not null,
    klijent int not null
);

create table suradnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);


create table suradnik_obrana(
    suradnik int not null,
    obrana int not null
);



alter table obrana add foreign key(odvjetnik) references odvjetnik(sifra);
alter table obrana add foreign key(klijent) references klijent(sifra);
alter table suradnik_obrana add foreign key(suradnik) references suradnik(sifra);
alter table suradnik_obrana add foreign key(obrana) references obrana(sifra);
