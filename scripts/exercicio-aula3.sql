-- CRIAR TABELAS PARA ATIVIDADE

CREATE TABLE Bandas (
                        Id SERIAL PRIMARY KEY,
                        Nome VARCHAR(100),
                        Genero VARCHAR(50),
                        Pais VARCHAR(50)
);

CREATE TABLE Palcos (
                        Id SERIAL PRIMARY KEY,
                        Nome VARCHAR(100),
                        Capacidade INT
);

CREATE TABLE Shows (
                       Id SERIAL PRIMARY KEY,
                       Id_Banda INT,
                       Id_Palco INT,
                       Data DATE,
                       Hora TIME,
                       Preco DECIMAL(10, 2),
                       FOREIGN KEY (Id_Banda) REFERENCES Bandas(Id),
                       FOREIGN KEY (Id_Palco) REFERENCES Palcos(Id)
);

-- INSERIR DADOS PARA ATIVIDADE

INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('The Cosmic Keys', 'Rock', 'EUA');
INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('Electro Harmonix', 'Eletrônica', 'França');
INSERT INTO Bandas (Nome, Genero, Pais) VALUES ('Jazz & Java', 'Jazz', 'Brasil');

INSERT INTO Palcos (Nome, Capacidade) VALUES ('Palco Solar', 5000);
INSERT INTO Palcos (Nome, Capacidade) VALUES ('Palco Lunar', 3000);

INSERT INTO Shows (Id_Banda, Id_Palco, Data, Hora, Preco) VALUES (1, 1, '2024-07-15', '20:00', 50.00);
INSERT INTO Shows (Id_Banda, Id_Palco, Data, Hora, Preco) VALUES (2, 2, '2024-07-15', '22:00', 40.00);
INSERT INTO Shows (Id_Banda, Id_Palco, Data, Hora, Preco) VALUES (3, 1, '2024-07-16', '18:00', 30.00);

select * from Bandas;
select * from Palcos;
select * from Shows;

-- ATIVIDADE

-- ALTERAR TABELA

-- Adicione uma coluna chamada AnoFormacao do tipo integer à tabela Bandas. Essa coluna vai armazenar o ano em que a banda foi formada.
alter table bandas add column ano_formacao int;

-- INSERIR DADOS NAS TABELAS

-- Insira dados para uma nova banda chamada "Folk Fiddles", um grupo de folk americano formado em 2015. Insira essa banda como originária dos EUA.
INSERT INTO Bandas (Nome, Genero, Pais, Ano_Formacao) VALUES ('Folk Fiddles', 'Folk Americano', 'EUA', 2015);

-- Adicione um novo palco chamado "Palco Acústico" com capacidade para 1500 pessoas.
insert into Palcos (nome, capacidade) values ('Palco Acústico', 1500);

-- ATUALIZAR INFORMAÇÕES

-- A banda "Jazz & Java" decidiu mudar seu nome para "Jazz Fusion". Atualize o nome dela na tabela Bandas.
update bandas set nome='Jazz Fusion' where nome='Jazz & Java';

-- O preço dos ingressos para os shows no "Palco Solar" deve ser aumentado em 10%. Suponha que os preços originais variam.
update shows set preco = preco * 1.1 where id_palco=1;

-- Aumentar em 10% o preco de todos os shows
update shows set preco = preco * 1.1;

-- DELETAR DADOS

-- Suponha que o "Palco Lunar" será fechado para reformas, e todos os shows planejados para esse palco precisam ser cancelados. 
-- Delete esses shows da tabela Shows.
delete from shows where id_palco=2;
