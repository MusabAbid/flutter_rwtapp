import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/Education_model.dart';
import 'package:flutter_rwtapp/widgets/education_item.dart';


class EducationList extends StatelessWidget {
  final List<Education> educations;
  final Function deleteTx;

  EducationList({this.educations, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return educations.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Text(
            'No Degree added yet!',
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

        return EducationItem(education: educations[index], deleteTx: deleteTx);
      },
      itemCount: educations.length,
    );
  }
}

