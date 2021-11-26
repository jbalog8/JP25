drop database if exists udrugazazastituzivotinja;
create database udrugazazastituzivotinja;
#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\udrugazzz.sql
use udrugazazastituzivotinja;

create table udruga(
    sifra int not null primary key auto_increment,
    naziv varchar (50),
    volonteri int not null,
    prostor int
);

create table volonteri(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    sticenici int
);

create table sticenici(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    pasmina varchar(50),
    prostor int

);

create table prostor(
    sifra int not null primary key auto_increment,
    adresa varchar(50),
    velicinaprostora decimal(18,2)
    
);

alter table udruga add foreign key (volonteri) references volonteri(sifra);
alter table udruga add foreign key(prostor) references prostor(sifra);
alter table volonteri add foreign key (sticenici) references sticenici(sifra);
alter table sticenici add foreign key (prostor) references prostor(sifra);