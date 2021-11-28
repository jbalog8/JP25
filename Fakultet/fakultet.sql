drop database if exists fakultet;
create database fakultet character set utf8;
#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < c:\fakultet.sql
use fakultet;

create table student(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datumrodenja date,
    email varchar(50)
);

create table kolegij(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    predavac varchar(50)
);

create table rok(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    datumpocetka date,
    datumkraja date
);

create table student_kolegij(
    student int not null,
    kolegij int not null
);

create table student_rok(
    student int not null,
    rok int not null
);

alter table student_kolegij add foreign key(student) references student(sifra);
alter table student_kolegij add foreign key(kolegij) references kolegij(sifra);
alter table student_rok add foreign key(student) references student(sifra);
alter table student_rok add foreign key(rok) references rok(sifra);