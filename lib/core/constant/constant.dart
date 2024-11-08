import 'package:flutter/material.dart';

goTo(context, WidgetBuilder view) {
  return Navigator.push(context, MaterialPageRoute(builder: view));
}

goToAndReplacement(context, WidgetBuilder view) {
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: view));
}

