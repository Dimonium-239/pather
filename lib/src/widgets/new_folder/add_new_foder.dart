import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pather/src/widgets/common_widgets/add_new_button.dart';

class NewFolder extends StatefulWidget {
  const NewFolder({Key? key}) : super(key: key);

  @override
  State<NewFolder> createState() => _NewFolderState();
}

class _NewFolderState extends State<NewFolder> {
  @override
  Widget build(BuildContext context) {
    return AddNewButton(buttonName: 'Add new folder', onPress: () {});
  }
}
