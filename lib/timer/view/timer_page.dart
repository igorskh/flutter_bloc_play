import 'package:counter_bloc/timer/ticker.dart';
import 'package:counter_bloc/timer/bloc/timer_bloc.dart';
import 'package:counter_bloc/timer/view/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: Ticker()),
      child: const TimerView(),
    );
  }
}

class TimerPage extends Page {
  TimerPage() : super(key: ValueKey('TimerPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => TimerScreen(),
    );
  }
}
