import 'package:flutter/foundation.dart';

class Past {
  String name;
  String role;
  String email;
  String city;
  DateTime date;
  double amount;
  String type;
  String through;
  String comment;

  Past({
    this.name,
    this.email,
    this.city,
    this.role,
    this.date,
    this.type,
    this.amount,
    this.comment,
    this.through,
  });
}
class Pasts with ChangeNotifier{
  List<Past> _items=[
    Past(name: 'Musab Bin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'MusabBin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'Musab Bin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'MusabBin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'Musab Bin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'MusabBin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'Musab Bin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'MusabBin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'Musab Bin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),
    Past(name: 'MusabBin Abid',city: 'Arifwala',email: 'Sadiq.rana321@gmail.com',role: 'Member',date: DateTime.now(),type:'Regular Fund',amount: 1000,through: 'Imran Shahid',comment: 'Hello this is a Comment'),

  ];
  List<Past> get items {
    return [..._items];
  }
  Future<void> addJob(Past past) async {
    // const url = 'https://flutter-update-47933.firebaseio.com/products.json';
    try {
      // final response = await http.post(
      //   url,
      //   body: json.encode({
      //     'title': product.title,
      //     'description': product.description,
      //     'imageUrl': product.imageUrl,
      //     'price': product.price,
      //     'isFavorite': product.isFavorite,
      //   }),
      // );
      final newPast = Past(
        name: past.name,
        type: past.type,
        amount: past.amount,
        city: past.city,
        comment: past.comment,
        date: past.date,
        email: past.email,
        role: past.role,
        through: past.through,
      );
      _items.add(newPast);
      // notifyListeners();
      print(items.length);
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }
}