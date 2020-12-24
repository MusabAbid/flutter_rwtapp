import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_rwtapp/models/donation_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
class MyDonation extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add),color: Colors.white, onPressed: (){}),

        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Center(child: Text('My Donations')),
      ),
      body: ListView.builder(
          itemCount: donations.length,
          itemBuilder: (BuildContext context, int index) {
            Donation donation = donations[index];
            return Card(
              elevation: 2,
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 0,left: 10,right: 10),
                leading: Container(
                  height:double.infinity,
                    width: 70,
                    decoration: BoxDecoration(
                      border:  Border.all(color: Colors.grey,width: 1),
                    ),
                    child: Icon(FontAwesomeIcons.donate,size: 40,)),
                title: Text('Rs.${donation.money.toString()}',style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                subtitle: Text(donation.type),
                trailing: Text(DateFormat('dd/MM/yyyy').format(donation.date)),
              ),
            );
          }

        ,

      ),
    );
  }
}
