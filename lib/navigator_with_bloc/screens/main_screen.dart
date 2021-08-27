import 'package:flutter/foundation.dart' show kIsWeb;
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

  void _addToList(List<Widget> list, Widget appWidget) {
    list.add(appWidget);
    list.add(SizedBox(height: 10));
  }

  List<Widget> _appsList() {
    List<Widget> apps = [];

    _addToList(
      apps,
      ElevatedButton(
        onPressed: () => _navigate(AppRoute.home()),
        child: Text('Counter'),
      ),
    );
    _addToList(
        apps,
        ElevatedButton(
          onPressed: () => _navigate(AppRoute.timer()),
          child: Text('Timer'),
        ));
    _addToList(
      apps,
      ElevatedButton(
        onPressed: () => _navigate(AppRoute.posts()),
        child: Text('Posts'),
      ),
    );

    _addToList(
      apps,
      ElevatedButton(
        onPressed: _navigateDetail,
        child: Text('Detail'),
      ),
    );

    if (kIsWeb) {
      apps.add(
        Text('Not available in Web'),
      );
    }
    _addToList(
      apps,
      ElevatedButton(
        onPressed: kIsWeb ? null : () => _navigate(AppRoute.todos()),
        child: Text('Todos'),
      ),
    );

    return apps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [..._appsList()],
          ),
        ),
      ),
    );
  }
}
