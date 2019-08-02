import 'package:app1/src/pages/card_page.dart';
import 'package:app1/src/pages/inputs_page.dart';
import 'package:app1/src/pages/listview_page.dart';
import 'package:app1/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:app1/src/pages/alert_page.dart';
import 'package:app1/src/pages/avatar_page.dart';
import 'package:app1/src/pages/home_page.dart';
import 'package:app1/src/pages/animated_container_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => new HomePage(),
    'alert': (BuildContext context) => new AlertPage(),
    'avatar': (BuildContext context) => new AvatarPage(),
    'card': (BuildContext context) => new CardPage(),
    'animated': (BuildContext context) => new AnimatedContainerPage(),
    'inputs': (BuildContext context) => new InputsPage(),
    'slider': (BuildContext context) => new SliderPage(),
    'list': (BuildContext context) => new ListaPage(),
  };
}
