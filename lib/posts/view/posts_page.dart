import 'package:counter_bloc/posts/bloc/post_bloc.dart';
import 'package:counter_bloc/posts/view/posts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: BlocProvider(
        create: (_) => PostBloc(
          httpClient: http.Client(),
        )..add(PostFetched()),
        child: PostsList(),
      ),
    );
  }
}

class PostsPage extends Page {
  PostsPage() : super(key: ValueKey('PostsPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => PostsScreen(),
    );
  }
}
