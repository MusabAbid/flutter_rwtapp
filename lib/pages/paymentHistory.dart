import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_rwtapp/models/payment_history_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
class PaymentHistoryPage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Center(child: Text('Payment History')),
      ),
      body: ListView.builder(
        itemCount: payments.length,
        itemBuilder: (BuildContext context, int index) {
          PaymentHistory payment=payments[index];
          return Card(
            child:Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height:80,
                      width: 80,
                      decoration: BoxDecoration(
                        border:  Border.all(color: Colors.grey,width: 1),
                      ),
                      child: Icon(Icons.payments_outlined,size: 40,)),
                  SizedBox(width: 5,),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rs.${payment.money.toString()}',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),),
                        Text(payment.type,style: TextStyle(
                          color: Colors.grey
                        ),),
                        Text('Pay By: ${payment.from}',style: TextStyle(
                            color: Colors.grey
                        ),),
                      ],
                    ),
                  ),
                  Text(DateFormat('dd/MM/yyyy').format(payment.date)),
                ],
              ),
            ),
            elevation: 2,
          );
        },
      ),
    );
  }
}
