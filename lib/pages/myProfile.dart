import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_rwtapp/widgets/adaptive_flat_button.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rwtapp/models/Education_model.dart';
import 'package:flutter_rwtapp/widgets/new_education.dart';

class MyProfile extends StatefulWidget with NavigationStates {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool add = false;

  void addDegree() {
    setState(() {
      add = true;
    });
  }


  final List<Education> _userTransaction = [

  ];
  void _startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewEducation(addTx: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  void _addNewTransaction(
      String degreeTitle, double marks, DateTime startDate, DateTime endDate,double gpa,String instituteName,String status) {
    final newtx = Education(
      id: DateTime.now().toString(),
    degreeTitle:degreeTitle ,
      endDate:endDate ,
      gpa: gpa,
      instituteName: instituteName,
      marks:marks ,
      startDate:startDate ,
      status: status,
    );
    setState(() {
      _userTransaction.add(newtx);
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget _editText(double val, String hint) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(left: val),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "OpenSans",
          ),
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            contentPadding: EdgeInsets.only(left: 10),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14.0, color: Colors.grey, fontFamily: 'OpenSans'),
          ),
        ),
      ),
    );
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
        title: Center(child: Text('My Profile')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: EdgeInsets.all(0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Image.asset(
                            'assets/logos/user.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          child: Container(
                            height: 20,
                            width: 100,
                            color: Colors.black45,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('username@gmail.com'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Card(
                margin: EdgeInsets.all(0),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      indicatorColor: Color.fromRGBO(39, 99, 209, 10),
                      labelColor: Color.fromRGBO(39, 99, 209, 10),
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      unselectedLabelStyle: TextStyle(fontSize: 14),
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      tabs: [
                        Tab(
                            text: 'Personal',
                            icon: Icon(Icons.person,
                                color: Color.fromRGBO(39, 99, 209, 10))),
                        Tab(
                            text: 'Education',
                            icon: Icon(Icons.business,
                                color: Color.fromRGBO(39, 99, 209, 10))),
                        Tab(
                            text: 'Job/Business',
                            icon: Icon(Icons.work,
                                color: Color.fromRGBO(39, 99, 209, 10))),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1 + 10,
              width: double.infinity,
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                              margin: EdgeInsets.all(0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Text(
                                    //   'Edit Profile',
                                    //   style: TextStyle(
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 5,
                                    // ),
                                    Row(children: [
                                      Text('First Name'),
                                      _editText(16, 'Enter First Name'),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text('Last Name'),
                                      _editText(16, 'Enter Last Name'),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text('Occupation'),
                                      _editText(10, 'Enter Occupation'),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text('Address'),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 34.0),
                                          child: TextField(
                                            maxLines: 2,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "OpenSans",
                                            ),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                              contentPadding:
                                                  EdgeInsets.only(left: 10),
                                              hintText: "Enter Address",
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
                                      Text('City'),
                                      _editText(66, 'Enter City'),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text('Native City'),
                                      _editText(15, 'Enter Native City'),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text('Country'),
                                      _editText(35, 'Enter Country'),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text('Phone#'),
                                      _editText(35, 'Enter Phone'),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text('Cell#'),
                                      _editText(54, 'Enter Cell'),
                                    ]),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            margin: EdgeInsets.all(0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Change Password',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Text('Old Password'),
                                    _editText(35, 'Enter Old Password'),
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Text('New Password'),
                                    _editText(26, 'Enter New Password'),
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Text('Confirm Password'),
                                    _editText(1, 'Enter Password Again'),
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            margin: EdgeInsets.all(0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Add Degree',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          addDegree();
                                          _startAddNewTransactions(context);
                                          print('Add Button');
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        color: Color.fromRGBO(39, 99, 209, 10),
                                      ),
                                    ],
                                  ),
                                   Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Text("This is notification Tab View"),
                ],
                controller: _tabController,
              ),
            ),
            SizedBox(
              height: 10,
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
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(39, 99, 209, 10),
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
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
