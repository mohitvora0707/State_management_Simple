import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  bool ischake = false;
  void GenderSwitchCallBake(bool value) {
    print(value);
    ischake = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(ischake);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: GenderSwitch(
            genderSwitchCallBack: GenderSwitchCallBake,
            ischake: ischake,
          ))
        ],
      ),
    );
  }
}

class GenderSwitch extends StatefulWidget {
  GenderSwitch(
      {Key? key, required this.ischake, required this.genderSwitchCallBack})
      : super(key: key);
  bool ischake;
  void Function(bool) genderSwitchCallBack;

  @override
  State<GenderSwitch> createState() => _GenderSwitchState();
}

class _GenderSwitchState extends State<GenderSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.ischake,
      onChanged: (value) {
        setState(() {
          widget.ischake = value;
          widget.genderSwitchCallBack(value);
        });
      },
    );
  }
}
