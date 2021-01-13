import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/screens/new_project.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rwtapp/models/project_model.dart';
class Project extends StatefulWidget with NavigationStates {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<ProjectList> project=Provider.of<Projects>(context).items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,

        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: IconButton(
              onPressed:(){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NewProject(
                  id: null,
                )));
              } ,
              icon: Icon(Icons.add_box_rounded),
              iconSize: 25,
            ),
          ),

        ],
        title: Center(child: Text('Projects')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Card(
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
                          text: 'My Projects',
                          icon: Icon(Icons.my_library_books,
                              color: Color.fromRGBO(39, 99, 209, 10))),
                      Tab(
                          text: 'Other Projects',
                          icon: Icon(Icons.work_outline,
                              color: Color.fromRGBO(39, 99, 209, 10))),
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    // physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: project.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) => NewProject(
                                    id: project[index].id,
                                  )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Card(
                                    margin: EdgeInsets.all(0),
                                    elevation: 2,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  '${project[index].projectTitle}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    'Lead By: ${project[index].projectLead}'),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    'Description: ${project[index].description}'),
                                                SizedBox(
                                                  height: 5,
                                                ),
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
                  SingleChildScrollView(
                    child:Text('hello'),

                    // Container(
                    //   height: MediaQuery.of(context).size.height*1,
                    //   child: ListView.builder(
                    //     key:  UniqueKey(),
                    //     itemCount: item.length,
                    //     itemBuilder: (context, index) {
                    //       return PastItem(
                    //         past: item[index],
                    //       );
                    //     },
                    //   ),
                    // ),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
