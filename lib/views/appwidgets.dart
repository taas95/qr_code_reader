import 'package:flutter/material.dart';

//Circle RaisedButton
//
//
//

class CircleRaisedBtn extends StatefulWidget {
  const CircleRaisedBtn({
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.padding,
    this.elevation,
  });

  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final double elevation;

  @override
  _CircleRaisedBtnState createState() => _CircleRaisedBtnState();
}

class _CircleRaisedBtnState extends State<CircleRaisedBtn> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: CircleBorder(),
      onPressed: widget.onPressed,
      child: widget.child,
      color: widget.backgroundColor,
      padding: widget.padding,
      elevation: widget.elevation,
    );
  }
}

//Password field//
///
/////
//////
///////
///
///
////
class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
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
    this.editCompleted,
    // this.decoration,
    // this.mychild,
    // this.paswfieldgestureDetector,
    this.style,
    this.controller,
  });

  final TextEditingController controller;
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
  final VoidCallback editCompleted;
  // final InputDecoration decoration;
  // final Widget mychild;
  // final GestureDetector paswfieldgestureDetector;
  final TextStyle style;

  @override
  _AppPasswordFieldState createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: widget.key,
        obscureText: _obscureText,
        maxLength: 12,
        controller: widget.controller,
        validator: widget.validator,
        style: widget.style,
        onEditingComplete: widget.editCompleted,
        decoration: new InputDecoration(
            border: widget.border,
            filled: true,
            fillColor: widget.fillColor,
            hintText: widget.hintText,
            labelText: widget.labelText,
            contentPadding: widget.padding,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  )),
            )));
  }
}

class ElevatatedCircularAvatar extends StatelessWidget {
  ElevatatedCircularAvatar({
    this.componentElevation,
    this.padding,
    this.componentChild,
    this.componentColor,
    this.onPressed,
  });
 final EdgeInsetsGeometry padding;
 final Widget componentChild;
 final double componentElevation;
 final Color componentColor;
 final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: padding,
      child: componentChild,
      elevation: componentElevation,
      color: componentColor,
      shape: CircleBorder(),
      onPressed: onPressed,
    );
  }
}
