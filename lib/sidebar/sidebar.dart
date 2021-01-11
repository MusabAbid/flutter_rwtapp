import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rwtapp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_rwtapp/screens/login_screen.dart';
import 'package:flutter_rwtapp/sidebar/menu_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;

  final _animationDuration = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSideBarOpenedStreamController.stream;
    isSidebarOpenedSink = isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 43,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height*1,
                  color: Colors.green,
                  child:SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          GestureDetector(
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyProfileClickedEvent);
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Musab",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Text(
                                "Musab.rana321@gmail.com",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40)
                                  ),
                                  child: Icon(
                                    Icons.perm_identity,
                                    color: Colors.greenAccent,
                                    size: 50,
                                  ),
                                ),
                                radius: 40,
                              ),
                            ),
                          ),
                          Divider(
                            height: 45,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),
                          MenuItem(
                            icon: Icons.home,
                            title: "Dashboard",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.person,
                            title: "My Profile",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyProfileClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.people,
                            title: "Member Registration",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MemberRegistrationClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.receipt,
                            title: "Rules Regulations",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.RecepientRegistrationClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.monetization_on,
                            title: "My Donations",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDonationClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.campaign,
                            title: "Add New Campaign",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.AddNewCampaignClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.campaign_outlined,
                            title: "Add New News",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.AddNewNewsClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.mail_outline,
                            title: "Lets Talk",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDonationClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.payments_outlined,
                            title: "Payment History",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.PaymentHistoryClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: FontAwesomeIcons.donate,
                            title: "Take Donations",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.TakeDonationClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.payment,
                            title: "Make Payment",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MakePaymentClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.card_giftcard_outlined,
                            title: "Beneficiary",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.BeneficialClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.work_outline,
                            title: "Projects",
                            onTap: (){
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ProjectsClickedEvent);
                            },
                          ),
                          Divider(
                            height: 45,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),
                          MenuItem(
                            icon: Icons.exit_to_app,
                            title: "Logout",
                            onTap: (){
                              onIconPressed();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                          ),

                        ],
                      ),
                  ),
                  ),
                ),

              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.green,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2-20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
    path.quadraticBezierTo(0,height-8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
