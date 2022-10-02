use Solarys;
go

--1--
select rea_nom, rea_prenom, art_restriction_age
from Realisateur
join Mettre_en_scène on mes_rea_id = rea_id
join Articles on mes_art_id = art_id
where art_restriction_age = '-16';


--2--
select uti_pseudo, uti_id
from Utilisateurs
join Ticket on tic_uti_id = uti_id
where tic_id is NOT NULL
order by uti_pseudo;


--3--
--afficher les articles évalués avec une note de 3 étoiles * 
select art_titre
from articles
join Evaluer on eva_art_id = art_id
where avg(note) = '3.0';

select avg(note), eva_art_id, art_titre
from Evaluer
join Articles on eva_art_id = art_id
group by eva_art_id, art_titre;


--4--
select art_titre, art_id, gen_nom
from Articles
join Appartenir on app_art_id = art_id
join Genre on app_gen_id = gen_id
where gen_nom = 'Comédie';


--5--
select art_titre, art_id, rea_nom, rea_prenom
from Articles
join Mettre_en_scène on mes_art_id = art_id
join Realisateur on mes_rea_id = rea_id
where rea_nom = 'Erasmus' and rea_prenom = 'Knowles';


--6--
select art_titre, act_nom, act_prenom, act_sex
from Articles
join Participer on par_art_id = art_id
join Acteurices on par_act_id = act_id
where act_sex = 'F';


--7--
select *
from Utilisateurs
join Roles on uti_rol_id = rol_id
where Roles.rol_id = 2 ;

--8--
select com_id, com_date, uti_pseudo, art_titre, uti_id
from Utilisateurs
join Commentaire on com_uti_id = uti_id
join Articles on com_art_id= art_id
where uti_pseudo = 'Brynne' and art_titre = 'Phasellus vitae mauris sit';


--9--

--afficher tous les films mis en scène par un réalisateur
--dont les acteurs sont nés en 1990
--évalués par les utilisateurs avec un pseudo qui commence par S


select  art_titre, 
		rea_nom, 
		rea_prenom, 
		rea_sex, 
		act_nom, 
		act_prenom, 
		act_date_naissance, 
		uti_pseudo
from Articles
join Evaluer on eva_art_id = art_id
join Utilisateurs on eva_uti_id = uti_id
join Participer on par_art_id = art_id
join Acteurices on par_act_id = act_id
join Mettre_en_scène on mes_art_id = art_id
join Realisateur on mes_rea_id = rea_id
where rea_sex = 'H'
and act_date_naissance between '01/01/1990' and '31/12/1990'
and UPPER (uti_pseudo) like 'S%';


--test
select uti_pseudo, art_titre
from Utilisateurs
join Evaluer on eva_uti_id = uti_id
join Articles on eva_art_id = art_id
where UPPER (uti_pseudo) like 'S%';

select act_nom, act_prenom, act_date_naissance, act_sex
from Acteurices
where act_date_naissance between '01/01/1960' and '31/12/1960'