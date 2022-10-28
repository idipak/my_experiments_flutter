import 'package:flutter/material.dart';



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
