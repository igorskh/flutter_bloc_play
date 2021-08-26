import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './router/bloc/router_bloc.dart';
import './router/router.dart';

class MyApp extends StatelessWidget {
  final RouterBloc routerBloc = RouterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouterBloc>(
      create: (_) => routerBloc,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRouterDelegate(routerBloc: routerBloc),
        routeInformationParser: AppRouteInformationParser(),
      ),
    );
  }
}
