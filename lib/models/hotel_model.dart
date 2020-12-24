class Hotel {
  String imageUrl;
  String title;
  String discription;


  Hotel({
    this.imageUrl,
    this.title,
    this.discription,

  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/logos/hotel0.jpg',
    title: 'News 0 News 0 ',
    discription: 'This is RWT News 0 This is RWT News 0 This is RWT News 0 This is RWT News 0',

  ),
  Hotel(
    imageUrl: 'assets/logos/hotel1.jpg',
    title: 'News 1 News 1 News 1',
    discription: 'This is RWT News 1 This is RWT News 1 This is RWT News 1 This is RWT News 1',

  ),
  Hotel(
    imageUrl: 'assets/logos/hotel2.jpg',
    title: 'News 2 News 2 News 2',
    discription: 'This is RWT News 2 This is RWT News 2 This is RWT News 2 This is RWT News 2',

  ),
];
