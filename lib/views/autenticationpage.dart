import 'package:flutter/material.dart';
import '../main.dart';
import '../views/appwidgets.dart';
import '../socialnetwork.dart';
import '../appthemedesign.dart';
import '../controllers/autentication.controller.dart';
import 'dart:core';
import '../models/user.dart';

String useremail;
String userpwd;
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();
  bool _obscureText = true;
  final email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  final pwd = TextEditingController();
  final pwd2 = TextEditingController();
  static List<SocialNetwork> _allnetwork = SocialNetwork.allsocial();
  //Widgets
  static Widget _iconLogin = Icon(
    Icons.arrow_forward,
    color: Colors.white,
  );
  Widget _signinBtnChild = _iconLogin;

  final Widget _circleprogress = SizedBox(
      height: 25.0,
      width: 25.0,
      child: new CircularProgressIndicator(
        // backgroundColor: Colors.white,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        // value: 1.0,
        strokeWidth: 2.0,
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        children: <Widget>[
          SizedBox(
            height: 120.0,
          ),
          Column(
            children: <Widget>[
              //Email Entry field
              // Text('Quark',style: TextStyle(fontSize: 44.0, color: Colors.blue),),
              // SizedBox(height: 20.0,),
              Text(
                "Créer un compte",
                style: TextStyle(
                    fontSize: appFont.defaultfontSize, color: Colors.black),
              ),
              SizedBox(
                height: 70.0,
              ),

              TextFormField(
                controller: email,
                onEditingComplete: () {
                  email.text;
                },
                style: TextStyle(
                    fontSize: appFont.defaultfontSize, color: Colors.black),
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email',
                    // labelText: 'Email',
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    fillColor: Colors.transparent,
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 0),
                    )),
              ),
              SizedBox(
                height: 10.0,
              ),
              //Password text field
              AppPasswordField(
                style: TextStyle(
                    fontSize: appFont.defaultfontSize, color: Colors.black),
                helperText: 'Entrez votre mot de passe ici',
                hintText: 'Mot de passe',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                fillColor: Colors.transparent,
                padding: EdgeInsets.all(15),
                controller: pwd,
                editCompleted: () {
                  pwd.text;
                },
              ),
              AppPasswordField(
                style: TextStyle(
                    fontSize: appFont.defaultfontSize, color: Colors.black),
                helperText: 'Retapez votre mot de passe ici ',
                hintText: 'Retapez votre mot de passe',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                fillColor: Colors.transparent,
                padding: EdgeInsets.all(15),
              )
            ],
          ),
          CircleRaisedBtn(
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.blueAccent,
            child:
                //  CircularProgressIndicator(
                //   backgroundColor: Colors.white,
                //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                // ),
                _signinBtnChild,
            // Icon(
            //   Icons.arrow_forward,
            //   color: Colors.white,
            // ),
            elevation: 10,
            onPressed: () {
              // setState(() {
              //   _signinBtnChild = _circleprogress;
              // });
              useremail=email.text;
              userpwd=pwd.text;
              actionsignup();

              // user.email =email.text;
              // print("This is mail ${email.text}  this is passord: ${pwd.text}");
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: FlatButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              child: Text('Vous avez dejà un compte',
                  style: TextStyle(fontSize: appFont.defaultfontSize)),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          // SizedBox(height: 120.0,),
          Align(
            alignment: Alignment.center,
            child: CircleRaisedBtn(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close),
              padding: EdgeInsets.all(7.0),
              elevation: 8.0,
            ),
          )

          // SizedBox(height: 120.0,),
          // TextFormField(
          //   style: TextStyle(fontSize: 11),
          //   textCapitalization: TextCapitalization.none,
          //   decoration: InputDecoration(
          //       hintText: 'Password',
          //       filled: true,
          //       contentPadding: EdgeInsets.all(10),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(40))),
          //       fillColor: Colors.transparent),
          // ),
        ],
      ),
      // floatingActionButton: CircleRaisedBtn(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: Icon(Icons.close),
      //   padding: EdgeInsets.all(7.0),
      //   elevation: 8.0,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();
  bool _obscureText = true;
  final email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  final pwd = TextEditingController();
  static List<SocialNetwork> _allnetwork = SocialNetwork.allsocial();
  //Widgets
  static Widget _iconLogin = Icon(
    Icons.arrow_forward,
    color: Colors.white,
  );
  Widget _signinBtnChild = _iconLogin;

  final Widget _circleprogress = SizedBox(
      height: 25.0,
      width: 25.0,
      child: new CircularProgressIndicator(
        // backgroundColor: Colors.white,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        // value: 1.0,
        strokeWidth: 2.0,
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        children: <Widget>[
          SizedBox(
            height: 120.0,
          ),
          Column(
            children: <Widget>[
              //Email Entry field
              // Text('Quark',style: TextStyle(fontSize: 44.0, color: Colors.blue),),
              // SizedBox(height: 20.0,),
              Text(
                "Se connecter",
                style: TextStyle(
                    fontSize: appFont.defaultfontSize, color: Colors.black),
              ),
              SizedBox(
                height: 70.0,
              ),

              TextFormField(
                controller: email,
                onEditingComplete: () {
                  email.text;
                },
                style: TextStyle(
                    fontSize: appFont.defaultfontSize, color: Colors.black),
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email',
                    // labelText: 'Email',
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    fillColor: Colors.transparent,
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 0),
                    )),
              ),
              SizedBox(
                height: 10.0,
              ),
              //Password text field
              AppPasswordField(
                style: TextStyle(
                    fontSize: appFont.defaultfontSize, color: Colors.black),
                helperText: 'Entrez votre mot de passe ici',
                hintText: 'Mot de passe',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                fillColor: Colors.transparent,
                padding: EdgeInsets.all(15),
                controller: pwd,
                editCompleted: () {
                  pwd.text;
                },
              ),
            ],
          ),
          CircleRaisedBtn(
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.blueAccent,
            child:
                //  CircularProgressIndicator(
                //   backgroundColor: Colors.white,
                //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                // ),
                _signinBtnChild,
            // Icon(
            //   Icons.arrow_forward,
            //   color: Colors.white,
            // ),
            elevation: 10,
            onPressed: () {
              setState(() {
                _signinBtnChild = _circleprogress;
              });
              print("This is mail ${email.text}  this is passord: ${pwd.text}");
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: FlatButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/signup');
              },
              child: Text('Créer un compte',
                  style: TextStyle(fontSize: appFont.defaultfontSize)),
            ),
          ),
          SizedBox(
            height: 90.0,
          ),
          // SizedBox(height: 120.0,),
          Align(
            alignment: Alignment.center,
            child: CircleRaisedBtn(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close),
              padding: EdgeInsets.all(7.0),
              elevation: 8.0,
            ),
          )
          // TextFormField(
          //   style: TextStyle(fontSize: 11),
          //   textCapitalization: TextCapitalization.none,
          //   decoration: InputDecoration(
          //       hintText: 'Password',
          //       filled: true,
          //       contentPadding: EdgeInsets.all(10),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(40))),
          //       fillColor: Colors.transparent),
          // ),
        ],
      ),
      // floatingActionButton: CircleRaisedBtn(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: Icon(Icons.close),
      //   padding: EdgeInsets.all(7.0),
      //   elevation: 8.0,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Row(
//   mainAxisSize: MainAxisSize.max,
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   crossAxisAlignment: CrossAxisAlignment.end,
//   children: _allnetwork
//               .map((var s) => ElevatatedCircularAvatar(
//               componentChild: Text(s.name.substring(0,1)),
//               padding: EdgeInsets.all(17),
//               componentColor: HexColor(s.basecolor),
//               componentElevation: 7.0,
//               onPressed: (){

//               },
//               )

//               // CircleAvatar(

//               //       backgroundColor: HexColor(s.basecolor),
//               //       maxRadius: 25.0,
//               //       child: Text(
//               //         s.name.substring(0, 1),
//               //         style: TextStyle(color: Colors.white),
//               //       ),
//               //     ))
//               // .toList(),
//               ).toList()
// )
