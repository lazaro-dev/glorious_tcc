import 'package:flutter/material.dart';
import 'package:glorious_tcc/ui/core/state/state_manager.dart';

class StateBuilder<T> extends StatelessWidget {
  final StateManager<T> state;
  final Widget Function(BuildContext, StateManager<T>) builder;

  const StateBuilder({
    super.key,
    required this.state,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: state as ChangeNotifier,
      builder: (context, _) => builder(context, state),
    );
  }
}
