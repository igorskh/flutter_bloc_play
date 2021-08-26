import 'package:counter_bloc/counter/view/counter_page.dart';
import 'package:counter_bloc/navigator_with_bloc/screens/detail_screen.dart';
import 'package:counter_bloc/navigator_with_bloc/screens/main_screen.dart';
import 'package:counter_bloc/navigator_with_bloc/screens/unknown_screen.dart';
import 'package:counter_bloc/posts/posts.dart';
import 'package:counter_bloc/timer/timer.dart';
import 'package:flutter/material.dart';

import 'router.dart';

Page routeToPage(AppRoute route) {
  final Widget child;

  final String path = route.path;
  final ValueKey key = ValueKey(route.key);

  if (route.isPage(AppPages.main)) {
    child = MainScreen();
  } else if (route.isPage(AppPages.home)) {
    child = CounterScreen();
  } else if (route.isPage(AppPages.detail)) {
    child = DetailScreen(index: route.id);
  } else if (route.isPage(AppPages.timer)) {
    child = TimerScreen();
  } else if (route.isPage(AppPages.posts)) {
    child = PostsScreen();
  } else {
    child = UnknownScreen();
  }
  return MaterialPage(
    child: child,
    name: path,
    key: key,
  );
}
