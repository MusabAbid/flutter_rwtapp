import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/job_model.dart';
import 'package:flutter_rwtapp/widgets/job_item.dart';
import 'package:provider/provider.dart';

class JobList extends StatelessWidget {
  final List<Job> jobs;
  final Function deleteTx;

  JobList({this.jobs, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    final job=Provider.of<Jobs>(context).items;
    return job.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Text(
            'No Job added yet!',
            style: Theme.of(context).textTheme.title,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: constraints.maxHeight * 0.6,
              child:Icon(Icons.hourglass_empty,size: 300,)
          ),
        ],
      );
    })
        : ListView.builder(
      physics:NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, index) {

        return JobItem(job: job[index], deleteTx: deleteTx);
      },
      itemCount: job.length,
    );
  }
}

