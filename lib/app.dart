import 'package:counter_bloc/router.dart';
import 'package:flutter/material.dart';


class PlayWithBlocApp extends StatelessWidget {
  const PlayWithBlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Router(
        routerDelegate: MyAppRouterDelegate(),
      ),
    );
  }
}
