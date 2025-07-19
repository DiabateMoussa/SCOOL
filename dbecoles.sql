

--- ============ table DG ==================
create table dg(
    id_dg serial,
    nom_dg varchar(35),
    prenom_dg varchar(35),
    email_dg varchar(65),
    tel_dg varchar(85),
    pass_dg varchar(250),
    pass_dg_info varchar(50)
);
--- ============ end table DG ==================


--- ============ contraint table DG ==================
alter table dg add constraint dg_pkey primary key (id_dg);
alter table dg  add constraint not null email_dg;
alter table dg  add constraint not null pass_dg;
alter table dg  add constraint dg_unique unique (nom_dg,)
--- ============ ennd contraint table DG ==================


--- ============ table EOOLE ==================
create table ecoles(
    id_ecol serial,
    nom_ecol1 varchar(50),
    nom_ecol2 varchar(50),
    ader_ecol varchar(75),
    tel_ecol varchar(85),
    logo_ecol varchar(85),
    id_dg int
    
);
--- ============ end table EOOLE ==================

--- ============ contraint table EOOLE ==================
alter table ecoles add constraint eco_pkey primary key (id_ecol);
alter table ecoles add constraint eco_fkey foreign key (id_dg) references to (dg) on update cascade on delete cascade;
--- ============ ennd contraint table EOOLE ==================

--- ============ table UTILISATEURS ==================
create table utilisateurs(

    id_ut serial,
    nom_ut varchar(86),
    tel_ut numeric(15),
    password_ut varchar(250),
    pass_infi_ut varchar(35),
    id_ecol int   
);
--- ============ end table UTILISATEURS ==================


--- ============ contraint table UTILISATEURS ==================
alter table utilisateurs add constraint ut_pkey primary key (id_ut);
alter table utilisateurs add constraint ut_unique (tel_ut);
alter table utilisateurs add constraint ut_fkeu foreign key (id_ecol) references to ecoles on update cascade on delete cascade;
--- ============ ennd contraint table UTILISATEURS ==================

--- ============ table ANN_SCOLAIRE ==================
create table ann_scolaire(
    id_ann serial,
    annee_sc varchar(20),
    anne  date 
    id_ecol int
    
);
--- ============ end table ANN_SCOLAIRE ==================

--- ============ contraint table ANN_SCOLAIRE ==================
alter table ann_scolaire add constraint ann_pkey primary key (id_ann);
alter table ann_scolaire add constraint annee_default default now();
alter table ann_scolaire add constraint ann_fkeu foreign key (id_ecol) references to ecoles on update cascade on delete cascade;
--- ============ ennd contraint table ANN_SCOLAIRE ==================

--- ============ table PARENTS ==================
create table parents(
    id_prt serial,
    nom_prt varchar(35),
    prenom_prt varchar(35),
    email_prt varchar(65),
    tel_prt varchar(85),
    ader_prt varchar(250),
   id_ecol int
  
);
--- ============ end table PARENTS ==================


--- ============ contraint table PARENTS ==================
alter table parents add constraint prt_pkey primary key (id_prt);
alter table parents add constraint prt_fkey foreign key (id_ecol) references to ecoles on update cascade on delete cascade;
--- ============ ennd contraint table PARENTS ==================

--- ============ table FONCTION ==================
create table FONCTION(
    id_fo  serial,
    nom_fo  varchar(35),
    type_fo varchar(35),
    date_d_fo varchar(35),
    date_f_fo varchar(35),
    id_ecol int

);
--- ============ end table FONCTION ==================

--- ============ contraint table FONCTION ==================
alter table FONCTION add constraint fo_pkey primary key (fo);
alter table FONCTION add constraint fo_fkey1 foreign key (id_ecol) references to ecoles on update cascade on delete cascade;
--- ============ ennd contraint table FONCTION ==================


--- ============ table FRAIS_SCOL ==================
create table FRAIS_SCOL(
    id_fsco  serial,
    type_frais int,
    id_ecol int

);
--- ============ end table eleves ==================

--- ============ contraint table eleves ==================
alter table FRAIS_SCOL add constraint frai_s_pkey primary key (id_fsco);
alter table FRAIS_SCOL add constraint frai_s_fkey1 foreign key (id_ecol) references to ecoles on update cascade on delete cascade;
--- ============ ennd contraint table eleves ==================


--- ============ table JOURS ==================
create table JOURS(
    id_j  serial,
    jour varchar(25),
    id_ecol int

);
--- ============ end table JOURS ==================

--- ============ contraint table JOURS ==================
alter table JOURS add constraint jours_s_pkey primary key (id_j);
alter table JOURS add constraint jours_s_fkey1 foreign key (id_ecol) references to ecoles on update cascade on delete cascade;
--- ============ ennd contraint table JOURS ==================


--- ============ table MOIS ==================
create table MOIS(
    id_moi  serial,
    jour varchar(25),
    id_ecol int

);
--- ============ end table MOIS ==================

--- ============ contraint table MOIS ==================
alter table MOIS add constraint MOIS_pkey primary key (id_moi);
alter table MOIS add constraint MOIS_fkey1 foreign key (id_ecol) references to ecoles on update cascade on delete cascade;
--- ============ ennd contraint table MOIS ==================

