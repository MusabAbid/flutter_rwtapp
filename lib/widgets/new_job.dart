import 'package:flutter_rwtapp/widgets/adaptive_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewJob extends StatefulWidget {
  final Function addTx;

  NewJob({
    this.addTx,
  });

  @override
  _NewJobState createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  final _instituteController = TextEditingController();
  final _marksController = TextEditingController();
  final _gpaController = TextEditingController();
  final _degreeTitleController = TextEditingController();
  bool completed = false;
  DateTime _selectedStartDate;
  DateTime _selectedEndDate;

  void _submitData() {
      final enteredTitle = _degreeTitleController.text;
      final enteredInstitute = _instituteController.text;
      final enteredMarks = double.parse(_marksController.text);
      final enteredGpa = double.parse(_gpaController.text);
      if (_instituteController.text.isEmpty ||
          _degreeTitleController.text.isEmpty) {
        return;
      }
      if (enteredInstitute.isEmpty ||
          enteredTitle.isEmpty ||
          enteredMarks <= 0 ||
          enteredGpa <= 0 ||
          _selectedEndDate == null ||
          _selectedStartDate == null ) {
        return;
      }
      widget.addTx(enteredTitle, enteredMarks, _selectedStartDate,
          _selectedEndDate, enteredGpa, enteredInstitute);
      if (_instituteController.text.isEmpty ||
          _degreeTitleController.text.isEmpty) {
        return;
      }
      if (_selectedStartDate == null || _selectedStartDate == null) {
        return;
      }
    Navigator.of(context).pop();
  }

  void _startDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
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
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedEndDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Job/Business',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Company Name'),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: TextField(
                      onSubmitted: (_) => _submitData(),
                      textInputAction: TextInputAction.next,
                      controller: _degreeTitleController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "OpenSans",
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Enter Company Name',
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Designation'),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 39),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: _instituteController,
                      onSubmitted: (_) => _submitData(),
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "OpenSans",
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Enter Designation',
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  ),
                ),
              ]),SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Description'),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 43),
                    child: TextField(
                      maxLines: 4,
                      textInputAction: TextInputAction.next,
                      controller: _gpaController,
                      onSubmitted: (_) => _submitData(),
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "OpenSans",
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey)),
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Describe your Job',
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Salary/Income'),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: _marksController,
                      onSubmitted: (_) => _submitData(),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "OpenSans",
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey)),
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Enter Salary',
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  ),
                ),
              ]),SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdaptiveFlatButton("Choose Start Date", _startDatePicker),
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
              Column(
                children: [
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


                ],
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
                  color: Color.fromRGBO(39, 99, 209, 10),
                  onPressed: _submitData,
                  textColor: Colors.white,
                  child: Text('Add Job/Business')),
            ],
          ),
        ),
      ),
    );
  }
}
