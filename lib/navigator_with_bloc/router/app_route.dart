part of 'router.dart';

class AppRoute {
  final AppPages page;
  int id = 0;

  String get path {
    switch (page) {
      case AppPages.main:
        return '/';
      case AppPages.home:
        return '/home';
      case AppPages.unknown:
        return '/404';
      case AppPages.detail:
        return '/detail/$id';
      case AppPages.timer:
        return '/timer';
      case AppPages.posts:
        return '/posts';
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
