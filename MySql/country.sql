CREATE TABLE Country (
  id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,

  name_en VARCHAR(255) NOT NULL,
  name_fr VARCHAR(255) NOT NULL,
  name_de VARCHAR(255) NOT NULL,
  name_ru VARCHAR(255) NOT NULL,
  name_it VARCHAR(255) NOT NULL,
  name_es VARCHAR(255) NOT NULL,
  
  about_en TEXT NOT NULL,
  about_fr TEXT NOT NULL,
  about_de TEXT NOT NULL,
  about_ru TEXT NOT NULL,
  about_it TEXT NOT NULL,
  about_es TEXT NOT NULL,

  flag_emoji CHAR(4),
  photo VARCHAR(255) NOT NULL,
  
  is_active BOOLEAN DEFAULT 1,

  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

INSERT INTO Country (name_en, name_fr, name_ge, name_ru, name_it, name_es, about_en, about_fr, about_ge, about_ru, about_it, about_es, flag_emoji, photo) VALUES
("Austria", "Autriche", "Österreich", "Австрия", "Austria", "Austria", "Austria is a country in central Europe with a rich cultural history and stunning natural beauty. Known for its picturesque Alpine scenery, Austria offers a wide range of outdoor activities such as skiing, hiking, and mountain biking. The capital city, Vienna, is a cultural hub with magnificent architecture, museums, and music venues. Austria is also known for its delicious cuisine, including schnitzel, strudel, and world-famous chocolates. Austria is a gay-friendly country with an open-minded and accepting culture.", "L'Autriche est un pays d'Europe centrale avec une riche histoire culturelle et une beauté naturelle à couper le souffle. Connue pour ses paysages alpins pittoresques, l'Autriche offre une large gamme d'activités de plein air telles que le ski, la randonnée et le VTT. La ville capitale, Vienne, est un centre culturel avec une architecture magnifique, des musées et des salles de concert. L'Autriche est également connue pour sa cuisine délicieuse, y compris le schnitzel, le strudel et les chocolats mondialement connus. L'Autriche est un pays accueillant pour les personnes LGBT avec une culture ouverte et tolérante.", "Österreich ist ein Land in Mitteleuropa mit einer reichen kulturellen Geschichte und atemberaubender natürlicher Schönheit. Bekannt für seine malerischen alpinen Landschaften, bietet Österreich eine Vielzahl von Outdoor-Aktivitäten wie Skifahren, Wandern und Mountainbiken. Die Hauptstadt Wien ist ein kulturelles Zentrum mit prächtiger Architektur, Museen und Musikstätten. Österreich ist auch bekannt für seine köstliche Küche, einschließlich Schnitzel, Strudel und weltberühmter Schokoladen. Österreich ist ein LGBT-freundliches Land mit einer aufgeschlossenen und akzeptierenden Kultur.", "Австрия - это страна в центральной Европе с богатой культурной историей и впечатляющей природной красотой. Известна своими живописными альпийскими пейзажами, Австрия предлагает широкий спектр активностей на открытом воздухе, таких как лыжи, пешие прогулки и велосипедные прогулки. Столица Вена является культурным центром с великолепной архитектурой, музеями и концертными залами. Австрия также известна своей вкусной кухней, включая шницель, штрудель и всемирно известные шоколады. Австрия - это страна, дружелюбная к ЛГБТ-сообществу, с открытой и толерантной культурой.", "L'Austria è un paese dell'Europa centrale con una ricca storia culturale e una stupefacente bellezza naturale. Conosciuta per i suoi pittoreschi paesaggi alpini, l'Austria offre una vasta gamma di attività all'aperto come lo sci, l'escursionismo e il mountain bike. La capitale, Vienna, è un centro culturale con magnifica architettura, musei e luoghi di musica. L'Austria è anche conosciuta per la sua deliziosa gastronomia, che include lo schnitzel, lo strudel e i cioccolatini di fama mondiale. L'Austria è un paese amichevole verso la comunità LGBT con una cultura aperta e tollerante.", "Austria es un país en Europa central con una rica historia cultural y una impresionante belleza natural. Conocida por sus pintorescos paisajes alpinos, Austria ofrece una amplia gama de actividades al aire libre como esquiar, hacer senderismo y andar en bicicleta de montaña. La capital, Viena, es un centro cultural con magnífica arquitectura, museos y lugares de música. Austria también es conocida por su deliciosa gastronomía, que incluye schnitzel, strudel y chocolates de fama mundial. Austria es un país amigable con la comunidad LGBT con una cultura abierta y tolerante.", "🇦🇹", "https://images.eksmo.ru/upload/iblock/584/1_min.jpg")