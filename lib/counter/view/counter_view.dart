import 'package:counter_bloc/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ControlButtons extends StatelessWidget {
  const ControlButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          key: const Key('counterView_increment'),
          child: const Icon(Icons.add),
          onPressed: () => context.read<CounterCubit>().increment(),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          key: const Key('counterView_decrement'),
          child: const Icon(Icons.remove),
          onPressed: () => context.read<CounterCubit>().decrement(),
        ),
      ],
    );
  }
}


/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    void onCounterNumberTap() {
      context.read<CounterCubit>().reset();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return GestureDetector(
                child: Text(
                  '$state',
                  style: textTheme.headline2,
                  key: const Key('counterView_result'),
                ),
                onTap: onCounterNumberTap,
            );
          },
        ),
      ),
      floatingActionButton: ControlButtons(),
    );
  }
}