import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/Education_model.dart';

class EducationItem extends StatefulWidget {
  const EducationItem({
    Key key,
    @required this.education,
    @required this.deleteTx,
  }) : super(key: key);

  final Education education;
  final Function deleteTx;

  @override
  _EducationItemState createState() => _EducationItemState();
}

class _EducationItemState extends State<EducationItem> {
  Color _bdColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.purple
    ];
    _bdColor=availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(39, 99, 209, 10),
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text("${widget.education.marks}",style: TextStyle(color: Colors.white),)),
          ),
        ),
        title: Text(
          widget.education.degreeTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.education.status),
            Text(widget.education.instituteName),
          ],
        ),
        trailing: MediaQuery
            .of(context)
            .size
            .width > 400
            ? FlatButton.icon(
          textColor: Theme
              .of(context)
              .errorColor,
          onPressed: () => widget.deleteTx(widget.education.id),
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme
              .of(context)
              .errorColor,
          onPressed: () => widget.deleteTx(widget.education.id),
        ),
      ),
    );
  }
}
