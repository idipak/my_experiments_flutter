import 'package:flutter/material.dart';

class SwitchAnimation extends StatefulWidget {
  static const route = "/switch-animation";
  const SwitchAnimation({Key? key}) : super(key: key);

  @override
  State<SwitchAnimation> createState() => _SwitchAnimationState();
}

class _SwitchAnimationState extends State<SwitchAnimation> {

  Widget _child = Container(height: 100, width: 100, color: Colors.green,);
  bool initial = true;

  _switch(){
    if(initial){
      initial = false;
      setState(() {
        _child = _flutterLogo();
      });
    } else{
      initial = true;
      setState(() {
        _child = Container(height: 100, width: 100, color: Colors.blue,);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Row(children: const [],),

          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation){
              return ScaleTransition(scale: animation, child: child,);
            },
            child: _child,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(onPressed: _switch, child: const Text("Switch"),),
          )
        ],
      ),
    );
  }

  Widget _flutterLogo(){
    return const FlutterLogo(size: 100,);
  }
}
