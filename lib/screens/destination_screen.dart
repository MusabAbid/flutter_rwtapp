import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/campaign_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({this.destination});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        boxShadow: [BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0,2.0),
                        blurRadius: 6.0,
                      ),
                      ],
                  ),
                   child:Hero(
                     tag: widget.destination.imageUrl,
                     child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                       child: Image(image: AssetImage(widget.destination.imageUrl),
                       fit: BoxFit.cover,
                       ),
                     ),
                   ),
                ),
                Positioned(
                  top: 20,
                  right: 5,
                  child: Stack(
                    children:[ IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: ()=>Navigator.pop(context),
                    ),]
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 10.0,
                  child:Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.locationArrow,
                                size: 10.0,
                                color:Colors.white,
                              ),
                              SizedBox(width: 5.0),
                              Text(widget.destination.title,style: TextStyle(
                                color:Colors.white,
                                fontSize: 20.0 ,
                              ),),
                            ],
                          ),
                    ),
                  ),
                  ),
              ],
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(widget.destination.description,style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                ),),
              ),
            )
            // Expanded(
            //   child: ListView.builder(
            // //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
