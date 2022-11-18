create database DanceMi;
use DanceMi;

create table Danca (
idDanca int primary key auto_increment,
tipo varchar(150),
descricao varchar(150)
);

insert into Danca values 
(null, 'Clássica', 'Peça musical interpretada através da dança'),
(null, 'BreakDance', 'Sequência de passos rápidos, poses e movimentos acrobáticos, executados de pé e no chão'),
(null, 'Kpop', 'Movimentos do Street Dance, Pop, Eletrônico e Hip Hop, mas com abordagem estilística e sequências de passos diferentes.');

create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
celular char (11),
email varchar(45)
constraint chkemail check (email like ('%@%')),
senha varchar(45),
fkDanca int,
foreign key (fkDanca) references Danca (idDanca) 
);

insert into Usuario values 
(null, 'Teste Silva', '1197290465', 'teste.silva@gmail.com', '1234', 2);

create table Nickname (
idNickname int primary key auto_increment,
nickname varchar(45),
fkUsuario int,
foreign key (fkUsuario) references Usuario (idUsuario)
);

insert into Nickname values 
(null, 'testenick', 1);

-- Exibir todos os dados de todas as tabelas separadamente
select * from Usuario;
select * from Danca;
select * from Nickname;

-- Exibir todos os dados das tabelas Usuario e Danca em conjunto
select U.*, D.* from Usuario as U join Danca as D on U.fkDanca = D.idDanca; 

-- Exibir Nome, Nickname e Danca dos usuarios
select U.nome, N.nickname, D.tipo from Usuario as U join Nickname as N 
on N.fkUsuario = U.idUsuario join Danca as D on U.fkDanca = D.idDanca; 

