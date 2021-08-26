part of 'router.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  AppRouterDelegate({required this.routerBloc}) {
    routerBloc.notifyListeners = notifyListeners;
  }

  final RouterBloc routerBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterBloc, RouterState>(
      builder: (context, state) {
        return Navigator(
          key: navigatorKey,
          onPopPage: _onPopPage,
          pages: List.of(state.pages),
        );
      },
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    routerBloc.add(
      RouterPop(
        page: route.settings as Page,
      ),
    );
    return true;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => routerBloc.navigatorKey;

  @override
  AppRoute get currentConfiguration => routerBloc.currentPath;

  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    return routerBloc.add(RouterNewPath(route: configuration));
  }
}
