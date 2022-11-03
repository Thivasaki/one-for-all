DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

 CREATE TABLE SpotifyClone.planos(
      id_plano INT PRIMARY KEY AUTO_INCREMENT,
      plano VARCHAR(100) NOT NULL,
      preco DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      id_usuario INT PRIMARY KEY AUTO_INCREMENT,
      nome_usuario VARCHAR(100) NOT NULL,
      idade INT NOT NULL,
      id_plano INT NOT NULL,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (id_plano) REFERENCES SpotifyClone.planos (id_plano)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      id_artista INT PRIMARY KEY AUTO_INCREMENT,
      nome_artista VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artista_usuario(
      id_artista INT,
      id_usuario INT,
      CONSTRAINT PRIMARY KEY(id_usuario, id_artista),
      FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artista (id_artista),
      FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuario (id_usuario)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      id_album INT PRIMARY KEY AUTO_INCREMENT,
      nome_album VARCHAR(100) NOT NULL,
      lancamento YEAR NOT NULL,
      id_artista INT NOT NULL,
      FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artista (id_artista)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      id_cancao INT PRIMARY KEY AUTO_INCREMENT,
      nome_cancao VARCHAR(100) NOT NULL,
      duracao_segundos INT NOT NULL,
      id_album INT NOT NULL,
      FOREIGN KEY (id_album) REFERENCES SpotifyClone.album (id_album)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
      id_usuario INT NOT NULL,
      id_cancao INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY(id_usuario, id_cancao),
      FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuario (id_usuario),
      FOREIGN KEY (id_cancao) REFERENCES SpotifyClone.cancoes (id_cancao)
  ) engine = InnoDB;
  
    INSERT INTO SpotifyClone.planos (id_plano, plano, preco)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'universitário', 5.99),
    (3, 'pessoal', 6.99),
    (4, 'familiar', 7.99);

  INSERT INTO SpotifyClone.usuario (id_usuario, nome_usuario, idade, id_plano, data_assinatura)
  VALUES
    (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
    (3, 'Ada Lovelace', 37, 4, '2017-12-30'),
    (4, 'Martin Fowler', 46, 4, '2017-01-17'),
    (5, 'Sandi Metz', 58, 4, '2018-04-29'),
    (6, 'Paulo Freire', 19, 2, '2018-02-14'),
    (7, 'Bell Hooks', 26, 2, '2018-01-05'),
    (8, 'Christopher Alexander', 85, 3, '2019-06-05'),
    (9, 'Judith Butler', 45, 3, '2020-05-13'),
    (10, 'Jorge Amado', 58, 3, '2017-02-17');

  INSERT INTO SpotifyClone.artista (id_artista, nome_artista)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');
  
  INSERT INTO SpotifyClone.seguindo_artista_usuario (id_artista, id_usuario)
  VALUES
    (1, 1),
    (1, 2),
    (1, 6),
    (2, 1),
    (2, 3),
    (2, 10),
    (3, 1),
    (3, 2),
    (3, 9),
    (4, 4),
    (5, 5),
    (6, 5),
    (6, 6),
    (6, 7);
  
  INSERT INTO SpotifyClone.album (id_album, nome_album, lancamento, id_artista)
  VALUES
    (1, 'Renaissance', '2022', 1),
    (2, 'Jazz', '1978', 2),
    (3, 'Hot Space', '1982', 2),
    (4, 'Falso Brilhante', '1998', 3),
    (5, 'Vento de Maio', '2001', 3),
    (6, 'QVVJFA?', '2003', 4),
    (7, 'Somewhere Far Beyond', '2007', 5),
    (8, 'I Put A Spell On You', '2012', 6);

  INSERT INTO SpotifyClone.cancoes (id_cancao, nome_cancao, duracao_segundos, id_album)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGO’S GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Don’t Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 3),
    (6, 'Como Nossos Pais', 105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (8, 'The Bard’s Song', 267, 7),
    (9, 'Feeling Good', 244, 8),
    (10, 'Samba em Paris', 100, 6);

  INSERT INTO SpotifyClone.historico(id_usuario, id_cancao, data_reproducao)
  VALUES
    (1, 10, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 9, '2020-03-06 11:22:33'),
    (2, 9, '2022-08-05 08:05:17'), 
    (2, 7, '2020-01-02 07:40:33'),
    (3, 9, '2020-11-13 16:55:13'), 
    (3, 2, '2020-12-05 18:38:30'),
    (4, 10, '2021-08-15 17:10:10'), 
    (5, 10, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'), 
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 8, '2022-02-24 21:14:22'),
    (10, 3,'2015-12-13 08:30:22');
  