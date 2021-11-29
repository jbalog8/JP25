drop database if exists postolar;
create database postolar character set utf8;;
#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\postolar.sql
use postolar;

create table postolar(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
    
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar (50)
);

create table popravak(
    sifra int not null primary key auto_increment,
    postolar int not null,
    obuca int,
    cijena decimal(18,2)

);

create table obuca(
    sifra int not null primary key auto_increment,
    korisnik int,
    kolicina int,
    vrsta varchar(50)
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    postolar int

);

create table postolar_korisnik(
    postolar int,
    korisnik int
);

alter table obuca add foreign key(korisnik) references korisnik(sifra);
alter table segrt add foreign key(postolar) references postolar (sifra);
alter table popravak add foreign key (obuca) references obuca(sifra);
alter table popravak add foreign key (postolar)references postolar(sifra);
alter table postolar_korisnik add foreign key(postolar) references postolar(sifra);
alter table postolar_korisnik add foreign key(korisnik) references korisnik(sifra);