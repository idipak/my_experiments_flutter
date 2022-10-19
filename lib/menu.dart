import 'package:flutter/material.dart';
import 'package:my_experiments/clock/widgets/clock.dart';
import 'package:my_experiments/custom_paint/coordinates_basics.dart';

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
          MenuCard(title: "Coordinates Basics", subTitle: "This is basic examples of shape coordinates drawn with custom paint.", route: CoordinatesBasics.route)
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String route;

  const MenuCard({
    Key? key,
    required this.title,
    this.subTitle = "This is a example app.",
    required this.route
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: (){
        Navigator.pushNamed(context, route);
      },
    );
  }
}
