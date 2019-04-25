import 'package:flutter/material.dart';


class PrivacySection extends StatefulWidget {
  @override
  _PrivacySectionState createState() => _PrivacySectionState();
}

class _PrivacySectionState extends State<PrivacySection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text("Modifier vos paramêtres de confidentialité",
        style: TextStyle(color: Colors.lightBlue,
        fontSize: 11),
        ),
      ],
      
    );
  }
}