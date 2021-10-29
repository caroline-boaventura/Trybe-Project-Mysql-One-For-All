DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    PLANO_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    VALOR DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
    USUARIO_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    IDADE INT,
    PLANO_ID INT NOT NULL,
    FOREIGN KEY (PLANO_ID) REFERENCES planos(PLANO_ID)
) engine = InnoDB;

CREATE TABLE artistas(
    ARTISTA_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE usuario_seguindo_artista(
    USUARIO_ID INT NOT NULL,
    ARTISTA_ID INT NOT NULL,
    CONSTRAINT PRIMARY KEY(USUARIO_ID, ARTISTA_ID),
	FOREIGN KEY (USUARIO_ID) REFERENCES usuarios(USUARIO_ID),
    FOREIGN KEY (ARTISTA_ID) REFERENCES artistas(ARTISTA_ID)
) engine = InnoDB;

CREATE TABLE albuns(
    ALBUM_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    ARTISTA_ID INT NOT NULL,
    FOREIGN KEY (ARTISTA_ID) REFERENCES artistas(ARTISTA_ID)
) engine = InnoDB;

CREATE TABLE cancoes(
    CANCAO_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    ALBUM_ID INT NOT NULL,
    FOREIGN KEY (ALBUM_ID) REFERENCES albuns(ALBUM_ID)
) engine = InnoDB;

CREATE TABLE historico_de_reproducoes(
    USUARIO_ID INT NOT NULL,
    CANCAO_ID INT NOT NULL,
    CONSTRAINT PRIMARY KEY(USUARIO_ID, CANCAO_ID),
    FOREIGN KEY (USUARIO_ID) REFERENCES usuarios(USUARIO_ID),
	FOREIGN KEY (CANCAO_ID) REFERENCES cancoes(CANCAO_ID)
) engine = InnoDB;

INSERT INTO planos (NOME, VALOR)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO usuarios (NOME, IDADE, PLANO_ID)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);
  
INSERT INTO artistas (NOME)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
INSERT INTO usuario_seguindo_artista (USUARIO_ID, ARTISTA_ID)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
  
INSERT INTO albuns (NOME, ARTISTA_ID)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO cancoes (NOME, ALBUM_ID)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1), 
  ('Dance With Her Own', 1), 
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Sweetie, Let\'s Go Wild', 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ('Honey, Let\'s Be Silly', 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO historico_de_reproducoes (USUARIO_ID, CANCAO_ID)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);
  