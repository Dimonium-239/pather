import 'package:flutter/material.dart';

class HamburgerButton extends StatelessWidget {
  const HamburgerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu_rounded),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    });
  }
}
