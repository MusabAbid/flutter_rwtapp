import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/job_model.dart';
import 'package:flutter_rwtapp/widgets/new_job.dart';
import 'package:provider/provider.dart';

class JobItem extends StatefulWidget {
  const JobItem({
    Key key,
    @required this.job,
    @required this.deleteTx,
  }) : super(key: key);

  final Job job;
  final Function deleteTx;

  @override
  _JobItemState createState() => _JobItemState();
}

class _JobItemState extends State<JobItem> {
  Color _bdColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.purple
    ];
    _bdColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(widget.job.id),
        secondaryBackground:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color:Theme.of(context).errorColor,
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
                content: Text("Do you want to remove the Job?"),
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
                  child: NewJob(),
                  behavior: HitTestBehavior.opaque,
                );
              },
            );
          }
        },
        onDismissed: (direction) {
          // widget.deleteTx(widget.job.id);
          Provider.of<Jobs>(context, listen: false).deleteJobs(widget.job.id);
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
                  "${widget.job.salary}",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            title: Text(
              widget.job.designation,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.job.designation),
                Text(widget.job.companyName),
              ],
            ),
            trailing: MediaQuery.of(context).size.width > 400
                ? FlatButton.icon(
                    textColor: Theme.of(context).errorColor,
                    onPressed: () => widget.deleteTx(widget.job.id),
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                  )
                : IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => widget.deleteTx(widget.job.id),
                  ),
          ),
        ));
  }
}
