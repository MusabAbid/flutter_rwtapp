import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/screens/new_project.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
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
                    .push(MaterialPageRoute(builder: (context) => NewProject()));
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
                        // Container(
                        //   height: MediaQuery.of(context).size.height * 1,
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     itemCount: FilterItem.length,
                        //     itemBuilder: (context, index) {
                        //       return GestureDetector(
                        //         onTap: () {
                        //           Navigator.of(context).push(
                        //             MaterialPageRoute(
                        //               builder: (context) => NewTakeDonation(
                        //                 item: FilterItem[index],
                        //
                        //                 // destination: destination,
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(10.0),
                        //           child: Card(
                        //             margin: EdgeInsets.all(0),
                        //             elevation: 2,
                        //             child: Row(
                        //               crossAxisAlignment:
                        //               CrossAxisAlignment.center,
                        //               children: [
                        //                 Container(
                        //                     height: 120,
                        //                     width: 120,
                        //                     decoration: BoxDecoration(
                        //                       borderRadius:
                        //                       BorderRadius.circular(3),
                        //                     ),
                        //                     child: ClipRRect(
                        //                         borderRadius: BorderRadius.only(
                        //                             topLeft: Radius.circular(3),
                        //                             bottomLeft:
                        //                             Radius.circular(3)),
                        //                         child: Image.network(
                        //                           FilterItem[index].image,
                        //                           fit: BoxFit.cover,
                        //                         ))),
                        //                 Expanded(
                        //                   child: Padding(
                        //                     padding: const EdgeInsets.only(
                        //                         left: 8.0),
                        //                     child: Column(
                        //                       mainAxisAlignment:
                        //                       MainAxisAlignment
                        //                           .spaceBetween,
                        //                       crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                       children: [
                        //                         Text(
                        //                           FilterItem[index].name,
                        //                           style: TextStyle(
                        //                             fontWeight: FontWeight.bold,
                        //                             fontSize: 20,
                        //                           ),
                        //                         ),
                        //                         SizedBox(
                        //                           height: 5,
                        //                         ),
                        //                         Text(
                        //                             'Father: ${FilterItem[index].fName}'),
                        //                         SizedBox(
                        //                           height: 5,
                        //                         ),
                        //                         Text(
                        //                             'Role: ${FilterItem[index].role}'),
                        //                         SizedBox(
                        //                           height: 5,
                        //                         ),
                        //                         Text(
                        //                             'City: ${FilterItem[index].city}'),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Icon(
                        //                   Icons.chevron_right,
                        //                   size: 40,
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
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
