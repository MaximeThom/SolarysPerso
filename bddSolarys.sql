-- CREATE DATABASE Solarys;

USE Solarys;

Create table Acteurices(
    act_id INT PRIMARY KEY NOT NULL,
    act_nom VARCHAR(50) NOT NULL,
    act_prenom VARCHAR(50) NOT NULL,
    act_sex VARCHAR(50) NOT NULL,
    act_date_naissance DATE NOT NULL,
    act_bio TEXT NOT NULL,
);

CREATE TABLE Realisateur(
rea_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    rea_nom VARCHAR(50) NOT NULL,
    rea_prenom VARCHAR(50) NOT NULL,
    rea_sex VARCHAR(50) NOT NULL,
    rea_bio TEXT NOT NULL,
    rea_date_naissance DATE NOT NULL,
    );

Create table Genre(
    gen_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    gen_nom VARCHAR(50) NOT NULL,
    gen_desc VARCHAR(500) NOT NULL,
);

CREATE TABLE Roles(
	rol_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL, 
	rol_libelle VARCHAR(50) NOT NULL, 
);

CREATE TABLE Articles(
	art_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL, 
	art_titre VARCHAR(50) NOT NULL, 
	art_description TEXT NOT NULL, 
	art_restriction_age VARCHAR(30) NOT NULL,
	art_affiche    VARCHAR(255) NOT NULL,
	art_bande_annonce VARCHAR(255) NOT NULL,
	art_moyenne DECIMAL(2,1) NOT NULL, 
);

CREATE TABLE Utilisateurs(
	uti_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	uti_pseudo  VARCHAR(15) NOT NULL,
	uti_mdp VARCHAR(30) NOT NULL,
	uti_email VARCHAR(255) NOT NULL,
	uti_sign VARCHAR(255) NOT NULL,
	uti_pp VARCHAR(255) NOT NULL,
	rol_id INT NULL,
	CONSTRAINT FK_ROLES_UTILISATEURS FOREIGN KEY (rol_id) REFERENCES Roles(rol_id)
);

CREATE TABLE Ticket(
	tic_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL, 
	tic_message TEXT NOT NULL, 
	tic_date DATE NOT NULL,
	tic_suj VARCHAR(255) NOT NULL,
	tic_uti_id INT NULL, 
	CONSTRAINT FK_UTILISATEURS_TICKET FOREIGN KEY (tic_uti_id) REFERENCES Utilisateurs(uti_id),
);

CREATE TABLE Commentaire(
	uti_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	com_date DATE NOT NULL,
	com_uti_id INT NOT NULL,
	com_art_id INT NOT NULL,
	CONSTRAINT FK_UTILISATEURS_COMMENTAIRE FOREIGN KEY (com_uti_id) REFERENCES Utilisateurs (uti_id),
	CONSTRAINT FK_ARTICLES_COMMENTAIRE FOREIGN KEY (com_art_id) REFERENCES Articles (art_id),
); 

CREATE TABLE Evaluer(
	eva_uti_id INT NULL,
	eva_art_id INT NULL,
	note DECIMAL(2,1) NOT NULL,
	CONSTRAINT PK_EVALUER PRIMARY KEY (eva_uti_id, eva_art_id),
	CONSTRAINT FK_UTILISATEURS_EVALUER FOREIGN KEY (eva_uti_id) REFERENCES Utilisateurs (uti_id),
	CONSTRAINT FK_ARTICLES_EVALUER FOREIGN KEY (eva_art_id) REFERENCES Articles (art_id),
	);

CREATE TABLE Mettre_en_scène(
	mes_art_id INT NOT NULL,
	mes_gen_id INT NOT NULL,
	CONSTRAINT PK_METTRE_EN_SCENE PRIMARY KEY (mes_art_id, mes_gen_id),
	CONSTRAINT FK_ART_MES FOREIGN KEY (mes_art_id) REFERENCES Articles (art_id),
	CONSTRAINT FK_GEN_MES FOREIGN KEY (mes_gen_id) REFERENCES Genre (gen_id),
);

CREATE TABLE Aimer(
	aim_uti_id INT NULL, 
	aim_art_id INT NULL,
	CONSTRAINT PK_AIMER PRIMARY KEY (aim_uti_id, aim_art_id),
	CONSTRAINT FK_UTILISATEURS_AIMER FOREIGN KEY (aim_uti_id) REFERENCES Utilisateurs(uti_id),
	CONSTRAINT FK_ARTICLES_AIMER FOREIGN KEY (aim_art_id) REFERENCES Articles(art_id),
);

CREATE TABLE Participer(
	par_art_id INT NOT NULL,
	par_act_id INT NOT NULL,
	CONSTRAINT PK_PARTICIPER PRIMARY KEY (par_art_id, par_act_id),
	CONSTRAINT FK_ARTICLES_PARTICIPER FOREIGN KEY (par_art_id) REFERENCES Articles (art_id),
	CONSTRAINT FK_ACTEURICES_PARTICIPER FOREIGN KEY (par_act_id) REFERENCES ACTEURICES (act_id),
);

CREATE TABLE Appartenir(
	app_art_id INT NOT NULL,
	app_gen_id INT NOT NULL,
	CONSTRAINT PK_APPARTENIR PRIMARY KEY (app_art_id, app_gen_id),
	CONSTRAINT FK_ARTICLES_APPARTENIR FOREIGN KEY (app_art_id) REFERENCES Articles (art_id),
	CONSTRAINT FK_GENRE_APPARTENIR FOREIGN KEY (app_gen_id) REFERENCES Genre (gen_id),
);