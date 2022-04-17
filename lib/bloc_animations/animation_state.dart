import 'package:equatable/equatable.dart';

abstract class AnimationState extends Equatable {
  final String animationName;
  final String task;
  const AnimationState(this.animationName, this.task);

  @override
  List<Object> get props => [animationName, task];
}

class AnimationFirstState extends AnimationState {
  const AnimationFirstState(String task, String animationName)
      : super(task, animationName);
}

class AnimationSecondState extends AnimationState {
  const AnimationSecondState(String task, String animationName)
      : super(task, animationName);
}

class AnimationThirdState extends AnimationState {
  const AnimationThirdState(String task, String animationName)
      : super(task, animationName);
}

class CounterState extends Equatable {
  final double counter;
  const CounterState({required this.counter});

  @override
  List<Object> get props => [counter];
}
