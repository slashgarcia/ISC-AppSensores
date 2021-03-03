import 'package:flutter/material.dart';
import 'package:sist_prog_app/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{"/": (BuildContext context) => HomePage()};
}
