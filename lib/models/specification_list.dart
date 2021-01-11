import 'package:flutter/foundation.dart';
class SpecificationList {
  final String name;
  final String value;

  SpecificationList({
    @required this.name,
    @required this.value,

  });
}
class Specification with ChangeNotifier{
  List<SpecificationList> _items=[

  ];
  List<SpecificationList> get items {
    return [..._items];
  }
  void rem(SpecificationList spec){
    _items.remove(spec);
    notifyListeners();
  }
  void add(SpecificationList add){
    _items.add(add);
    notifyListeners();
  }
}