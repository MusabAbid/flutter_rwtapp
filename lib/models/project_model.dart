import 'package:flutter_rwtapp/models/specification_list.dart';
import 'package:flutter/material.dart';
class ProjectList{
  String id;
  String projectTitle;
  String description;
  String projectLead;
  List<SpecificationList> members;
  ProjectList({
    this.id,
    this.projectLead,
    this.projectTitle,
    this.description,
    this.members,
});
}
class Projects with ChangeNotifier{
  List<ProjectList> _items=[
    ProjectList(id: DateTime.now().toString(),description:'jdjdjjd',projectLead: 'Imran Shahid',projectTitle: 'Education Work',members:[SpecificationList(name:'Musab' ,value:'Member' ),SpecificationList(value:'CR' ,name:'Hammad' )] ),
    ProjectList(id: DateTime.now().toString(),description:'jdjdjjd',projectLead: 'Imran Shahid',projectTitle: 'Education Work',members:[SpecificationList(name:'Musab' ,value:'Member' ),SpecificationList(value:'CR' ,name:'Hammad' )] ),
  ];
  List<ProjectList> get items {
    return [..._items];
  }
  ProjectList findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
  Future<void> updateProjects(String id,ProjectList newJob) async {
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
  Future<void> deleteProjects(String id) async {
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
  Future<void> addProject(ProjectList job) async {
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
      final newJob = ProjectList(
        id: DateTime.now().toString(),
        description: job.description,
        projectTitle: job.projectTitle,
        projectLead: job.projectLead,
        members: job.members
      );
      _items.add(newJob);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

}