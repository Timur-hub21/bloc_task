import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagochi_bloc_app/bloc_animations/animation_state.dart';
part 'animation_event.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
  AnimationBloc()
      : super(const AnimationFirstState(
            'animations/7249-wizard-animation-character.json',
            '102267-location-loader.json')) {
    on<AnimationFirst>((event, emit) {
      emit(const AnimationFirstState(
          'animations/7249-wizard-animation-character.json',
          '102267-location-loader.json'));
    });
    on<AnimationSecond>((event, emit) {
      emit(const AnimationSecondState(
          'animations/7250-wizard-animation-character.json',
          '7250-wizard-animation-character.json'));
    });
    on<AnimationThird>((event, emit) {
      emit(const AnimationThirdState(
          'animations/7251-wizard-animation-character.json',
          '7251-wizard-animation-character.json'));
    });
  }
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<IncrementEvent>((event, emit) async {
      emit(CounterState(counter: state.counter + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
