create database DanceMi;
use DanceMi;

create table Jogo (
idJogo int primary key auto_increment,
nome varchar(45),
descricao varchar(150)
);

insert into Danca values 
(null, 'Just Dance', 'JJogo eletrônico de música, onde o usuário tem que imitar os movimentos dos personagens'),
(null, 'Dance Central', 'Jogo de ritmo de músicas para o Xbox 360, que captura seus movimentos pelo Kinect.');

create table Usuario (
idUsuario int primary key,
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

create table Nickname (
idNickname int primary key auto_increment,
nickname varchar(45),
fkUsuario int,
foreign key (fkUsuario) references Usuario (idUsuario)
) auto_increment = 1000;

insert into Nickname values 
(null, 'testenick', 1);

create table Metrica (
idMetrica int auto_increment,
sel_usuario varchar (45),
fkUsuario int,
foreign key (fkUsuario) references Usuario(idUsuario),
primary key (idMetrica, fkUsuario)
);

-- Exibir todos os dados de todas as tabelas separadamente
select * from Usuario;
select * from Jogo;
select * from Nickname;
select * from Metrica;

-- Exibir todos os dados das tabelas Usuario e Jogo em conjunto
select U.*, J.* from Usuario as U join Jogo as J on U.fkJogo = J.idJogo; 

-- Exibir Nome, Nickname e Jogo escolhido dos usuarios
select U.nome, N.nickname, J.nome from Usuario as U join Nickname as N 
on N.fkUsuario = U.idUsuario join Jogo as J on U.fkJogo = J.idJogo; 

-- Exibir o número de usuários que preferem Just Dance
select count(nome) from Usuario where fkJogo = 1

-- Exibir o número de usuários que preferem Dance Central
select count(nome) from Usuario where fkJogo = 2