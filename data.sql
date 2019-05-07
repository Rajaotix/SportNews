/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  02/05/2019 10:25:25                      */
/*==============================================================*/


drop table if exists ACTUALITES;

drop table if exists CLIENT;

drop table if exists MATCHES;

drop table if exists EQUIPE;

drop table if exists GENRE;



/*==============================================================*/
/* Table : ACTUALITES                                           */
/*==============================================================*/
create table ACTUALITES
(
   IDCLIENT             int not null,
   IDGENRE              int not null,
   DATE                 date not null,
   DESCRIPTION          text not null,
   IMAGE                text not null,
   IDACTU               int not null AUTO_INCREMENT, 
   primary key (IDACTU)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT
(
   NOM                  char(255) not null,
   USERNAME             char(255) not null,
   PASSWORD             char(255) not null,
   TOKEN                text not null,
   AUTORISATION         int not null,
   IDCLIENT             int not null AUTO_INCREMENT,
   primary key (IDCLIENT)
);

/*==============================================================*/
/* Table : EQUIPE                                               */
/*==============================================================*/
create table EQUIPE
(
   IDEQUIPE             int not null AUTO_INCREMENT ,
   IDGENRE              int not null,
   NOMEQUIPE            char(255) not null,
   primary key (IDEQUIPE)
);

/*==============================================================*/
/* Table : GENRE                                                */
/*==============================================================*/
create table GENRE
(
   NOM                  char(255) not null,
   IDGENRE              int not null AUTO_INCREMENT,
   primary key (IDGENRE)
);

/*==============================================================*/
/* Table : MATCHES                                              */
/*==============================================================*/
create table MATCHES
(
   IDEQUIPE1            int not null,
   IDEQUIPE2            int not null,
   SCOREEQUIPE1         int not null,
   SCOREEQUIPE2         int not null,
   DATE                 date not null,
   TERMINEE             int not null,
   GAGNANTS             int not null,
   IDMATCHES            int not null AUTO_INCREMENT,
   primary key (IDMATCHES)
);

alter table ACTUALITES add constraint FK_ACTUALITES foreign key (IDCLIENT)
      references CLIENT (IDCLIENT) on delete restrict on update restrict;

alter table ACTUALITES add constraint FK_ACTUALITES2 foreign key (IDGENRE)
      references GENRE (IDGENRE) on delete restrict on update restrict;

alter table EQUIPE add constraint FK_RELATION_1 foreign key (IDGENRE)
      references GENRE (IDGENRE) on delete restrict on update restrict;

alter table MATCHES add constraint FK_MATCHES foreign key (IDEQUIPE1)
      references EQUIPE (IDEQUIPE) on delete restrict on update restrict;

alter table MATCHES add constraint FK_MATCHES2 foreign key (IDEQUIPE2)
      references EQUIPE (IDEQUIPE) on delete restrict on update restrict;

