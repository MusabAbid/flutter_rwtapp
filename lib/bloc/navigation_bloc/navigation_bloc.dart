import 'package:bloc/bloc.dart';
import 'package:flutter_rwtapp/pages/memberRegisteration.dart';
import 'package:flutter_rwtapp/pages/myDonation.dart';
import 'package:flutter_rwtapp/pages/myProfile.dart';
import 'package:flutter_rwtapp/pages/rulesRegulations.dart';
import 'package:flutter_rwtapp/screens/Home.dart';
import 'package:flutter_rwtapp/pages/add_new_campaign.dart';



enum NavigationEvents {
  HomePageClickedEvent,
  MyProfileClickedEvent,
  MemberRegistrationClickedEvent,
  RecepientRegistrationClickedEvent,
  MyDonationClickedEvent,
  AddNewCampaignClickedEvent,

}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => AddPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield AddPage();
        break;
      case NavigationEvents.MyProfileClickedEvent:
        yield MyProfile();
        break;
      case NavigationEvents.MemberRegistrationClickedEvent:
        yield MemberRegistration();
        break;
      case NavigationEvents.RecepientRegistrationClickedEvent:
        yield RulesRegulations();
        break;
      case NavigationEvents.MyDonationClickedEvent:
        yield MyDonation();
        break;
      case NavigationEvents.AddNewCampaignClickedEvent:
        yield NewCampaign();
        break;

    }
  }
}
