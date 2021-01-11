import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rwtapp/models/take_donation.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
class Beneficial extends StatefulWidget with NavigationStates  {
  @override
  _BeneficialState createState() => _BeneficialState();
}

class _BeneficialState extends State<Beneficial>with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<TakeDonation> FilterItem=Provider.of<ListTakeDonation>(context).items;
    return  Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Center(child: Text('Beneficiary')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8,top: 8),
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
                            text: 'Existing',
                            icon: Icon(Icons.person,
                                color: Color.fromRGBO(39, 99, 209, 10))),
                        Tab(
                            text: 'Pending',
                            icon: Icon(Icons.business,
                                color: Color.fromRGBO(39, 99, 209, 10))),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              child: TabBarView(
                children:[ ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: FilterItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => NewTakeDonation(
                        //       item: FilterItem[index],
                        //
                        //       // destination: destination,
                        //     ),
                        //   ),
                        // );
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
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Text('Hello'),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
