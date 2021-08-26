part of 'router.dart';

AppRoute parseRoute(Uri uri) {
  // Handle '/'
  if (uri.pathSegments.isEmpty) {
    return AppRoute.main();
  }

  if (uri.pathSegments.length == 1) {
    if (uri.pathSegments[0] == 'home') {
      return AppRoute.home();
    }
  }

  if (uri.pathSegments.length == 2) {
    if (uri.pathSegments[0] == 'detail') {
      var detailId = int.tryParse(uri.pathSegments[1]) ?? 0;
      return AppRoute.detail(id: detailId);
    }
  }

  return AppRoute.unknown();
}

class AppRoute {
  final AppPages page;
  int id = 0;

  AppRoute.main() : page = AppPages.main;

  AppRoute.home() : page = AppPages.home;

  AppRoute.timer() : page = AppPages.timer;

  AppRoute.posts() : page = AppPages.posts;

  AppRoute.detail({required this.id}) : page = AppPages.detail;

  AppRoute.unknown() : page = AppPages.unknown;

  bool isPage(AppPages reqPage) => reqPage == page;
}
