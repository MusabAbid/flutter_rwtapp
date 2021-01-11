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
    Job(id: DateTime.now().toString(),endDate: DateTime.now(),startDate:DateTime.now() ,description:'jdjdjjd',companyName: 'ndndndn',designation:'jddjdjjd' ,salary: 2000),
    Job(id: DateTime.now().toString(),endDate: DateTime.now(),startDate:DateTime.now() ,description:'jdjdjjd',companyName: 'Abc',designation:'jddjdjjd' ,salary: 2000)
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
  Future<void> addJob(Job job) async {
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
      final newJob = Job(
        id: DateTime.now().toString(),
        salary:job.salary,
        description: job.description,
        designation: job.designation,
        companyName:job.companyName ,
        endDate:job.endDate ,
        startDate: job.startDate,
      );
      _items.add(newJob);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

}
