import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'comptePro/addClub.dart';
import 'friends/friendsPage.dart';
import 'package:lynight/nightCubPage/nightClubProfile.dart';
import 'package:lynight/profilUtilisateur/profilUtilisateur.dart';
import 'package:lynight/maps/googleMapsClient.dart';
import 'package:lynight/authentification/auth.dart';
import 'package:lynight/authentification/root_page.dart';
import 'package:lynight/myReservations/myReservation.dart';
import 'package:lynight/nightCubPage/sumUpPage.dart';
import 'package:lynight/sliderInformations/about.dart';
import 'package:lynight/sliderInformations/termsAndConditions.dart';
import 'package:lynight/sliderInformations/confidentiality.dart';
import 'package:lynight/friends/eventInvitation.dart';
import 'package:lynight/test/testAdminBoite.dart';
import 'package:lynight/creditCard/CarteCredit.dart';
import 'package:provider/provider.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createStates
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final primaryColor = const Color(0xFF7854d3);
  final accentColor = const Color(0xFF6f43e0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //retire la banniere de debug
        theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: accentColor,
          fontFamily: 'Comfortaa',
        ),
        routes: {
          '/': (BuildContext context) => RootPage(auth: Auth(),),
          '/nightClubProfile': (BuildContext context) => NightClubProfile(),
          '/userProfil': (BuildContext context) => UserProfil(),
          '/myReservations': (BuildContext context) => ListPage(),
          '/maps': (BuildContext context) => GoogleMapsClient(),
          '/sumUpPage': (BuildContext context) => SumUp(),
          '/addClub' : (BuildContext context) => AddClub(),
          '/friends' : (BuildContext context) => FriendsPage(),
          //'/favorites':(BuildContext context) => FavoritesNightClub(),
          '/about': (BuildContext context) => About(),
          '/terms&conditions': (BuildContext context) => TermsAndConditions(),
          '/confidentiality' : (BuildContext context)=> Confidentiality(),
          '/eventInvitation' : (BuildContext context)=> EventInvitation(),
          '/testAdminBoite' : (BuildContext context)=> TestAdminBoite(),
          '/carteCredit' : (BuildContext context)=> CarteCredit(),
        },
      ),
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider<DrawerStateInfo>(
            create: (_) => DrawerStateInfo()),
      ],
    );
  }
}

class DrawerStateInfo with ChangeNotifier {
  int _currentDrawer = 0;

  int get getCurrentDrawer => _currentDrawer;

  void setCurrentDrawer(int drawer) {
    _currentDrawer = drawer;
    notifyListeners();
  }

  void increment() {
    notifyListeners();
  }
}
