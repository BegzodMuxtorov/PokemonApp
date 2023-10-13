import 'package:flutter/material.dart';
import 'package:pok_ful/model/pokemon_model.dart';
import 'package:pok_ful/view/home_page.dart';
import 'package:pok_ful/view/info_page.dart';
import 'package:pok_ful/view/settings_page.dart';

class RouterGenerator {
  static final RouterGenerator _generator = RouterGenerator._init();
  static RouterGenerator get router => _generator;

  RouterGenerator._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(HomePage());

      case 'info':
        return _navigate(InfoPage(data: settings.arguments as Pokemon));
      case 'settings':
        return _navigate(SettingsPage());
      default:
    }
  }

  MaterialPageRoute _navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
