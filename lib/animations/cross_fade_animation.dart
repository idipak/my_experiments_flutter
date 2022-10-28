import 'package:flutter/material.dart';

class CrossFadeAnimation extends StatefulWidget {
  const CrossFadeAnimation({Key? key}) : super(key: key);

  @override
  State<CrossFadeAnimation> createState() => _CrossFadeAnimationState();
}

class _CrossFadeAnimationState extends State<CrossFadeAnimation> {

  bool _first = true;

  change(){
    setState(() {
      _first = !_first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: change,
          child: AnimatedCrossFade(
            duration: const Duration(seconds: 2),
            firstChild: const FlutterLogo(size: 100, style: FlutterLogoStyle.horizontal,),
            secondChild: const FlutterLogo(size: 100, style: FlutterLogoStyle.stacked,),
            crossFadeState: _first ? CrossFadeState.showFirst: CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}
