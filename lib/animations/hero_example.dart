import 'package:flutter/material.dart';
import 'package:my_experiments/animations/cross_fade_animation.dart';
import 'package:my_experiments/animations/list_animation.dart';

class HeroExample extends StatefulWidget {
  const HeroExample({Key? key}) : super(key: key);

  @override
  State<HeroExample> createState() => _HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> {
  bool _isFirst = true;
  bool _logoTaped = false;

  _tapLogo(){
    setState(() {
      _logoTaped = !_logoTaped;
    });
  }

  _change(){
    setState(() {
      _isFirst = !_isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ListAnimation()));
          }, child: const Text("Next", style: TextStyle(color: Colors.red),)),

          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CrossFadeAnimation()));
          }, child: const Text("CrossFade", style: TextStyle(color: Colors.black),))
        ],
      ),
      body: Column(
        children: [
          Row(children: const [],),

          AnimatedAlign(
              alignment: _isFirst ? Alignment.topLeft : Alignment.topRight,
              duration: const Duration(seconds: 1),
            child: const FlutterLogo(size: 50,),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: _tapLogo,
              child: AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 500),
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: !_logoTaped ? 0.0 : 6.0,
                shape: BoxShape.rectangle,
                child: const Hero(
                  tag: "ex",
                  child: FlutterLogo(size: 200,),
                ),
              ),
            ),
          ),

          AnimatedDefaultTextStyle(
            curve: Curves.easeOutQuint,
              style: _isFirst ? const TextStyle(fontSize: 16, color: Colors.blue) : const TextStyle(fontSize: 32, color: Colors.cyan),
              duration: const Duration(milliseconds: 1000),
            onEnd: (){
              _isFirst = true;
              setState(() {

              });
            },
            child: const Text("Animated Text"),
          ),

          MaterialButton(onPressed: _change, child: const Text("Change"),)
        ],
      ),
    );
  }
}
