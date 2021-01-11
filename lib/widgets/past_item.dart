import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/past_TakeDonation_model.dart';
import 'package:intl/intl.dart';
class PastItem extends StatefulWidget {

  final Past past;

  const PastItem({
    Key key,
    this.past
}): super(key: key);
  @override
  _PastItemState createState() => _PastItemState();
}

class _PastItemState extends State<PastItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 4,top: 4),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.past.name,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 5,),
                  Text(widget.past.city),
                  SizedBox(height: 5,),
                  Text(widget.past.type),
                  SizedBox(height: 5,),
                  Text('Pay By: ${widget.past.through}')],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat.yMMMd().format(widget.past.date)),
                  SizedBox(height: 30,),
                  Text(widget.past.amount.toString(),style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
