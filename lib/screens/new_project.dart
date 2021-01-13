import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/specification_list.dart';
import 'package:flutter_rwtapp/widgets/specification_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rwtapp/models/take_donation.dart';
import 'dart:math';
import 'package:flutter_rwtapp/models/project_model.dart';
import 'package:flutter_rwtapp/SocketIOChat/LoginScreen.dart';

class NewProject extends StatefulWidget {
  String id;

  NewProject({this.id});

  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject>
    with SingleTickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();
  TabController _tabController;
  List<TakeDonation> FilterItem = [];
  List<SpecificationList> specification=[];
  final _form = GlobalKey<FormState>();
  bool completed = false;
  var _isInit = true;
  var _initValues = {
    'projectTitle': '',
    'description': '',
    'projectLead': '',
  };
  var _editedProject = ProjectList(
    id: null,
    description: null,
    projectTitle: null,
    projectLead: null,
    members: null,
  );

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      if (widget.id != null) {
        _editedProject =
            Provider.of<Projects>(context, listen: false).findById(widget.id);
        _initValues = {
          'projectTitle': _editedProject.projectTitle,
          'description': _editedProject.description,
          'projectLead': _editedProject.projectLead,
        };
        specification = _editedProject.members;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }
void del(SpecificationList spec){
    setState(() {
      specification.remove(spec);
    });
  }
  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedProject.id != null) {
      await Provider.of<Projects>(context, listen: false)
          .updateProjects(widget.id, _editedProject);
    } else {
      try {
        await Provider.of<Projects>(context, listen: false)
            .addProject(_editedProject);
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

  void _AddNewMember(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                  child: Card(
                    margin: EdgeInsets.all(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: TextField(
                        onChanged: (string) {
                          List<TakeDonation> dummyList =
                              Provider.of<ListTakeDonation>(context,
                                      listen: false)
                                  .items
                                  .where((u) => (u.name
                                          .toLowerCase()
                                          .contains(string.toLowerCase()) ||
                                      u.name
                                          .toUpperCase()
                                          .contains(string.toLowerCase())))
                                  .toList();
                          setState(() {
                            FilterItem = dummyList;
                          });
                        },
                        controller: editingController,
                        decoration: InputDecoration(
                            labelText: "Search",
                            hintText: "Search by name",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)))),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: FilterItem.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final newSpecification = SpecificationList(
                            name: FilterItem[index].name,
                            value: FilterItem[index].role,
                          );
                         setState(() {
                           specification.add(newSpecification);
                         });
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            margin: EdgeInsets.all(0),
                            elevation: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(3),
                                            bottomLeft: Radius.circular(3)),
                                        child: Image.network(
                                          FilterItem[index].image,
                                          fit: BoxFit.cover,
                                        ))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FilterItem[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'Father: ${FilterItem[index].fName}'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('Role: ${FilterItem[index].role}'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('City: ${FilterItem[index].city}'),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Detail'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              height: 70,
              child: DefaultTabController(
                length: 2,
                child: TabBar(
                  indicatorColor: Color.fromRGBO(39, 99, 209, 10),
                  labelColor: Color.fromRGBO(39, 99, 209, 10),
                  unselectedLabelColor: Colors.grey,
                  // isScrollable: true,
                  unselectedLabelStyle: TextStyle(fontSize: 14),
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  tabs: [
                    Tab(
                        text: 'Detail',
                        icon: Icon(Icons.my_library_books,
                            color: Color.fromRGBO(39, 99, 209, 10))),
                    Tab(
                        text: 'Documents',
                        icon: Icon(Icons.file_copy_outlined,
                            color: Color.fromRGBO(39, 99, 209, 10))),
                    Tab(
                        text: 'Chat',
                        icon: Icon(Icons.chat,
                            color: Color.fromRGBO(39, 99, 209, 10))),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
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
                            'New Project',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text('Project Title'),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 28),
                                child: TextFormField(
                                  // onSubmitted: (_) => _submitData(),
                                  textInputAction: TextInputAction.next,
                                  initialValue: _initValues['projectTitle'],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter Project Title.";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _editedProject = ProjectList(
                                      id: _editedProject.id,
                                      description: _editedProject.description,
                                      projectLead: _editedProject.projectLead,
                                      projectTitle: value,
                                      members: _editedProject.members,
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
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Enter Project Name',
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
                                padding: EdgeInsets.only(left: 30),
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
                                    _editedProject = ProjectList(
                                      id: _editedProject.id,
                                      description: value,
                                      projectLead: _editedProject.projectLead,
                                      projectTitle: _editedProject.projectTitle,
                                      members: _editedProject.members,
                                    );
                                  },
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
                                    hintText: 'Describe your Project',
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
                            Text('Project Lead'),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  // controller: _marksController,
                                  // onSubmitted: (_) => _submitData(),
                                  initialValue: _initValues['projectLead'],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter Project Leader Name.";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _editedProject = ProjectList(
                                      id: _editedProject.id,
                                      description: _editedProject.description,
                                      projectLead: value,
                                      projectTitle: _editedProject.projectTitle,
                                      members: _editedProject.members,
                                    );
                                  },
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
                                    hintText: 'Enter Project Lead Name',
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
                                Text('Members'),
                                RaisedButton(
                                  color: Color.fromRGBO(39, 99, 209, 10),
                                  onPressed: () {
                                    _AddNewMember(context);
                                  },
                                  textColor: Colors.white,
                                  child: Text('Add Members'),
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            height: min(specification.length * 80.0 + 0.5, 300),
                            child: ListView.builder(
                                // physics:NeverScrollableScrollPhysics(),
                                //   shrinkWrap: true,
                                itemCount: specification.length,
                                itemBuilder: (context, index) {
                                  return SpecsItem(specification[index],del);
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                              onPressed: () {
                                _editedProject = ProjectList(
                                  id: _editedProject.id,
                                  description: _editedProject.description,
                                  projectLead: _editedProject.projectLead,
                                  projectTitle: _editedProject.projectTitle,
                                  members: specification,
                                );
                                _saveForm();
                              },
                              color: Color.fromRGBO(39, 99, 209, 10),
                              textColor: Colors.white,
                              child: Text('Save Detail')),
                        ],
                      ),
                    ),
                  ),
                )),

                Text('Chat'),
                LoginScreen(),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
