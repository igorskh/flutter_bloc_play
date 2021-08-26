part of 'router.dart';

AppRoute parseRoute(Uri uri) {
  // Handle '/'
  if (uri.pathSegments.isEmpty) {
    return AppRoute.main();
  }

  if (uri.pathSegments.length == 1) {
    if (uri.pathSegments[0] == AppRoute.pagePrefix(AppPages.home)) {
      return AppRoute.home();
    } else if (uri.pathSegments[0] == AppRoute.pagePrefix(AppPages.timer)) {
      return AppRoute.timer();
    } else if (uri.pathSegments[0] == AppRoute.pagePrefix(AppPages.posts)) {
      return AppRoute.posts();
    }
  }

  if (uri.pathSegments.length == 2) {
    if (uri.pathSegments[0] == AppRoute.pagePrefix(AppPages.detail)) {
      var detailId = int.tryParse(uri.pathSegments[1]) ?? 0;
      return AppRoute.detail(id: detailId);
    }
  }

  return AppRoute.unknown();
}
