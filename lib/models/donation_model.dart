class Donation {
  String type;
  double money;
  DateTime date;


  Donation({
    this.type,
    this.money,
    this.date,

  });
}
final List<Donation> donations = [
 Donation(
   type: 'Regular Fund',
   date: DateTime.now(),
   money:350.0,
 ),
  Donation(
    type: 'Special Compaign',
    date: DateTime.now(),
    money:350.0,
  ),
  Donation(
    type: 'Regular Fund',
    date: DateTime.now(),
    money:350.0,
  ),
  Donation(
    type: 'Special Compaign',
    date: DateTime.now(),
    money:350.0,
  ),
  Donation(
    type: 'Regular Fund',
    date: DateTime.now(),
    money:350.0,
  ),
];