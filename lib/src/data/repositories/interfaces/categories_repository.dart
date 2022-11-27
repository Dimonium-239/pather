import 'package:flutter/cupertino.dart';
import 'package:pather/src/models/point.dart';

abstract class CategoriesRepository {
  String getName();
  IconData? getIcon();
  Set<MapPoint> getMapPoints();
}
