import 'package:flutter/material.dart';

import 'router.dart';

class NoBlocNavigationApp extends StatelessWidget {
  const NoBlocNavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Router(
        routerDelegate: AppRouterDelegate(),
      ),
    );
  }
}
