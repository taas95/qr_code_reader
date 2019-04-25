import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';

class SplashScreenView extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new HomePage(),
        title: new Text(
          'Quark Mobile App',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.green),
        ),
        // image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        image: new Image.asset("image/img1.jpg"),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.green);
  }
}

// LoginPage
class IdentificationPage extends StatefulWidget {
  @override
  IdentificationPageState createState() {
    return new IdentificationPageState();
  }
}
