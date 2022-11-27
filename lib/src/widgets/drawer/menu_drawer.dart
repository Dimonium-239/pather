import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pather/src/data/repositories/firebase_impl/firebase_categories_repository.dart';
import 'package:pather/src/widgets/folder/subcategory.dart';
import 'package:pather/src/widgets/new_folder/add_new_foder.dart';

import 'package:pather/src/widgets/drawer/menu.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  List<Menu> data = [];

  @override
  void initState() {
    for (var element in dataList) {
      data.add(Menu.fromJson(element));
    }
    super.initState();
  }

  Widget _buildList(Menu list) {
    if (list.subMenu.isEmpty) {
      return Builder(builder: (context) {
        return ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubCategory(list.name))),
            leading: list.icon != null ? Icon(list.icon) : const SizedBox(),
            title: Text(list.name));
      });
    }
    return ExpansionTile(
      leading: list.icon != null ? Icon(list.icon) : const SizedBox(),
      title: Text(
        list.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: list.subMenu.map(_buildList).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(children: [
      SingleChildScrollView(
        child: Column(children: <Widget>[
          const DrawerHeader(
            child: Text('Markers'),
          ),
          ListView.builder(
            padding:
                const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _buildList(data[index]);
            },
          ),
        ]),
      ),
      const Align(
        alignment: Alignment.bottomCenter,
        child: NewFolder(),
      )
    ]));
  }
}
