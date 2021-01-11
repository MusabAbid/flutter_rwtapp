import 'package:flutter_rwtapp/models/job_model.dart';
import 'package:flutter_rwtapp/widgets/adaptive_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewJob extends StatefulWidget {
  final String id;

  NewJob({
    this.id,
  });

  @override
  _NewJobState createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  final _form = GlobalKey<FormState>();
  bool completed = false;

  var _initValues = {
    'companyName': '',
    'description': '',
    'designation': '',
    "salary": "",
  };
  var _editedJob = Job(
    id: null,
    companyName: null,
    description: null,
    designation: null,
    salary: null,
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
        _editedJob =
            Provider.of<Jobs>(context, listen: false).findById(widget.id);
        _initValues = {
          'companyName': _editedJob.companyName,
          'description': _editedJob.description,
          'designation': _editedJob.designation,
          "salary":_editedJob.salary.toString(),
        };
        _selectedStartDate = _editedJob.startDate;
        _selectedEndDate = _editedJob.endDate;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedJob.id != null) {
      await Provider.of<Jobs>(context, listen: false)
          .updateJobs(_editedJob.id, _editedJob);
    } else {
      try {
        await Provider.of<Jobs>(context, listen: false).addJob(_editedJob);
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
      _editedJob = Job(
        id: _editedJob.id,
        companyName: _editedJob.companyName,
        description: _editedJob.description,
        designation: _editedJob.designation,
        salary: _editedJob.salary,
        startDate: _selectedStartDate,
        endDate: _editedJob.endDate,
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
      _editedJob = Job(
        id: _editedJob.id,
        companyName: _editedJob.companyName,
        description: _editedJob.description,
        designation: _editedJob.designation,
        salary: _editedJob.salary,
        startDate: _editedJob.startDate,
        endDate: _selectedEndDate,
      );
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
        child: Form(
          key: _form,
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
                    child: TextFormField(
                      // onSubmitted: (_) => _submitData(),
                      textInputAction: TextInputAction.next,
                      initialValue: _initValues['companyName'],
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Company Name.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedJob = Job(
                          id: _editedJob.id,
                          companyName: value,
                          description: _editedJob.description,
                          designation: _editedJob.designation,
                          salary: _editedJob.salary,
                          startDate: _editedJob.startDate,
                          endDate: _editedJob.endDate,
                        );
                      },
                      // controller: _degreeTitleController,
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
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      initialValue: _initValues['designation'],
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Designation.";
                        }
                        return null;
                      },
                      // controller: _instituteController,
                      // onSubmitted: (_) => _submitData(),
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _editedJob = Job(
                          id: _editedJob.id,
                          companyName: _editedJob.companyName,
                          description: _editedJob.description,
                          designation: value,
                          salary: _editedJob.salary,
                          startDate: _editedJob.startDate,
                          endDate: _editedJob.endDate,
                        );
                      },
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
              ]),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Description'),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 43),
                    child: TextFormField(
                      maxLines: 4,
                      textInputAction: TextInputAction.next,
                      initialValue: _initValues['description'],
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Description.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedJob = Job(
                          id: _editedJob.id,
                          companyName: _editedJob.companyName,
                          description: value,
                          designation: _editedJob.designation,
                          salary: _editedJob.salary,
                          startDate: _editedJob.startDate,
                          endDate: _editedJob.endDate,
                        );
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "OpenSans",
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
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
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      // controller: _marksController,
                      // onSubmitted: (_) => _submitData(),
                      initialValue: _initValues['salary'],
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Salary.";
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
                        _editedJob = Job(
                          id: _editedJob.id,
                          companyName: _editedJob.companyName,
                          description: _editedJob.description,
                          designation: _editedJob.designation,
                          salary: double.parse(value),
                          startDate: _editedJob.startDate,
                          endDate: _editedJob.endDate,
                        );
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "OpenSans",
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
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
              ]),
              SizedBox(
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
                      AdaptiveFlatButton("Choose End Date", _endDatePicker),
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
                  onPressed: _saveForm,
                  textColor: Colors.white,
                  child: Text('Add Job/Business')),
            ],
          ),
        ),
      ),
    ));
  }
}
