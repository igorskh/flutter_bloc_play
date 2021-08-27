import 'package:flutter/material.dart';

import '../counter/counter.dart';
import '../posts/posts.dart';
import '../timer/timer.dart';
import 'view/home_page.dart';

enum Pages { home, counter, posts, timer }

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  AppRouterDelegate();

  Pages _currentPage = Pages.home;

  void _navigatePage(Pages page) {
    _currentPage = page;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        HomePage(
          onNavigate: _navigatePage,
        ),
        if (_currentPage == Pages.timer) TimerPage(),
        if (_currentPage == Pages.counter) CounterPage(),
        if (_currentPage == Pages.posts) PostsPage(),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    /* Do Nothing */
  }
}
