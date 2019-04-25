import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'userSettings.dart';
import 'cityClass.dart';
import 'openscreen.dart';
import 'util/db/sqlite/sqlitehandler.dart';
import 'services/auth.services.class.dart';
import 'views/autenticationpage.dart';
import 'appthemedesign.dart';
import 'models/user.dart';

//vars
// User user = new User();
Widget _defaultHome = SplashScreenView();
AuthServices _authServices = new AuthServices();
AppFont appFont = new AppFont();
  var datbase = new SqlHandler();

//

Future main() async{ 
  //Init the database


  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // No<tice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: SplashScreenView(),
      routes: {
        '/home':(context)=>HomePage(),
        '/login':(context)=>Login(),
        '/settings':(context)=>UserSettings(),
        '/signup':(context)=>SignUp(),
      },
    );
  }
}

// ******************************************************************************
// ******************************************************************************
// *********************************Begin Views**********************************
// ******************************************************************************
// ******************************************************************************
// ******************************************************************************

/* 
************************************Begin Home page************************************
*********************************************************************************
*********************************************************************************
*********************************************************************************
 */

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKeyHome =
      new GlobalKey<ScaffoldState>();
  String data = "Here appear code scanned";
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        data = "Success";
        _itemsoflist.add(qrResult);
      });
    } on PlatformException catch (ex) {
      if (ex == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          data = "Camera access denied";
        });
      } else {
        data = "Unknonw error $ex";
      }
    } on FormatException catch (ex) {
      setState(() {
        data = "User cancelled the scan operation $ex";
      });
    }
  }

  List<String> _itemsoflist = [];
  TextEditingController txtController = new TextEditingController();
  Widget build(BuildContext context) {
    var floatingActionButton2 = FloatingActionButton.extended(
      icon: Icon(Icons.camera_alt),
      label: Text('Scan'),
      onPressed: _scanQR,
    );
    return Scaffold(
      key: _scaffoldKeyHome,
      appBar: AppBar(
        title: Text('Qr code scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IdentificationPage()));
              // _scaffoldKeyHome.currentState.showSnackBar(new SnackBar(
              //   content: Text("Profil page will be soon available"),
              // ));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              data,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Go to next page '),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CitiesViewWidget()));
              },
              color: Colors.green,
            ),
            RaisedButton(
              child: Text('Go to Settings'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserSettings()));
              },
            ),
            RaisedButton(
              child: Text("Open login page"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            RaisedButton(
              child: Text("Open sign up page"),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');

              },
            ),
            // TextField(
            //     controller: txtController,
            //     onSubmitted: (text) {
            //       items_of_list.add(text);
            //       txtController.clear();
            //       setState(() {});
            //     }),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: new ListView.builder(
                itemCount: _itemsoflist.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Text(_itemsoflist[index]);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: floatingActionButton2,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
/* 
************************************End Home page************************************
*********************************************************************************
*********************************************************************************
*********************************************************************************
 */

//SplashScreen Class

class IdentificationPageState extends State<IdentificationPage> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              // padding: EdgeInsets.only(top: 5,right: 8,left: 8),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 92,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      border: UnderlineInputBorder(),
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  PasswordField(
                    fieldkey: _passwordFieldKey,
                    helperText: 'Please fill your password here',
                    labelText: 'Password',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  MaterialButton(
                    child: Text("Login"),
                    color: Colors.green,
                    minWidth: 2,
                    onPressed: () {},
                  ),
                  // TextFormField(
                  //   textCapitalization: TextCapitalization.none,
                  //   decoration: InputDecoration(
                  //     hintText: 'Password',
                  //     filled: true,
                  //     border: UnderlineInputBorder(),
                  //     fillColor: Colors.white,
                  //   ),
                  // ),
                  MaterialButton(
                    child: Text("Login with Google"),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text('Login anonymously'),
                    color: Colors.red,
                  ),
                  MaterialButton(
                    child: Text('Create account'),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserSettings()));
                    },
                  )
                ],
              ),
            ),
          )
              //Padding(
              ,
        )
        // padding: EdgeInsets.symmetric(vertical: 200.0),
        //child:
        //)
        );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldkey,
    this.helperText,
    this.hintText,
    this.labelText,
    this.onFieldSubmited,
    this.onSaved,
    this.validator,
    this.border,
    this.fillColor,
    this.padding,
    // this.decoration,
    // this.mychild,
    // this.paswfieldgestureDetector,
    this.style,
  });

  final InputBorder border;
  final Key fieldkey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmited;
  final Color fillColor;
  final EdgeInsetsGeometry padding;
  // final InputDecoration decoration;
  // final Widget mychild;
  // final GestureDetector paswfieldgestureDetector;
  final TextStyle style;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: widget.key,
        obscureText: _obscureText,
        maxLength: 12,
        validator: widget.validator,
        style: widget.style,
        decoration: new InputDecoration(
          border: widget.border,
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          labelText: widget.labelText,
          contentPadding: widget.padding,
          suffixIcon:
          Padding(
            padding: const EdgeInsets.only(top: 0,bottom: 0),
            child:           new GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText?Icons.visibility : Icons.visibility_off,)
                        ),

          )
          //  new GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         _obscureText = !_obscureText;
          //       });
          //     },
          //     child: Icon(
          //       _obscureText ? Icons.visibility : Icons.visibility_off,
          //     )
          //     ),
        ));
  }
}

