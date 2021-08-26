part of 'router.dart';

class AppRoute {
  static String pagePrefix(AppPages page) {
    switch (page) {
      case AppPages.main:
        return '';
      case AppPages.home:
        return 'home';
      case AppPages.unknown:
        return '404';
      case AppPages.detail:
        return 'detail';
      case AppPages.timer:
        return 'timer';
      case AppPages.posts:
        return 'posts';
    }
  }

  final AppPages page;
  int id = 0;

  String get path {
    var resPath = '/${AppRoute.pagePrefix(page)}';
    if (page == AppPages.detail) {
      resPath = '$resPath/$id';
    }
    return resPath;
  }

  String get key {
    switch (page) {
      case AppPages.main:
        return 'Main';
      case AppPages.home:
        return 'Home';
      case AppPages.unknown:
        return 'Unknown';
      case AppPages.detail:
        return 'Detail$id';
      case AppPages.timer:
        return 'Timer';
      case AppPages.posts:
        return 'Posts';
    }
  }

  AppRoute.main() : page = AppPages.main;

  AppRoute.home() : page = AppPages.home;

  AppRoute.timer() : page = AppPages.timer;

  AppRoute.posts() : page = AppPages.posts;

  AppRoute.detail({required this.id}) : page = AppPages.detail;

  AppRoute.unknown() : page = AppPages.unknown;

  bool isPage(AppPages reqPage) => reqPage == page;
}
