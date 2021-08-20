import 'package:flutter/material.dart';
import 'posts/posts.dart';
import 'counter/counter.dart';
import 'timer/timer.dart';
import 'home/home.dart';

enum Pages { home, counter, posts, timer }

class MyAppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  MyAppRouterDelegate();

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
        if (_currentPage == Pages.timer)
          TimerPage(),
        if (_currentPage == Pages.counter)
          CounterPage(),
        if (_currentPage == Pages.posts)
          PostsPage(),
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
