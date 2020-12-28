class PaymentHistory {
  String type;
  double money;
  DateTime date;
  String   from;


  PaymentHistory({
    this.type,
    this.money,
    this.date,
    this.from

  });
}
final List<PaymentHistory> payments = [
  PaymentHistory(
    type: 'Higher Education Fund',
    date: DateTime.now(),
    from: 'Imran Shahid',
    money: 10000,

  ),
  PaymentHistory(
    type: 'Higher Education Fund',
    date: DateTime.now(),
    from: 'Imran Shahid',
    money: 10000,

  ),
  PaymentHistory(
    type: 'Higher Education Fund',
    date: DateTime.now(),
    from: 'Imran Shahid',
    money: 10000,

  ),
  PaymentHistory(
    type: 'Higher Education Fund',
    date: DateTime.now(),
    from: 'Imran Shahid',
    money: 10000,

  )
];