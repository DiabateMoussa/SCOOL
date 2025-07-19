

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
alter table dg alter column email_dg set not null ;
alter table dg alter column pass_dg set not null ;
alter table dg  add constraint dg_unique unique (nom_dg);
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
alter table ecoles add constraint eco_fkey foreign key (id_dg) references dg on update cascade on delete cascade;
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
alter table utilisateurs add constraint ut_unique unique (tel_ut);
alter table utilisateurs add constraint ut_fkeu foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
--- ============ ennd contraint table UTILISATEURS ==================

--- ============ table ANN_SCOLAIRE ==================
create table ann_scolaire(
    id_ann serial,
    annee_sc varchar(20),
    anne  date,
    id_ecol int
    
);
--- ============ end table ANN_SCOLAIRE ==================

--- ============ contraint table ANN_SCOLAIRE ==================
alter table ann_scolaire add constraint ann_pkey primary key (id_ann);
alter table ann_scolaire alter column annee_default set default now();
alter table ann_scolaire add constraint ann_fkeu foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
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
alter table parents add constraint prt_fkey foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
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
alter table FONCTION add constraint fo_pkey primary key (id_fo);
alter table FONCTION add constraint fo_fkey1 foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
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
alter table FRAIS_SCOL add constraint frai_s_fkey1 foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
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
alter table JOURS add constraint jours_s_fkey1 foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
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
alter table MOIS add constraint MOIS_fkey1 foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
--- ============ ennd contraint table MOIS ==================


--- ============ table CLASSES ==================
create table CLASSES(
    id_cl serial,
    nom_cl varchar(35),
    Coef  int,
    Niveau varchar(25), 
    id_ecol  int    
);
--- ============ end table CLASSES ==================


--- ============ contraint table CLASSES ==================
alter table CLASSES add constraint cl_pkey primary key (id_cl);
alter table CLASSES  alter column nom_cl set not null ;
alter table CLASSES alter column coef set not null ;
alter table CLASSES add constraint cl_unique unique (nom_cl);
alter table CLASSES add constraint cl_fkey foreign key (id_ecol) references ecoles on update cascade on delete cascade;
--- ============ ennd contraint table CLASSES ==================

--- ============ table SERIES ==================
create table SERIES(
    id_se serial,
    nom_se varchar(35),
    id_ecol  int 
);
--- ============ contraint table SERIES ==================
alter table SERIES add constraint se_pkey primary key (id_se);
alter table SERIES  alter column nom_se set not null ;
alter table SERIES add constraint se_unique unique (nom_se);
alter table SERIES add constraint se_fkey foreign key (id_ecol) references ecoles on update cascade on delete cascade;
--- ============ ennd contraint table SERIES ==================

create table MATIERES(
    id_ma serial,
    nom_ma1 varchar(50),
    nom_ma2 varchar(50),
    coef_ma int,
    id_ecol  int 
);
--- ============ contraint table MATIERES ==================
alter table MATIERES add constraint ma_pkey primary key (id_ma);
alter table MATIERES add constraint ma_unique unique (nom_ma1);
alter table MATIERES add constraint ma_fkey foreign key (id_ma) references ecoles on update cascade on delete cascade;
--- ============ ennd contraint table MATIERES ==================

--- ============ table EMPLOYEURS ==================
create table EMPLOYEURS(
    id_em serial,
    nom_em varchar(20),
    ader_em varchar(40),
    tel_em varchar(40), 
    typeem varchar(20),
    diplome varchar(20),
    fonction varchar(20),
    dateen date,
    sexe varchar(10),
    id_ecol  int,
);
--- ============ contraint table EMPLOYEURS ==================
alter table EMPLOYEURS add constraint emp_pkey primary key (id_em);
alter table EMPLOYEURS  alter column nom_em set not null ;
alter table EMPLOYEURS add constraint emp_fkey foreign key (id_ecol) references ecoles on update cascade on delete cascade;
--- ============ ennd contraint table EMPLOYEURS ==================

--- ============ table eleves ==================
create table eleves(
    id_el serial,
    num_el varchar(35),
    nom_el varchar(35),
    img_el varchar(65),
   id_ecol int,
    id_prt int

);
--- ============ end table eleves ==================


--- ============ contraint table eleves ==================
alter table eleves add constraint el_pkey primary key (id_el);
alter table eleves add constraint el_fkey1 foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
alter table eleves add constraint el_fkey2 foreign key (id_prt) references  parents on update cascade on delete cascade;
--- ============ ennd contraint table eleves ==================


--- ============ table MATIERECLASSE ==================
create table MATIERECLASSE(
    id_ma_cl serial,
    id_ma int,
    id_cl int,
    id_em int   
);
--- ============ contraint table MATIERECLASSE ==================
alter table MATIERECLASSE add constraint ma_pkey primary key (id_ma_cl);
alter table MATIERECLASSE add constraint macl1_fkey foreign key (id_ma) references MATIERES on update cascade on delete cascade;
alter table MATIERECLASSE add constraint macl2_fkey foreign key (id_cl) references CLASSES on update cascade on delete cascade;
alter table MATIERECLASSE add constraint macl2_fkey foreign key (id_em) references  employeurs on update cascade on delete cascade;
--- ============ ennd contraint table MATIERECLASSE ==================


--- ============ table CLASELVES ==================
create table claselves(
    idclel  serial,
    montant_a_paiye  numeric,
    montant_arier numeric,
    inscrption varchar(35),
    type_el varchar(65),
    eta_etuditn  varchar(15),
    id_ecol int,
    id_cl  int,
    id_el  int,
    id_ann int

);
--- ============ end table eleves ==================


--- ============ contraint table eleves ==================
alter table claselves add constraint clv_pkey primary key (idclel);
alter table claselves add constraint clv_fkey1 foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
alter table claselves add constraint clv_fkey2 foreign key (id_cl) references  calsses on update cascade on delete cascade;
alter table claselves add constraint clv_fkey3 foreign key (id_el) references  eleves on update cascade on delete cascade;
alter table claselves add constraint clv_fkey4 foreign key (id_ann) references  ann_scolaire on update cascade on delete cascade;
--- ============ ennd contraint table eleves ==================


--- ============ table PAIEMENT_EMPLOYEURS ==================
create table PAIEMENT_EMPLOYEURS(
    id_pay  serial,
    id_em int,
    id_moi int,
    id_ecol int

);
--- ============ end table PAIEMENT_EMPLOYEURS ==================

--- ============ contraint table PAIEMENT_EMPLOYEURS ==================
alter table PAIEMENT_EMPLOYEURS add constraint pay_pkey primary key (id_pay);
alter table PAIEMENT_EMPLOYEURS add constraint pay_fkey1 foreign key (id_moi) references  moi on update cascade on delete cascade;
alter table PAIEMENT_EMPLOYEURS add constraint pay_fkey2 foreign key (id_em) references  EMPLOYEURS on update cascade on delete cascade;
alter table PAIEMENT_EMPLOYEURS add constraint pay_fkey3 foreign key (id_ecol) references  ecoles on update cascade on delete cascade;
--- ============ ennd contraint table PAIEMENT_EMPLOYEURS ==================



