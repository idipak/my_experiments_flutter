import 'package:flutter/material.dart';
import 'package:my_experiments/animations/cross_fade_animation.dart';
import 'package:my_experiments/animations/list_animation.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({Key? key}) : super(key: key);

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
          }, child: const Text("CrossFade"))
        ],
      ),
      body: Column(
        children: [
          Row(children: [],),

          const Hero(
            tag: "ex",
            child: FlutterLogo(size: 200,),
          ),

          AnimatedDefaultTextStyle(
              child: const Text("Animated Text"),
              style: const TextStyle(fontSize: 32, color: Colors.cyan),
              duration: Duration(milliseconds: 500)),

          MaterialButton(onPressed: (){

          }, child: const Text("Change"),)
        ],
      ),
    );
  }
}
