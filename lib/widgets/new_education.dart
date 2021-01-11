import 'package:flutter_rwtapp/widgets/adaptive_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rwtapp/models/Education_model.dart';
import 'package:provider/provider.dart';

class NewEducation extends StatefulWidget {
  final String id;

  NewEducation({
    this.id,
  });

  @override
  _NewEducationState createState() => _NewEducationState();
}

class _NewEducationState extends State<NewEducation> {
  bool completed = false;
  String dropdownValue = 'Select Status';
  final _form = GlobalKey<FormState>();

  var _initValues = {
    'instituteName': '',
    'gpa': '',
    'degreeTitle': '',
    "status": "",
    'marks':'',
  };
  var _editedEducation = Education(
    id: null,
    marks: null,
    status: null,
    instituteName: null,
    gpa: null,
    degreeTitle: null,
    startDate: null,
    endDate: null,
  );
  DateTime _selectedStartDate;
  DateTime _selectedEndDate;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      if (widget.id != null) {
        _editedEducation =
            Provider.of<Educations>(context, listen: false).findById(widget.id);
        _initValues = {
          'instituteName':_editedEducation.instituteName,
          'gpa': _editedEducation.gpa.toString(),
          'degreeTitle': _editedEducation.degreeTitle,
          "status": _editedEducation.status,
          'marks':_editedEducation.marks.toString(),
        };
        dropdownValue=_editedEducation.status;
        if(_editedEducation.status=='Completed')
        {completed=true;}
        else{completed=false;}
        _selectedStartDate = _editedEducation.startDate;
        _selectedEndDate = _editedEducation.endDate;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
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
      _editedEducation = Education(
        id: _editedEducation.id,
       degreeTitle:_editedEducation.degreeTitle ,
        gpa: _editedEducation.gpa,
        instituteName: _editedEducation.instituteName,
        status:_editedEducation.status ,
        marks: _editedEducation.marks,
        startDate: _selectedStartDate,
        endDate: _editedEducation.endDate,
      );
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
      _editedEducation = Education(
        id: _editedEducation.id,
        degreeTitle:_editedEducation.degreeTitle ,
        gpa: _editedEducation.gpa,
        instituteName: _editedEducation.instituteName,
        status:_editedEducation.status ,
        marks: _editedEducation.marks,
        startDate: _editedEducation.startDate,
        endDate: _selectedEndDate,
      );
    });
  }
  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedEducation.id != null) {
      await Provider.of<Educations>(context, listen: false)
          .updateEducations(_editedEducation.id, _editedEducation);
    } else {
      try {
        await Provider.of<Educations>(context,listen: false).addEducation(_editedEducation);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: [
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      }
      // }finally{
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    // setState(() {
    //   _isLoading = false;
    // });
    Navigator.of(context).pop(); // Navigator.of(context).pop();
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
          child: Form(
            key: _form,
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
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    initialValue: _initValues['degreeTitle'],
                    // onSubmitted: (_) => _submitData(),
                    // controller: _degreeTitleController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter Degree Title.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedEducation = Education(
                        id: _editedEducation.id,
                        degreeTitle:value ,
                        gpa: _editedEducation.gpa,
                        instituteName: _editedEducation.instituteName,
                        status:_editedEducation.status,
                        marks: _editedEducation.marks,
                        startDate: _editedEducation.startDate,
                        endDate: _editedEducation.endDate,
                      );
                    },
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
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    initialValue: _initValues['instituteName'],
                    // onSubmitted: (_) => _submitData(),
                    // controller: _degreeTitleController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter Institute Name Title.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedEducation = Education(
                        id: _editedEducation.id,
                        degreeTitle:_editedEducation.degreeTitle ,
                        gpa: _editedEducation.gpa,
                        instituteName:value,
                        status:_editedEducation.status,
                        marks: _editedEducation.marks,
                        startDate: _editedEducation.startDate,
                        endDate: _editedEducation.endDate,
                      );
                    },
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
                                  dropdownValue = newValue;

                                  print(newValue);
                                  if (newValue ==
                                      'Completed') {
                                    completed=true;
                                  } else {
                                    completed=false;
                                  }
                                });
                                _editedEducation = Education(
                                  id: _editedEducation.id,
                                  degreeTitle:_editedEducation.degreeTitle ,
                                  gpa: _editedEducation.gpa,
                                  instituteName: _editedEducation.instituteName,
                                  status:newValue,
                                  marks: _editedEducation.marks,
                                  startDate: _editedEducation.startDate,
                                  endDate: _editedEducation.endDate,
                                );
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
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    initialValue: _initValues['marks'],
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter Marks.";
                      }
                      if (double.tryParse(value) == null) {
                        return "Please enter a valid number.";
                      }
                      if (double.parse(value) <= 0) {
                        return 'Please enter a number greater than zero.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedEducation = Education(
                        id: _editedEducation.id,
                        degreeTitle:_editedEducation.degreeTitle ,
                        gpa: _editedEducation.gpa,
                        instituteName:_editedEducation.instituteName,
                        status:_editedEducation.status,
                        marks: double.parse(value),
                        startDate: _editedEducation.startDate,
                        endDate: _editedEducation.endDate,
                      );
                    },
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
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            initialValue: _initValues['gpa'],
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _editedEducation = Education(
                                id: _editedEducation.id,
                                degreeTitle:_editedEducation.degreeTitle ,
                                gpa:  double.parse(value),
                                instituteName:_editedEducation.instituteName,
                                status:_editedEducation.status,
                                marks:_editedEducation.marks,
                                startDate: _editedEducation.startDate,
                                endDate: _editedEducation.endDate,
                              );
                            },
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
                      onPressed: _saveForm,
                      textColor: Colors.white,
                      child: Text('Add Education')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
