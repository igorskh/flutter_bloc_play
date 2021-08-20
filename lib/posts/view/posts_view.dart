import 'package:counter_bloc/posts/bloc/post_bloc.dart';
import 'package:counter_bloc/posts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();
  late PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = context.read<PostBloc>();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return const Center(
              child: Text('Failed to fetch posts'),
            );
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return Center(
                child: Text('no posts'),
              );
            }
            return ListView.builder(
                itemBuilder: (context, index) {
                  return index >= state.posts.length
                      ? BottomLoader()
                      : PostListItem(post: state.posts[index]);
                },
              itemCount: state.hasReachedMax
              ? state.posts.length
              : state.posts.length + 1,
              controller: _scrollController,
            );
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  void _onScroll() {
    if (_isBottom) _postBloc.add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    return _scrollController.offset >= (maxScroll * 0.9);
  }
}

