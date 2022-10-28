import 'package:flutter/material.dart';
import 'package:my_experiments/animations/hero_example.dart';
import 'package:my_experiments/animations/switch_animation.dart';
import 'package:my_experiments/components/menu_card.dart';

class AnimationMenu extends StatelessWidget {
  static const route = "/animation-example";
  const AnimationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation Example"),),
      body: ListView(
        children: [


          const MenuCard(title: "Switch Animation", subTitle: "Switch between widgets with animation.", route: SwitchAnimation.route),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HeroExample()));
            },
            child: const Hero(tag: "ex", child: FlutterLogo(size: 50,)),
          ),

        ],
      ),
    );
  }
}
