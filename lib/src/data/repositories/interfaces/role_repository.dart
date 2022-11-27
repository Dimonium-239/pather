import 'package:firebase_auth/firebase_auth.dart';

abstract class RoleRepository {
  String getRoleName();
  Set<User> getUser();
}