//End Login page

//User parameters
//end
/*
******************************************************************************
******************************************************************************
****************************End Views*****************************************
******************************************************************************
******************************************************************************
 *****************************************************************************
 */

// ******************************************************************************
// ******************************************************************************
// ***************** */-Begin--------List of cities class**********************
// ******************************************************************************
// ******************************************************************************
// ******************************************************************************
class CitiesViewWidget extends StatefulWidget {
  @override
  _CitiesViewWidgetState createState() => _CitiesViewWidgetState();
}

class _CitiesViewWidgetState extends State<CitiesViewWidget> {
  final List<City> _allCity = City.allCities();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cities'),
        ),
        body: Container(
          padding: EdgeInsets.only(right: 10, left: 10, bottom: 20, top: 5),
          child: _getCitiesList(context),
          // child:builderCard2(context)
        ));
  }

  Widget _getCitiesList(BuildContext context) {
    return ListView.builder(
      itemCount: _allCity.length,
      // itemBuilder: (BuildContext contex, int index) {
      //   return new Text(_allCity[index].name);
      itemBuilder: builderCard2,
      // itemBuilder: cardViewVities,
    );
  }

  Widget cardViewVities(BuildContext context, int index) {
    return new Card(
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(20),
            leading: Image.asset(
              "image/" + _allCity[index].image,
              fit: BoxFit.cover,
              width: 600.0,
              height: 240,
            ),
            title: Text(
              _allCity[index].name,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_allCity[index].country, style: TextStyle(fontSize: 13.0)),
                Text("Population: ${_allCity[index].population}",
                    style: TextStyle(fontSize: 13.0)),
              ],
            ),
            onTap: () {
              _snackbar(context, _allCity[index].name);
            },
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      margin: EdgeInsets.all(5),
    );
  }

  Widget builderCard(BuildContext context, int index) {
    //Complex card
    return new Card(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    "image/" + _allCity[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _allCity[index].name,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Share'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('Explore'),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

//--------------------------builder2--------------------------
  Widget builderCard2(BuildContext context, int index) {
    //Complex card
    return new Card(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 180.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    // borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30.0)),
                    "image/" + _allCity[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomLeft,
                    child: Text(_allCity[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(color: Colors.white)
                        // TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
                        ),
                  ),
                )
              ],
            ),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              mainAxisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    _allCity[index].country,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text("Population: " + _allCity[index].population),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//New builer

_snackbar(BuildContext context, String name) {
  final SnackBar object =
      new SnackBar(content: Text(name), backgroundColor: Colors.black);
  Scaffold.of(context).showSnackBar(object);
}

// ******************************************************************************
// ******************************************************************************
// ******************End List view activity**************************************
// ******************************************************************************
// ******************************************************************************
// ******************************************************************************

// **************************************************************
// **************************************************************
// **************************************************************
// *******************Class Parts********************************
// **************************************************************
// **************************************************************
// **************************************************************

// class User {
//   final String name;
//   final String email;
//   final String pwd;

//   User({this.name, this.email, this.pwd});
// }
// **************************************************************
// **************************************************************
// **************************************************************
// *******************End Part***********************************
// **************************************************************
// **************************************************************
// **************************************************************
