import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/take_donation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rwtapp/models/past_TakeDonation_model.dart';
class NewTakeDonation extends StatefulWidget {
  TakeDonation item;

  NewTakeDonation({ this.item,
  });

  @override
  _NewTakeDonationState createState() => _NewTakeDonationState();
}
class _NewTakeDonationState extends State<NewTakeDonation> {
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController(text:DateFormat.yMMMd().format(DateTime.now()) );
  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
        // builder: (BuildContext context, Widget child) {
        //   return Theme(
        //     data: ThemeData.dark().copyWith(
        //       colorScheme: ColorScheme.dark(
        //         primary: Colors.deepPurple,
        //         onPrimary: Colors.white,
        //         surface: Colors.green,
        //         onSurface: Colors.yellow,
        //       ),
        //       dialogBackgroundColor: Theme.of(context).primaryColor,
        //     ),
        //     child: child,
        //   );
        // }
        );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
  final _form = GlobalKey<FormState>();
  var _editedPast = Past(
    comment: null,
    through: null,
    amount: null,
    date: null,
    email: null,
    city: null,
    type: null,
    name: null,
    role: null,
  );
  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
        try{
            await Provider.of<Pasts>(context).addJob(_editedPast);

          Navigator.of(context).pop();
        }
       catch (error) {
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
        Navigator.of(context).pop();
      }
  }
  @override
  Widget build(BuildContext context) {
    print('new Donation');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
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
        title: Text('Take Donation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key:_form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                    margin:EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Text('Name',style: TextStyle(fontWeight: FontWeight.bold),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 65),
                                child: TextFormField(
                                  onSaved: (value) {
                                    _editedPast = Past(
                                      role:widget.item.role,
                                      date: _editedPast.date,
                                      amount: _editedPast.amount,
                                      through: _editedPast.through,
                                      comment: _editedPast.comment,
                                      email: widget.item.email,
                                      city: widget.item.city,
                                      name:widget.item.name ,
                                      type:_editedPast.type ,
                                    );
                                  },
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  initialValue: widget.item.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",
                                  ),
                                  decoration: InputDecoration(
                                    border:
                                    OutlineInputBorder(borderSide: BorderSide(
                                        color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Enter Role',
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ),


                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text('Member Role',style: TextStyle(fontWeight: FontWeight.bold),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  initialValue: widget.item.role,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",
                                  ),
                                  decoration: InputDecoration(
                                    border:
                                    OutlineInputBorder(borderSide: BorderSide(
                                        color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Enter Name',
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ),


                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text('Email',style: TextStyle(fontWeight: FontWeight.bold),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 69),
                                child: TextFormField(
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  initialValue: widget.item.email,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",
                                  ),
                                  decoration: InputDecoration(
                                    border:
                                    OutlineInputBorder(borderSide: BorderSide(
                                        color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Enter Email',
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ),


                          ],),
                        ],
                      ),
                    )),
                SizedBox(height: 10,),
                Card(
                    margin:EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Text('Date',style: TextStyle(fontWeight: FontWeight.bold),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 102),
                                child: TextFormField(
                                  focusNode: AlwaysDisabledFocusNode(),
                                  controller: _textEditingController,
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  onSaved: (value) {
                                    if(_selectedDate!=null){
                                    _editedPast = Past(
                                      role:widget.item.role,
                                      date: _selectedDate,
                                      amount: _editedPast.amount,
                                      through: _editedPast.through,
                                      comment: _editedPast.comment,
                                      email: widget.item.email,
                                      city: widget.item.city,
                                      name:widget.item.name ,
                                      type:_editedPast.type ,
                                    );}
                                    else{
                                      _editedPast = Past(
                                        role:widget.item.role,
                                        date: DateTime.now(),
                                        amount: _editedPast.amount,
                                        through: _editedPast.through,
                                        comment: _editedPast.comment,
                                        email: widget.item.email,
                                        city: widget.item.city,
                                        name:widget.item.name ,
                                        type:_editedPast.type ,
                                      );
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",
                                  ),
                                  decoration: InputDecoration(
                                    border:
                                    OutlineInputBorder(borderSide: BorderSide(
                                        color: Colors.grey)),
                                    prefixIcon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Select Date',
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ),


                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text('Amount',style: TextStyle(fontWeight: FontWeight.bold),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 79),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onSaved: (value) {
                                    _editedPast = Past(
                                      type:_editedPast.type ,
                                      date: _editedPast.date,
                                      amount: double.parse(value),
                                      through: _editedPast.through,
                                      comment: _editedPast.comment,
                                      email: widget.item.email,
                                      city: widget.item.city,
                                      name:widget.item.name ,
                                      role:widget.item.role,
                                    );
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",

                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left:12.0,top: 12),
                                      child: Text('Rs.'),
                                    ),
                                    border:
                                    OutlineInputBorder(borderSide: BorderSide(
                                        color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 2),
                                    hintText: 'Enter Amount',
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ),


                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text('Donation Type',style: TextStyle(fontWeight: FontWeight.bold),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    _editedPast = Past(
                                      type:value ,
                                      date: _editedPast.date,
                                      amount: _editedPast.amount,
                                      through: _editedPast.through,
                                      comment: _editedPast.comment,
                                      email: widget.item.email,
                                      city: widget.item.city,
                                      name:widget.item.name ,
                                      role:widget.item.role,
                                    );
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",
                                  ),
                                  decoration: InputDecoration(
                                    border:
                                    OutlineInputBorder(borderSide: BorderSide(
                                        color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Enter Donation Type',
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ),


                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text('Donation Through',style: TextStyle(fontWeight: FontWeight.bold),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    _editedPast = Past(
                                      type:_editedPast.type ,
                                      date: _editedPast.date,
                                      amount: _editedPast.amount,
                                      through: value,
                                      comment: _editedPast.comment,
                                      email: widget.item.email,
                                      city: widget.item.city,
                                      name:widget.item.name ,
                                      role:widget.item.role,
                                    );
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",
                                  ),
                                  decoration: InputDecoration(
                                    border:
                                    OutlineInputBorder(borderSide: BorderSide(
                                        color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Enter Person Name',
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ),


                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text('Comment',style: TextStyle(fontWeight: FontWeight.bold),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 38),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  maxLines: 4,
                                  onSaved: (value) {
                                    _editedPast = Past(
                                      type:_editedPast.type ,
                                      date: _editedPast.date,
                                      amount: _editedPast.amount,
                                      through: _editedPast.through,
                                      comment: value,
                                      email: widget.item.email,
                                      city: widget.item.city,
                                      name:widget.item.name ,
                                      role:widget.item.role,
                                    );
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",
                                  ),
                                  decoration: InputDecoration(
                                    border:
                                    OutlineInputBorder(borderSide: BorderSide(
                                        color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Add Comment',
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ),
                          ],),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 35, vertical: 4),
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
                    ),
                    GestureDetector(
                      onTap:
                        _saveForm,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 45, vertical: 4),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}