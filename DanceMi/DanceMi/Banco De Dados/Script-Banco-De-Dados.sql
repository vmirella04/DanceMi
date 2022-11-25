create database DanceMi;
use DanceMi;

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
telCel char (11),
email varchar(100)
constraint chkemail check (email like ('%@%')),
senha varchar(45),
fkJogo int,
foreign key (fkJogo) references Jogo (idJogo) 
)auto_increment = 500;

insert into Usuario values 
(null, 'Teste Silva', '1197290465', 'teste.silva@gmail.com', '1234', 2);

create table Avaliacao (
idAvl int auto_increment,
nota int,
fkUsuario int,
foreign key (fkUsuario) references Usuario (idUsuario),
primary key (idAvl, fkUsuario)
) auto_increment = 1000;

insert into Avaliacao values 
(null, 5 , 1);

-- Exibir todos os dados de todas as tabelas separadamente
select * from Usuario;
select * from Jogo;
select * from Avaliacao;

-- Exibir todos os dados das tabelas Usuario e Jogo em conjunto
select U.*, J.* from Usuario as U join Jogo as J on U.fkJogo = J.idJogo; 

-- Exibir o número de usuários que preferem Just Dance
select count(nome) from Usuario where fkJogo = 1;

-- Exibir o número de usuários que preferem Dance Central
select count(nome) from Usuario where fkJogo = 2;