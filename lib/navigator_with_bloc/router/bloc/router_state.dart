part of 'router_bloc.dart';

class RouterState {
  const RouterState({
    required this.pages,
  });

  final List<Page> pages;

  RouterState copyWith({
    List<Page>? pages,
  }) {
    return RouterState(
      pages: pages ?? this.pages,
    );
  }
}
