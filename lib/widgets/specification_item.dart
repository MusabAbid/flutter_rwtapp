import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/specification_list.dart';
import 'package:provider/provider.dart';

class SpecsItem extends StatelessWidget {
  SpecificationList specList;
 Function spec;
  SpecsItem(this.specList,this.spec);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title:  Text(specList.name,style: TextStyle(
          fontWeight: FontWeight.bold,

        ),),
          subtitle: Text(specList.value,style: TextStyle(
            fontWeight: FontWeight.bold,

          ),),
          trailing: InkWell(
              onTap: () {

                spec(specList);
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
