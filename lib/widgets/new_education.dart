import 'package:flutter_rwtapp/widgets/adaptive_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewEducation extends StatefulWidget {
  final Function addTx;

  NewEducation({
    this.addTx,
  });

  @override
  _NewEducationState createState() => _NewEducationState();
}

class _NewEducationState extends State<NewEducation> {
  final _instituteController = TextEditingController();
  final _marksController = TextEditingController();
  final _gpaController = TextEditingController();
  final _degreeTitleController=TextEditingController();
  // final _amountController = TextEditingController();
  bool completed = false;
  DateTime _selectedStartDate;
  DateTime _selectedEndDate;
  String dropdownValue = 'Select Status';

  DateTime _selectedDate;
  // Widget _editText(double val, String hint) {
  //   return Flexible(
  //     child: Padding(
  //       padding: EdgeInsets.only(left: val),
  //       child: TextField(
  //         onSubmitted: (_) => _submitData(),
  //         keyboardType: TextInputType.emailAddress,
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontFamily: "OpenSans",
  //         ),
  //         decoration: InputDecoration(
  //           border:
  //           OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  //           contentPadding: EdgeInsets.only(left: 10),
  //           hintText: hint,
  //           hintStyle: TextStyle(
  //               fontSize: 14.0, color: Colors.grey, fontFamily: 'OpenSans'),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  void _submitData() {
    if (_instituteController.text.isEmpty||_degreeTitleController.text.isEmpty) {
      return;
    }
    final enteredTitle = _degreeTitleController.text;
    final enteredInstitute = _instituteController.text;
    final enteredMarks = double.parse(_marksController.text);
    final enteredGpa = double.parse(_gpaController.text);
    final status=dropdownValue;
    if (enteredInstitute.isEmpty ||enteredTitle.isEmpty || enteredMarks <= 0 || enteredGpa <= 0|| _selectedEndDate == null|| _selectedStartDate == null||status=='Select Status') {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredMarks,
        _selectedStartDate,
      _selectedEndDate,
      enteredGpa,
      enteredInstitute,
      status
    );
    Navigator.of(context).pop();
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
  // void _presentDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2019),
  //     lastDate: DateTime.now(),
  //   ).then((pickedDate) {
  //     if (pickedDate == null) {
  //       return;
  //     }
  //     setState(() {
  //       _selectedDate = pickedDate;
  //     });
  //   });
  // }

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
              Text('Add Degree',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Degree'),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: TextField(
                  onSubmitted: (_) => _submitData(),
                  controller: _degreeTitleController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "OpenSans",
                  ),
                  decoration: InputDecoration(
                    border:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText:'Enter Degree Title',
                    hintStyle: TextStyle(
                        fontSize: 14.0, color: Colors.grey, fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Institute'),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: TextField(
                  controller: _instituteController,
                  onSubmitted: (_) => _submitData(),
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "OpenSans",
                  ),
                  decoration: InputDecoration(
                    border:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText:'Enter Institute Name',
                    hintStyle: TextStyle(
                        fontSize: 14.0, color: Colors.grey, fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Text('Status'),
                    SizedBox(
                      width: 28,
                    ),
                    Expanded(
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(
                            horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .circular(5.0),
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle
                                  .solid,
                              width: 0.80),
                        ),
                        child:
                        DropdownButtonHideUnderline(
                          child: DropdownButton<
                              String>(
                            value: dropdownValue,
                            iconSize: 30,
                            elevation: 16,
                            style: TextStyle(
                                color:
                                Colors.black),
                            onChanged: (String
                            newValue) {
                              setState(() {
                                dropdownValue =
                                    newValue;
                                print(newValue);
                                if (newValue ==
                                    'Completed') {
                                  completed=true;
                                } else {
                                  completed=false;
                                }

                              });
                            },
                            items: <String>[
                              'Select Status',
                              'Completed',
                              'InProgress'
                            ].map<
                                DropdownMenuItem<
                                    String>>((String
                            value) {
                              return DropdownMenuItem<
                                  String>(
                                value: value,
                                child:
                                Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  AdaptiveFlatButton(
                      "Choose Start Date",
                      _startDatePicker),
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
              completed
                  ? Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                    children: [
                      AdaptiveFlatButton(
                          "Choose End Date",
                          _endDatePicker),
                      Text(
                        _selectedEndDate ==
                            null
                            ? "No Date Chosen!"
                            : "End Date: ${DateFormat.yMd().format(_selectedEndDate)}",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Text('Marks'),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: TextField(
                  controller: _marksController,
                  onSubmitted: (_) => _submitData(),
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "OpenSans",
                  ),
                  decoration: InputDecoration(
                    border:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText:'Enter Obtained Marks',
                    hintStyle: TextStyle(
                        fontSize: 14.0, color: Colors.grey, fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Text('GPA'),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 43),
                        child: TextField(
                          controller: _gpaController,
                          onSubmitted: (_) => _submitData(),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "OpenSans",
                          ),
                          decoration: InputDecoration(
                            border:
                            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText:'Enter Obtained GPA',
                            hintStyle: TextStyle(
                                fontSize: 14.0, color: Colors.grey, fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              )
                  : Container(),
          SizedBox(height: 5,),
          RaisedButton(
                    color: Color.fromRGBO(39, 99, 209, 10),
                    onPressed: _submitData,
                    textColor: Colors.white,
                    child: Text('Add Education')),
            ],
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: <Widget>[
          //     TextField(
          //       decoration: InputDecoration(labelText: 'Title'),
          //       controller: _titleController,
          //       onSubmitted: (_) => _submitData(),
          //       //  onChanged: (val) {
          //       //  titleInput = val;
          //       //},
          //     ),
          //     TextField(
          //       decoration: InputDecoration(labelText: 'Amount'),
          //       controller: _amountController,
          //       keyboardType: TextInputType.number,
          //       onSubmitted: (_) => _submitData(),
          //       //onChanged: (val) => amountInput = val,
          //     ),
          //     Container(
          //       height: 70,
          //       child: Row(
          //         children: [
          //           Expanded(
          //             child: Text(
          //               _selectedDate == null
          //                   ? "No Date Chosen!"
          //                   : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}",
          //             ),
          //           ),
          //           AdaptiveFlatButton("Choose Date",_presentDatePicker),
          //         ],
          //       ),
          //     ),
          //     RaisedButton(
          //         color: Color.fromRGBO(39, 99, 209, 10),
          //         onPressed: _submitData,
          //         textColor: Colors.white,
          //         child: Text('Add Education')),
          //   ],
          // ),
        ),
      ),
    );
  }
}
