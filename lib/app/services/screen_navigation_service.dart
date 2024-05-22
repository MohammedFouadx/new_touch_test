
import 'package:flutter/material.dart';

void pushScreen(BuildContext context , Widget widget){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget)
    );
}

void pushNamedScreen(BuildContext context , String route , {Object? arguments}){
  Navigator.pushNamed(
    context,
    route,
    arguments: arguments,
  );
}

void pushScreenReplacement(BuildContext context , Widget widget){
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget)
  );
}

void pushScreenRemoveUntil(BuildContext context , Widget widget){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget) , (Route<dynamic> route) => false
  );
}