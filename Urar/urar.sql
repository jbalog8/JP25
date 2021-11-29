drop database if exists urar;
create database urar character set utf8;;
#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\urar.sql
use urar;

create table urar(
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
    urar int not null,
    sat int,
    segrt boolean,
    cijena decimal(18,2)

);

create table sat(
    sifra int not null primary key auto_increment,
    korisnik int,
    kolicina int,
    vrsta_sata varchar(50)
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    urar int

);

create table urar_korisnik(
    urar int,
    korisnik int
);

alter table sat add foreign key(korisnik) references korisnik(sifra);
alter table segrt add foreign key(urar) references urar (sifra);
alter table popravak add foreign key (sat) references sat(sifra);
alter table popravak add foreign key (urar)references urar(sifra);
alter table urar_korisnik add foreign key(urar) references urar(sifra);
alter table urar_korisnik add foreign key(korisnik) references korisnik(sifra);