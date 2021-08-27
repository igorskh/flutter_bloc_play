import 'package:flutter/material.dart';

import '../router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.onNavigate}) : super(key: key);

  final ValueChanged<Pages> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onNavigate(Pages.timer),
              child: Text('Timer'),
            ),
            ElevatedButton(
              onPressed: () => onNavigate(Pages.counter),
              child: Text('Counter'),
            ),
            ElevatedButton(
              onPressed: () => onNavigate(Pages.posts),
              child: Text('Posts'),
            )
          ],
        ),
      ),
    );
  }
}
