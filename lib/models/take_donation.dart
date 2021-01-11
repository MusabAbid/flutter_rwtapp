import 'package:flutter/foundation.dart';

class TakeDonation {
  String id;
  String name;
  String role;
  String email;
  String fName;
  String image;
  String city;

  TakeDonation({
    this.id,
    this.image,
    this.name,
    this.email,
    this.fName,
    this.city,
    this.role,
  });
}

class ListTakeDonation with ChangeNotifier {
  List<TakeDonation> _items = [
    TakeDonation(
        id: DateTime.now().toString(),
        name: 'Musab Bin Abid',
        fName: 'Abid Mehmood',
        image: 'https://personal.psu.edu/xqz5228/jpg.jpg',
        role: 'Member',
        email: 'sadiq.rana321@gmail.com',
        city: 'Arifwala'),
    TakeDonation(
        id: DateTime.now().toString(),
        name: 'Musab Bin Abid',
        fName: 'Abid Mehmood',
        image: 'https://personal.psu.edu/xqz5228/jpg.jpg',
        role: 'Member',
        email: 'sadiq.rana321@gmail.com',
        city: 'Arifwala'),
    TakeDonation(
        id: DateTime.now().toString(),
        name: 'Musab Bin Abid',
        fName: 'Abid Mehmood',
        image: 'https://personal.psu.edu/xqz5228/jpg.jpg',
        role: 'Member',
        email: 'sadiq.rana321@gmail.com',
        city: 'Arifwala',
    ),
    TakeDonation(
      id: DateTime.now().toString(),
      name: 'Musab Bin Abid',
      fName: 'Abid Mehmood',
      image: 'https://personal.psu.edu/xqz5228/jpg.jpg',
      role: 'Member',
      email: 'sadiq.rana321@gmail.com',
      city: 'Arifwala',
    ),
    TakeDonation(
        id: DateTime.now().toString(),
        name: 'Hammad',
        fName: 'Afzal',
        image: 'https://personal.psu.edu/xqz5228/jpg.jpg',
        role: 'Member',
        email: 'Hammad@gmail.com',
        city: 'Lahore',
    ),
  ];

  List<TakeDonation> get items {
    return [..._items];
  }
}
