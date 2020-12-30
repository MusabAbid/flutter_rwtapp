import 'package:flutter/foundation.dart';

class Job{
  final String id;
  final String designation;
  final String companyName;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final double salary;

  Job({
    this.id,
    this.designation,
    this.companyName,
    this.description,
    this.startDate,
    this.endDate,
    this.salary

  });
}
class Jobs with ChangeNotifier{
  List<Job> _items=[
    Job(id: DateTime.now().toString(),description: 'I am working here as a Flutter Developer',companyName:'Trangolabs',designation: 'Software Engineer',salary: 10000.0,startDate:DateTime.now() ,endDate:DateTime.now() ,),
    Job(id: DateTime.now().toString(),description: 'I am working here as a Flutter Developer',companyName:'Trangolabs',designation: 'Software Engineer',salary: 10000.0,startDate:DateTime.now() ,endDate:DateTime.now() ,),
  ];
  List<Job> get items {
    return [..._items];
  }
  Job findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
  Future<void> updateJobs(String id,Job newJob) async {
    final jobIndex = _items.indexWhere((element) => element.id == id);
    if (jobIndex >= 0) {
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
      _items[jobIndex] = newJob;
      notifyListeners();
    } else {
      print("...");
    }
  }
  Future<void> deleteJobs(String id) async {
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


}
