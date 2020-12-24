import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 class LatestNewsScreen extends StatefulWidget {
   final Hotel news;
   LatestNewsScreen({this.news});
   @override
   _LatestNewsScreenState createState() => _LatestNewsScreenState();
 }

 class _LatestNewsScreenState extends State<LatestNewsScreen> {
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
                     tag: widget.news.imageUrl,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(10.0),
                       child: Image(image: AssetImage(widget.news.imageUrl),
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
                           Text(widget.news.title,
                             overflow: TextOverflow.ellipsis,
                             style: TextStyle(
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
                 child: Text(widget.news.discription,style: TextStyle(
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
