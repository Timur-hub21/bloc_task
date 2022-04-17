import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagochi_bloc_app/theme_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(style: BorderStyle.solid, color: Colors.black),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Switch button to change theme of App',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
                  return Switch(
                      value: state,
                      onChanged: (value) {
                        BlocProvider.of<ThemeCubit>(context)
                            .toggleTheme(value: value);
                      });
                }),
              ),
            ),
          ],
        ),
    );
  }
}
