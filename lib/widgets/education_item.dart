import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/Education_model.dart';
import 'package:flutter_rwtapp/widgets/new_education.dart';
import 'package:provider/provider.dart';
class EducationItem extends StatefulWidget {
  const EducationItem({
    Key key,
    @required this.education,
  }) : super(key: key);

  final Education education;


  @override
  _EducationItemState createState() => _EducationItemState();
}

class _EducationItemState extends State<EducationItem> {
  // Color _bdColor;
  //
  // @override
  // void initState() {
  //   const availableColors = [
  //     Colors.red,
  //     Colors.blue,
  //     Colors.black,
  //     Colors.purple
  //   ];
  //   _bdColor = availableColors[Random().nextInt(4)];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(widget.education.id),
        secondaryBackground: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).errorColor,
          ),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromRGBO(39, 99, 209, 10),
          ),
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
        // direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          if (direction == DismissDirection.endToStart){
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text("Do you want to remove the Degree?"),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                    child: Text('NO'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                    child: Text('YES'),
                  ),
                ],
              ),
            );
          }
          else{
            return showModalBottomSheet(
              isScrollControlled:true,
              context: context,
              builder: (_) {
                return GestureDetector(
                  onTap: () {},
                  child: NewEducation(id: widget.education.id,),
                  behavior: HitTestBehavior.opaque,
                );
              },
            );
          }
        },
        onDismissed: (direction) {
          Provider.of<Educations>(context, listen: false).deleteEducations(widget.education.id);
        },
        child: Card(
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
                    child: Text(
                  "${widget.education.marks}",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            title: Text(
              widget.education.degreeTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.education.status),
                Text(widget.education.instituteName),
              ],
            ),

          ),
        ));
  }
}
