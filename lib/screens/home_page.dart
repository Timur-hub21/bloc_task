import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tamagochi_bloc_app/bloc_animations/animation_bloc.dart';
import 'package:tamagochi_bloc_app/bloc_animations/animation_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return AnimationBloc();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return CounterBloc();
          },
        ),
      ],
      child: const HomePage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ProgressBarListener(),
        const ProgressBar(),
        const AnimationListener(),
        const AnimationView(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: SizedBox(
            height: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.food_bank),
                  color: Theme.of(context).primaryColor,
                  iconSize: 26.0,
                  onPressed: () {
                    BlocProvider.of<AnimationBloc>(context)
                        .add(AnimationFirst());
                    BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                  },
                  tooltip: 'First Animation',
                ),
                IconButton(
                  icon: const Icon(Icons.sunny),
                  color: Theme.of(context).primaryColor,
                  iconSize: 26.0,
                  onPressed: () {
                    BlocProvider.of<AnimationBloc>(context)
                        .add(AnimationSecond());
                    BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                  },
                  tooltip: 'Second Animation',
                ),
                IconButton(
                  icon: const Icon(Icons.food_bank),
                  color: Theme.of(context).primaryColor,
                  iconSize: 26.0,
                  onPressed: () {
                    BlocProvider.of<AnimationBloc>(context)
                        .add(AnimationThird());
                    BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                  },
                  tooltip: 'Third Animation',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimationListener extends StatefulWidget {
  const AnimationListener({Key? key}) : super(key: key);

  @override
  _AnimationListenerState createState() => _AnimationListenerState();
}

class _AnimationListenerState extends State<AnimationListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimationBloc, AnimationState>(
      listener: (context, state) {
        final snackBar = SnackBar(
          content: Text('I am ${state.task}'),
          duration: const Duration(milliseconds: 750),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text(""),
    );
  }
}

class AnimationView extends StatefulWidget {
  const AnimationView({Key? key}) : super(key: key);

  @override
  _AnimationViewState createState() => _AnimationViewState();
}

class _AnimationViewState extends State<AnimationView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationBloc, AnimationState>(
      builder: (context, state) {
        return Center(child: Lottie.asset(state.animationName));
      },
    );
  }
}

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
      return Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(20),
          child: LinearProgressIndicator(
              value: state.counter,
              backgroundColor: Colors.grey,
              color: Colors.purple));
    });
  }
}

class ProgressBarListener extends StatefulWidget {
  const ProgressBarListener({Key? key}) : super(key: key);

  @override
  _ProgressBarListenerState createState() => _ProgressBarListenerState();
}

class _ProgressBarListenerState extends State<ProgressBarListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(listener: (context, state) {
      final snackBar = SnackBar(
        content: Text('YOUR PET IS EATING ${state.counter}'),
        duration: const Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
