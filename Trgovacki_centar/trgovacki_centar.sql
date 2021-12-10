#trgovacki_centar
drop database if exists trgovacki_centar ;
#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\trgovacki_centar.sql
create database trgovacki_centar character set utf8;
use trgovacki_centar;

create table trgovacki_centar(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50)
   
);

create table trgovina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    trgovacki_centar int,
    sef int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(13),
    iban char(13),
    sef int,
    radnik int
   
);

create table trgovina_osoba(
    trgovina int,
    osoba int
    
);

create table sef(
    sifra int not null primary key auto_increment,
    osoba int
    
);



create table radnik(
    sifra int not null primary key auto_increment,
    osoba int
    
);




alter table trgovina add foreign key (trgovacki_centar) references trgovacki_centar(sifra);
alter table trgovina_osoba add foreign key(osoba) references osoba(sifra);
alter table trgovina_osoba add foreign key(trgovina) references trgovina(sifra);
alter table osoba add foreign key(sef) references sef(sifra);
alter table osoba add foreign key(radnik) references radnik(sifra);
alter table trgovina add foreign key(sef) references sef(sifra);