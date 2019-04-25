import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'socialnetwork.dart';
import 'appthemedesign.dart';
import 'privacy.dart';
import 'collections.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Parametre"),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10, right: 10.0, top: 20, bottom: 20),
        children:
            //  <Widget>
            [
          // SizedBox(
          //   height: 24,
          // ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: SizedBox(
          //     height: 40,
          //     width: 40,
          //     child: RaisedButton(
          //       shape: CircleBorder(),
          //       child: Icon(Icons.arrow_back),
          //       padding: EdgeInsets.all(1),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //     ),
          //   ),
          // ),

          _subtitles("A propos de moi "),
          SizedBox(
            height: 10.0,
          ),
          UserSection(),
          SizedBox(height: 24.0),
          _subtitles('Mes collections'),
          SizedBox(
            height: 10.0,
          ),
          CollectionSection(),
          SizedBox(
            width: 100,
            height: 24.0,
          ),
          _subtitles("Sur les réseaux"),
          SizedBox(height: 10.0),
          SocialSection(),
          SizedBox(
            width: 100,
            height: 24.0,
          ),
          // _subtitles("Privacy"),
          SizedBox(height: 10.0),
          PrivacySection(),
        ],
      ),

      // floatingActionButton: FloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class UserSection extends StatefulWidget {
  @override
  _UserSectionState createState() => _UserSectionState();
}

class _UserSectionState extends State<UserSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 150.0,
            child: Icon(
              Icons.person,
              size: 100.0,
            ),
          ),
          Expanded(
              child: Container(
            // padding: EdgeInsets.only(left: 5.0, right: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 11),
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                      hintText: 'Nom',
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      fillColor: Colors.transparent),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 11),
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    hintText: "Prenom",
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    fillColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 11),
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                      hintText: 'E-mail',
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      fillColor: Colors.transparent),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

Center _subtitles(String text) {
  return Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 18, color: Colors.grey),
    ),
  );
}

class CollectionSection extends StatefulWidget {
  @override
  _CollectionSectionState createState() => _CollectionSectionState();
}

class _CollectionSectionState extends State<CollectionSection> {
  static List<Collections> _allCollection = Collections.availableCollection();
  // static List<City> _allcity = City.allCities();
  // var clodeCities = List.from(City.allCities());
  // static var city;
  // var _tobewraped = _allcity.map((city) => city.name);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Wrap(
        spacing: 3.0,
        runSpacing: 1.5,
        direction: Axis.horizontal,
        children: _allCollection
            .map((var c) => Chip(
                  avatar: CircleAvatar(
                    child: Text(c.name.substring(0, 1)),
                  ),
                  label: Text(c.name),
                ))
            .toList(),
      ),
      Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 40,
                width: 40,
                child: new FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              ))
        ],
      )
    ]);
  }
}

class SocialSection extends StatefulWidget {
  @override
  _SocialSectionState createState() => _SocialSectionState();
}

class _SocialSectionState extends State<SocialSection> {
  static List<SocialNetwork> _allnetwork = SocialNetwork.allsocial();
  // var _socialNetworks = _allnetwork.map((var social) => social.name);
  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 3.0,
            runSpacing: 1.5,
            direction: Axis.horizontal,
            children: _allnetwork
                .map((var s) => CircleAvatar(
                      backgroundColor: HexColor(s.basecolor),
                      maxRadius: 25.0,
                      child: Text(
                        s.name.substring(0, 1),
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: SizedBox(
          //     height: 40,
          //     width: 40,
          //     child: CircleAvatar(
          //       child: Icon(Icons.add),

          //     ),
          //   ),
          // ),
          Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: RaisedButton(
                          shape: CircleBorder(),
                          color: Colors.green,
                          elevation: 6.0,
                          splashColor: Colors.blue,
                          // highlightElevation: 12.0,
                          // highlightColor: Colors.blue,
                          onPressed: () {},
                          padding: EdgeInsets.all(1),
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ))))
            ],
          )
        ]);
  }
}

var myFabButton = Container(
  width: 200.0,
  height: 200.0,
  child: new RawMaterialButton(
    shape: new CircleBorder(),
    elevation: 6.0,
    child: new Icon(
      Icons.favorite,
      color: Colors.blue,
    ),
    onPressed: () {},
  ),
);
