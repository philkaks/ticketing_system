class Movie {
  String title;

  String age;

  String categorires;

  String imageURL;

  String logo;

  double rating;
  int price;

  String technology;

  DateTime date;

  Movie(
      {required this.title,
      required this.imageURL,
      required this.logo,
      required this.age,
      required this.rating,
      required this.date,
      required this.price,
      required this.categorires,
      required this.technology});
}

final List<Movie> movies = [
  Movie(
      title: 'KOLOLO',
      imageURL:
          'https://pbs.twimg.com/media/FJh_qwsXsAYHS-0?format=jpg&name=900x900',
      logo: 'assets/images/logos/irishman.png',
      age: 'Azawi Concert',
      rating: 8,
      date: DateTime(2022, 1, 1),
      categorires: 'Azawi, BebeCool, Ruger',
      technology: 'Fik-Famaica, Vinka ',
      price: 40000),
  Movie(
      title: 'KOLOLO',
      imageURL:
          'https://pbs.twimg.com/media/FWhDKk2XwAEyDex?format=jpg&name=900x900',
      logo: 'assets/images/logos/joker.png',
      age: '18+',
      rating: 8.7,
      date: DateTime(2022, 2, 4),
      categorires: 'Drec ali, Chameleon, BebeCool',
      technology: 'Winnie, kandal&Katalia ',
      price: 35000),
  Movie(
      title: 'LUGOGO',
      imageURL:
          'https://kampalaedgetimes.com/wp-content/uploads/2022/07/images-10.jpeg',
      logo: 'assets/images/logos/avengers.png',
      age: 'PG-13',
      rating: 8.5,
      date: DateTime(2022, 3, 1),
      categorires: ' Winnie, kandal&Katalia, Swangz-Avenue',
      technology: 'Azawi, BebeCool, Ruger ',
      price: 30000),
  Movie(
      title: 'LUGOGO',
      imageURL:
          'https://satisfashionug.com/wp-content/uploads/2022/06/286961584_5223911574369519_8092910814829463391_n.jpeg',
      logo: 'assets/images/logos/hollywood.png',
      age: 'R',
      rating: 7.7,
      date: DateTime(2022, 6, 5),
      categorires: 'Drec ali, Chameleon, BebeCool, Swangz-Avenue',
      technology: 'Fik-Famaica, Vinka ',
      price: 25000,),
      ////////////////////////////////////////////////////////////////////////////////////////////////
  Movie(
    title: 'UGANDA MUSEUM',
    imageURL:
        'https://nextmedia.co.ug/wp-content/uploads/2022/03/WhatsApp-Image-2022-03-04-at-11.37.14-AM-1-722x1024.jpeg',
    logo: 'assets/images/logos/hollywood.png',
    age: 'R',
    rating: 7.7,
    date: DateTime(2022, 6, 5),
    categorires: 'Drec ali, Chameleon, BebeCool, Swangz-Avenue',
    technology: 'Fik-Famaica, Live band ',
    price: 25000,
  ),
  Movie(
    title: 'LIDO BEACH',
    imageURL:
        'https://entebbenews.net/wp-content/uploads/2015/05/Ugandas-finest-musicians-to-battle-it-out-this-Sunday-only-@-Lido-Beach..jpg',
    logo: 'assets/images/logos/hollywood.png',
    age: 'R',
    rating: 7.7,
    date: DateTime(2022, 6, 5),
    categorires: 'Drec ali, Chameleon, BebeCool, Swangz-Avenue',
    technology: 'Fik-Famaica, Vinka ',
    price: 25000,
  ),
  Movie(
    title: 'MBARARA',
    imageURL:
        'https://pbs.twimg.com/media/FMgf0QjXoAIv9Mb.jpg',
    logo: 'assets/images/logos/hollywood.png',
    age: 'R',
    rating: 7.7,
    date: DateTime(2022, 6, 5),
    categorires: 'Drec ali, Chameleon, BebeCool, Swangz-Avenue',
    technology: 'Fik-Famaica, Vinka, capital fm ',
    price: 25000,
  ),
  Movie(
    title: 'CRICKET OVAL',
    imageURL:
        'https://enewsuganda.com/wp-content/uploads/2017/09/Teknooo-and-Mr-Eazi.png',
    logo: 'assets/images/logos/hollywood.png',
    age: 'R',
    rating: 7.7,
    date: DateTime(2022, 6, 5),
    categorires: 'TECKO, Chameleon, BebeCool, Swangz-Avenue',
    technology: 'Fik-Famaica, Vinka, capital fm ',
    price: 25000,
  ),
];
