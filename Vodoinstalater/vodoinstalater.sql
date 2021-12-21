#vodoinstalater
drop database if exists vodoinstalater;
create database vodoinstalater character set utf8;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\vodoinstalater.sql
use vodoinstalater;

create table vodoinstalater(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    radnja varchar(50)
);

create table popravak(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2),
    trajanje int,
    segrt int,
    vodoinstalater int not null
);

create table kvar(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table vodovodne_instalacija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    kvar int not null
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);

create table popravak_kvar(
    popravak int not null,
    kvar int not null
);



alter table vodovodne_instalacija add foreign key(kvar) references kvar(sifra);
alter table popravak add foreign key(segrt) references segrt(sifra);
alter table popravak add foreign key(vodoinstalater) references vodoinstalater(sifra);
alter table popravak_kvar add foreign key(popravak) references popravak(sifra);
alter table popravak_kvar add foreign key(kvar) references kvar(sifra);