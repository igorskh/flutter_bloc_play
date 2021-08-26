import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../route_to_page.dart';
import '../router.dart';

part 'router_event.dart';
part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc()
      : super(
          RouterState(pages: [
            routeToPage(AppRoute.main()),
          ]),
        );

  void Function() notifyListeners = () => {};
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppRoute get currentPath {
    return parseRoute(Uri.parse(state.pages.last.name!));
  }

  @override
  Stream<RouterState> mapEventToState(
    RouterEvent event,
  ) async* {
    if (event is RouterPop) {
      yield await _routerPopToState(event, state);
    } else if (event is RouterPush) {
      yield await _routerPushToState(event, state);
    } else if (event is RouterReplace) {
      yield await _routerReplaceToState(event.route, state);
    } else if (event is RouterNewPath) {
      yield await _routerReplaceToState(event.route, state);
    }
    notifyListeners();
  }

  Future<RouterState> _routerReplaceToState(
      AppRoute route, RouterState state) async {
    var newPage = routeToPage(route);

    if (newPage.key == state.pages.last.key) {
      return state;
    }
    return state.copyWith(
      pages: [
        newPage,
      ],
    );
  }

  Future<RouterState> _routerPopToState(
      RouterPop event, RouterState state) async {
    state.pages.remove(event.page);
    return state.copyWith(
      pages: state.pages,
    );
  }

  Future<RouterState> _routerPushToState(
      RouterPush event, RouterState state) async {
    state.pages.add(
      routeToPage(event.route),
    );
    return state.copyWith(
      pages: state.pages,
    );
  }
}
