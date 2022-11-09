
import 'package:flutter/material.dart';
import 'package:my_experiments/animations/animation_menu.dart';
import 'package:my_experiments/animations/switch_animation.dart';
import 'package:my_experiments/clock/widgets/clock.dart';
import 'package:my_experiments/custom_paint/coordinates_basics.dart';
import 'package:my_experiments/menu.dart';
import 'package:my_experiments/rive/rive_animation.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case Menu.route:
        return MaterialPageRoute(builder: (_) => const Menu());

      case CoordinatesBasics.route:
        return MaterialPageRoute(builder: (_) => const CoordinatesBasics());

      case ClockView.route:
        return MaterialPageRoute(builder: (_) => const ClockView());

      case AnimationMenu.route:
        return MaterialPageRoute(builder: (_) => const AnimationMenu());

      case SwitchAnimation.route:
        return MaterialPageRoute(builder: (_) => const SwitchAnimation());

      case RiveAnim.route:
        return MaterialPageRoute(builder: (_) => const RiveAnim());

        default:
          return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("No route found")),));
    }
  }
}