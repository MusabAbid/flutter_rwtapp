import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_rwtapp/screens/new_takeDonation_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rwtapp/models/take_donation.dart';
import 'package:flutter_rwtapp/models/past_TakeDonation_model.dart';
import 'package:flutter_rwtapp/widgets/past_item.dart';
class MakePayment extends StatefulWidget with NavigationStates {
  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment>
    with SingleTickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();
  // ignore: non_constant_identifier_names
  List<TakeDonation> FilterItem = [];
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Past> item=Provider.of<Pasts>(context).items;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Center(child: Text('Make Payment')),
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
                          text: 'New',
                          icon: Icon(Icons.add_box_rounded,
                              color: Color.fromRGBO(39, 99, 209, 10))),
                      Tab(
                          text: 'Past',
                          icon: Icon(Icons.account_box,
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
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 5),
                          child: Card(
                            margin: EdgeInsets.all(0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              child: TextField(
                                onChanged: (string) {
                                  List<TakeDonation> dummyList = Provider.of<
                                      ListTakeDonation>(context,listen: false)
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)))),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 1,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: FilterItem.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => NewTakeDonation(
                                        item: FilterItem[index],

                                        // destination: destination,
                                      ),
                                    ),
                                  );
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
                                        Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(3),
                                            ),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(3),
                                                    bottomLeft:
                                                    Radius.circular(3)),
                                                child: Image.network(
                                                  FilterItem[index].image,
                                                  fit: BoxFit.cover,
                                                ))),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
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
                                                Text(
                                                    'Role: ${FilterItem[index].role}'),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    'City: ${FilterItem[index].city}'),
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
                    child: Container(
                      height: MediaQuery.of(context).size.height*1,
                      child: ListView.builder(
                        key:  UniqueKey(),
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return PastItem(
                            past: item[index],
                          );
                        },
                      ),
                    ),
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
