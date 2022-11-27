import 'package:flutter/material.dart';

List dataList = [
  {
    "name": "My places",
    "icon": Icons.my_library_books_outlined,
    "subMenu": [
      {"name": "Choose restaurant for weekend",
        "subMenu": [
          {"icon": Icons.place_outlined, "name": "point1"},
          {"icon": Icons.place_outlined,"name": "point2"}
        ]
      },
      {"name": "Planes for monday",
        "subMenu": [
          {"icon": Icons.place_outlined, "name": "point1"},
          {"icon": Icons.place_outlined,"name": "point2"}
        ]
      },
    ]
  },

  {
    "name": "Real estate",
    "icon": Icons.house_outlined,
    "subMenu": [
      {"name": "Check houses localizations",
        "subMenu": [
          {"icon": Icons.place_outlined, "name": "point1"},
          {"icon": Icons.place_outlined,"name": "point2"}
        ]
      },
    ]
  },
];

class Menu {
  late String name;
  late IconData? icon;
  List<Menu> subMenu = [];

  Menu({required this.name, required this.subMenu, required this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu.clear();
      json['subMenu'].forEach((v) {
        subMenu.add(Menu.fromJson(v));
      });
    }
  }
}