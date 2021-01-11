import 'package:flutter/foundation.dart';

class Education {
  final String id;
  final String degreeTitle;
  final String instituteName;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final double marks;
  final double gpa;

  Education({
   this.id,
   this.degreeTitle,
   this.instituteName,
    this.status,
    this.startDate,
    this.endDate,
    this.marks,
    this.gpa,
  });
}
class Educations with ChangeNotifier{
  List<Education> _items=[
  ];
  List<Education> get items {
    return [..._items];
  }
  Education findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
  Future<void> updateEducations(String id,Education newEducation) async {
    final educationIndex = _items.indexWhere((element) => element.id == id);
    if (educationIndex>= 0) {
      // final url =
      //     'https://flutter-update-47933.firebaseio.com/products/$id.json';
      //
      // await http.patch(url,
      //     body: json.encode({
      //       'title': newJob.title,
      //       'description': newProduct.description,
      //       'imageUrl': newProduct.imageUrl,
      //       'price': newProduct.price,
      //     }));
      _items[educationIndex] = newEducation;
      notifyListeners();
    } else {
      print("...");
    }
  }
  Future<void> deleteEducations(String id) async {
    // final url = 'https://flutter-update-47933.firebaseio.com/products/$id.json';
    final existingProductIndex =
    _items.indexWhere((element) => element.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    // final response = await http.delete(url);
    // if (response.statusCode >= 400) {
    //   _items.insert(existingProductIndex, existingProduct);
    //   notifyListeners();
    //   throw HttpException("Could not delete product.");
    // }
    existingProduct = null;
  }
  Future<void> addEducation(Education education) async {
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
      final newEducation = Education(
        id: DateTime.now().toString(),
        degreeTitle: education.degreeTitle,
        gpa: education.gpa,
        instituteName: education.instituteName,
        status: education.status,
        marks: education.marks,
        endDate:education.endDate ,
        startDate: education.startDate,
      );
      _items.add(newEducation);
      // _items.insert(0, newProduct);  //To add it at the Start  of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

}
