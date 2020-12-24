import 'dart:io';
import 'package:flutter_rwtapp/widgets/adaptive_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:intl/intl.dart';

class NewCampaign extends StatefulWidget with NavigationStates {
  @override
  _NewCampaignState createState() => _NewCampaignState();
}

class _NewCampaignState extends State<NewCampaign> {
  File _storedImage;
  File _pickedImage;
  DateTime _selectedStartDate;
  DateTime _selectedEndDate;
  final _titleController = TextEditingController();

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _startDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedStartDate = pickedDate;
      });
    });
  }
  void _endDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2050),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedEndDate = pickedDate;
      });
    });
  }

  Future<void> _takePicture() async {
    // ignore: deprecated_member_use
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    _selectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(39, 99, 209, 10),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.green,
        title: Center(child: Text('New Campaign')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [



                  Card(
                    elevation: 2,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Text(
                            'Add Campaign Detail',
                            style: TextStyle(fontWeight: FontWeight.bold
                            ,fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text('Title',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 62),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "OpenSans",
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintText: 'Enter Title',
                                      hintStyle: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                          fontFamily: 'OpenSans'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Description',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: TextField(
                                    maxLines: 4,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "OpenSans",
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintText: 'Enter Description',
                                      hintStyle: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                          fontFamily: 'OpenSans'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AdaptiveFlatButton(
                                  "Choose Start Date", _startDatePicker),
                              Text(
                                _selectedStartDate == null
                                    ? "No Date Chosen!"
                                    : "Start Date: ${DateFormat.yMd().format(_selectedStartDate)}",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AdaptiveFlatButton(
                                  "Choose End Date", _endDatePicker),
                              Text(
                                _selectedEndDate == null
                                    ? "No Date Chosen!"
                                    : "End Date: ${DateFormat.yMd().format(_selectedEndDate)}",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            child: _storedImage != null
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                _storedImage,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            )
                                : Text(
                              'No image Added',
                              textAlign: TextAlign.center,
                            ),
                            alignment: Alignment.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5),

                              ),
                              child: FlatButton.icon(
                                icon: Icon(Icons.attach_file),
                                label: Text('Choose Image',style: TextStyle(fontWeight: FontWeight.bold),),
                                textColor: Colors.white,
                                onPressed: _takePicture,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(39, 99, 209, 10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 45, vertical: 10),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
