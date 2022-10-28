import 'package:flutter/material.dart';
import 'package:my_experiments/animations/animation_menu.dart';
import 'package:my_experiments/clock/widgets/clock.dart';
import 'package:my_experiments/custom_paint/coordinates_basics.dart';

import 'components/menu_card.dart';

class Menu extends StatelessWidget {
  static const route = "/";
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Examples"),
      ),
      body: ListView(
        children: const [
          MenuCard(title: "Clock", subTitle: "A designer clock with full customization.", route: ClockView.route,),
          MenuCard(title: "Coordinates Basics", subTitle: "This is basic examples of shape coordinates drawn with custom paint.", route: CoordinatesBasics.route),
          MenuCard(title: "Animations", subTitle: "Examples of animation in flutter.", route: AnimationMenu.route)
        ],
      ),
    );
  }
}
