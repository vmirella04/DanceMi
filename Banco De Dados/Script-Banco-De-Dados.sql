-- Criação do DataBase
create database DanceMi;
use DanceMi;

-- Criação das tabelas
create table Jogo (
idJogo int primary key auto_increment,
nome varchar(45),
descricao varchar(150)
);

insert into Jogo values 
(null, 'Just Dance', 'Jogo eletrônico de música, onde o usuário tem que imitar os movimentos dos personagens'),
(null, 'Dance Central', 'Jogo de ritmo de músicas para o Xbox 360, que captura seus movimentos pelo Kinect.');

create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
telCel char(11),
email varchar(100)
constraint chkemail check (email like ('%@%')),
senha varchar(45),
fkJogo int,
foreign key (fkJogo) references Jogo (idJogo) 
)auto_increment = 500;


create table Comentario (
idCmt int auto_increment,
comentario varchar(250),
fkUsuario int,
foreign key (fkUsuario) references Usuario (idUsuario),
primary key (idAvl, fkUsuario)
) auto_increment = 1000;


-- Exibir todos os dados de todas as tabelas separadamente
select * from Usuario;
select * from Jogo;
select * from Comentario;

-- Exibir todos os dados das tabelas Usuario e Jogo em conjunto
select U.*, J.* from Usuario as U join Jogo as J on U.fkJogo = J.idJogo; 

-- Exibir o número de usuários que preferem Just Dance
select count(fkJogo) from Usuario where fkJogo = 1;

-- Exibir o número de usuários que preferem Dance Central
select count(fkJogo) from Usuario where fkJogo = 2;