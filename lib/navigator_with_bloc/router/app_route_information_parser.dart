part of 'router.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {
  @override
  Future<AppRoute> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    return parseRoute(uri);
  }

  @override
  RouteInformation restoreRouteInformation(AppRoute path) {
    if (path.isPage(AppPages.main)) {
      return RouteInformation(location: '/');
    }
    if (path.isPage(AppPages.home)) {
      return RouteInformation(location: '/home');
    }
    if (path.isPage(AppPages.detail)) {
      return RouteInformation(location: '/detail/${path.id}');
    }
    if (path.isPage(AppPages.timer)) {
      return RouteInformation(location: '/timer');
    }
    if (path.isPage(AppPages.posts)) {
      return RouteInformation(location: '/posts');
    }
    return RouteInformation(location: '/404');
  }
}
