import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rwtapp/models/hotel_model.dart';
import 'package:flutter_rwtapp/screens/latest_news_screen.dart';

class LatestNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column( children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Active News",style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),),
            GestureDetector(
              onTap: ()=> print("See All"),
              child: Text("See All",style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),),
            ),
          ],),
      ),
      Container(
        width: double.infinity,
        // color: Colors.blue,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: hotels.length,
          itemBuilder: (BuildContext context, int index){
            Hotel hotel = hotels[index];
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => LatestNewsScreen(news: hotel,
                ),
              ),),
              child: Container(
                margin: EdgeInsets.all(10.0),
                height: 110,
                width: double.infinity,
                // color: Colors.red,
                child: Stack(
                  alignment : Alignment.topLeft,
                  children: <Widget>[
                    Positioned(
                      bottom: 2.0,
                      top: 2.0,
                      left: 2.0,
                      right: 2.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left:115.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                            hotel.title,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(height:5.0,),
                              Text(hotel.discription,style: TextStyle(
                                color: Colors.grey,
                              ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      bottom: 2,
                      left: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius:BorderRadius.circular(10.0),
                          boxShadow: [BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0,2.0),
                            blurRadius: 6.0,
                          ),],
                        ),
                        child: Hero(
                          tag: hotel.imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              height: 100.0,
                              width: 110.0,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
    );
  }
}
