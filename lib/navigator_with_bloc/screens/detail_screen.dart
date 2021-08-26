import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/bloc/router_bloc.dart';
import '../router/router.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void _navigateDetail(int id) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPush(route: AppRoute.detail(id: id)),
    );
  }

  void _resetToHome() {
    BlocProvider.of<RouterBloc>(context).add(
      RouterReplace(route: AppRoute.main()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<RouterBloc, RouterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Detail ${widget.index}')),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => _navigateDetail(state.pages.length - 1),
                    child: Text('Next Detail')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _resetToHome, child: Text('Main')),
                SizedBox(height: 10),
                Text(
                  '${widget.index}',
                  style: textTheme.headline2,
                  key: const Key('detailView_result'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
