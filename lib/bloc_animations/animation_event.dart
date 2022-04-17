part of 'animation_bloc.dart';

abstract class AnimationEvent {}

class AnimationFirst extends AnimationEvent {}

class AnimationSecond extends AnimationEvent {}

class AnimationThird extends AnimationEvent {}

abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
