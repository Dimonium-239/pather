import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:pather/src/data/repositories/interfaces/categories_repository.dart';
import 'package:pather/src/models/point.dart';
import 'package:firebase_database/firebase_database.dart';


class FirebaseCategoriesRepository extends CategoriesRepository {
  FirebaseDatabase ref = FirebaseDatabase.instance;

  Future<Object?> _getCategories() async {

  }

  @override
  IconData? getIcon() {
    // TODO: implement getIcon
    throw UnimplementedError();
  }

  @override
  Set<MapPoint> getMapPoints() {
    // TODO: implement getMapPoints
    throw UnimplementedError();
  }

  @override
  String getName() {
    return _getCategories().toString();
  }

}