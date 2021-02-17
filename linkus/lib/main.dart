import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkus/screens/LandingPage/landingHelpers.dart';
import 'package:linkus/screens/LandingPage/landingServices.dart';
import 'package:linkus/screens/LandingPage/landingUtils.dart';
import 'package:linkus/services/Authentication.dart';
import 'package:linkus/services/FirebaseOperations.dart';
import 'package:provider/provider.dart';
import 'constants/Constantcolors.dart';
import 'screens/SplashScreen/SplashScreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors=ConstantColors();
    return MultiProvider(
      child: MaterialApp(
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor:constantColors.blueColor,
        fontFamily:'Poppins',
        canvasColor:Colors.transparent
      ),
    ),
    providers: [
      ChangeNotifierProvider(create:(_)=>FirebaseOperations()),
      ChangeNotifierProvider(create:(_)=>LandingHelpers()),
      ChangeNotifierProvider(create:(_)=>Authentication()),
      ChangeNotifierProvider(create:(_)=>LandingService()),
      ChangeNotifierProvider(create:(_)=>LandingUtils())
    ],
    );
  }
}
