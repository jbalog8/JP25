#osnovna_skola
drop database if exists osnovna_skola;
create database osnovna_skola;
#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\osnovna_skola.sql
use osnovna_skola;

create table osnovna_skola(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table radionica(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    program_radionice varchar(50),
    osnovna_skola int
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    ime_roditelja varchar(50)
    
);

create table uciteljica(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    placa decimal(18,2)
    
);

create table radionica_uciteljica(
    radionica int,
    uciteljica int
);

create table radionica_dijete(
    radionica int,
    dijete int
);

alter table radionica_uciteljica add foreign key(radionica) references radionica(sifra);
alter table radionica_uciteljica add foreign key(uciteljica) references uciteljica(sifra);
alter table radionica add foreign key(osnovna_skola)references osnovna_skola(sifra);
alter table radionica_dijete add foreign key(radionica)references radionica(sifra);
alter table radionica_dijete add foreign key(dijete) references dijete(sifra);
