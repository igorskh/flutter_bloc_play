part of 'router_bloc.dart';

@immutable
abstract class RouterEvent {
  const RouterEvent();
}

class RouterPop extends RouterEvent {
  final Page page;

  const RouterPop({required this.page});
}

class RouterPush extends RouterEvent {
  final AppRoute route;

  const RouterPush({required this.route});
}

class RouterReplace extends RouterEvent {
  final AppRoute route;

  const RouterReplace({required this.route});
}

class RouterNewPath extends RouterEvent {
  final AppRoute route;

  const RouterNewPath({required this.route});
}
