class Article {
  final int id;
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentsCount;

  const Article({
    this.id,
    this.text,
    this.domain,
    this.by,
    this.age,
    this.score,
    this.commentsCount,
  });
}

final articles = [
  Article(
    id: 1,
    text:
        'Watchmen | Ponto alto até aqui, episódio se concentrou em Looking Glass',
    domain: 'jovemnerd.com.br',
    by: 'Daniel John Furuno',
    age: '2019-11-18 09:36',
    score: 10,
    commentsCount: 5,
  ),
  Article(
    id: 2,
    text:
        'John Boyega avisa aos fãs que virá ao Brasil',
    domain: 'jovemnerd.com.br',
    by: 'Fernanda Talarico',
    age: '2019-11-18 10:30',
    score: 8,
    commentsCount: 2,
  ),
  Article(
    id: 3,
    text:
        'Ford vs Ferrari estreia em primeiro lugar nas bilheterias dos EUA',
    domain: 'jovemnerd.com.br',
    by: 'Fernanda Talarico',
    age: '2019-11-18 09:51',
    score: 7,
    commentsCount: 1,
  ),
  Article(
    id: 4,
    text:
        'Elenco de Liga da Justiça pede pelo lançamento de Snyder Cut',
    domain: 'jovemnerd.com.br',
    by: 'Jefferson Sato',
    age: '2019-11-18 09:46',
    score: 2,
    commentsCount: 57,
  ),
  Article(
    id: 5,
    text:
        'Desmatamento na Amazônia cresce quase 30% entre agosto de 2018 e julho de 2019, diz Inpe',
    domain: 'g1.com.br',
    by: 'Poliana Casemiro, G1 Vale do Paraíba',
    age: '2019-11-18 10:39',
    score: 7,
    commentsCount: 515,
  ),
  Article(
    id: 6,
    text:
        'Aras e subprocuradores temem que mudanças em regras do Coaf tornem Brasil \'paraíso fiscal\'',
    domain: 'g1.com.br',
    by: 'Andréia Sadi',
    age: '2019-11-18 04:00',
    score: 4,
    commentsCount: 278,
  ),
  Article(
    id: 7,
    text:
        'Recadastramento de celulares pré-pagos pela Anatel termina hoje (18)',
    domain: 'tecmundo.com.br',
    by: 'Andréia Sadi',
    age: '2019-11-18 04:00',
    score: 4,
    commentsCount: 278,
  ),
  Article(
    id: 8,
    text:
        'Recadastramento de celulares pré-pagos pela Anatel termina hoje (18)',
    domain: 'tecmundo.com.br',
    by: 'Nilton Kleina',
    age: '2019-11-18 10:30',
    score: 6,
    commentsCount: 21,
  ),
  Article(
    id: 9,
    text:
        'WhatsApp Beta para Android recebe o novo logotipo do Facebook',
    domain: 'tecmundo.com.br',
    by: 'André Luiz Dias Gonçalves',
    age: '2019-11-18 09:30',
    score: 7,
    commentsCount: 2,
  ),
  Article(
    id: 10,
    text:
        'NASA apresenta fotos do \'quarto\' dos astronautas na nave Orion',
    domain: 'tecmundo.com.br',
    by: 'André Luiz Dias Gonçalves',
    age: '2019-11-18 08:00',
    score: 8,
    commentsCount: 21,
  ),
  Article(
    id: 11,
    text:
        '"Queda da prisão na 2ª instância favorece pacote anticrime"',
    domain: 'terra.com.br',
    by: 'Breno Pires',
    age: '2019-11-18 05:12',
    score: 10,
    commentsCount: 784,
  ),
  Article(
    id: 12,
    text:
        'Faustão se irrita e detona funcionário ao vivo: “Imbecil”',
    domain: 'terra.com.br',
    by: 'Pessoa desocupada',
    age: '2019-11-18 08:00',
    score: 0,
    commentsCount: 1,
  ),
  Article(
    id: 13,
    text:
        'Mulher tenta fazer Mônica de biscuit e resultado viraliza',
    domain: 'terra.com.br',
    by: 'Ludimila Honorato',
    age: '2019-11-16 13:43',
    score: 5,
    commentsCount: 4,
  ),
];
