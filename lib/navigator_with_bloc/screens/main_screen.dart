import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/bloc/router_bloc.dart';
import '../router/router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _navigate(AppRoute route) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPush(route: route),
    );
  }

  void _navigateDetail() {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPush(route: AppRoute.detail(id: 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => _navigate(AppRoute.home()),
                child: Text('Counter')),
            ElevatedButton(
                onPressed: () => _navigate(AppRoute.timer()),
                child: Text('Timer')),
            ElevatedButton(
                onPressed: () => _navigate(AppRoute.posts()),
                child: Text('Posts')),
            ElevatedButton(onPressed: _navigateDetail, child: Text('Detail')),
          ],
        ),
      ),
    );
  }
}
