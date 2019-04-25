import 'package:flutter/material.dart';


class AppFont {

  double defaultfontSize = 15;
  
}
class HexColor extends Color {
  static int _getColorFromHEx(String hexColor) 
  {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHEx(hexColor));
}

int hexToint(String hex) 
{
  int val = 0;
  int len = hex.length;
  for(int i = 0 ;i<len;i++)
  {
    int hexDigit = hex.codeUnitAt(i);
    if(hexDigit>=48 && hexDigit<=57)
    {
      val +=(hexDigit-48)*(1<<(4* (len-1-i)));

    }else if (hexDigit>=64 && hexDigit<=70)
    {
val+=(hexDigit-55)* (1<<(4*(len-1-i)));

    }
    else{
      throw new FormatException("Invalide hexadecimal value");
    }
  }
  return val;
  
}




