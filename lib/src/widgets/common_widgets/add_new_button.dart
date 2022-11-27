import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onPress;
  const AddNewButton(
      {Key? key, required this.buttonName, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50)
      ),
      icon: const Icon(
        Icons.add_circle_outline,
        size: 24.0,
      ),
      label: Text(buttonName),
    );
  }
}
