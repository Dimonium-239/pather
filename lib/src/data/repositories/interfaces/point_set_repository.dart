import 'package:pather/src/models/point.dart';

abstract class PointSetRepository {
  String getPointSetId();
  Set<MapPoint> getPoints();
  String getInfo();
}