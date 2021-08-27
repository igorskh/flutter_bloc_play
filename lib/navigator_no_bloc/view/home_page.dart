import 'package:flutter/material.dart';

import '../router.dart';
import 'home_view.dart';

class HomePage extends Page {
  HomePage({required this.onNavigate}) : super(key: ValueKey('HomePage'));

  final ValueChanged<Pages> onNavigate;

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => HomeScreen(
        onNavigate: onNavigate,
      ),
    );
  }
}
