import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  bool isUserLogged();
  String userName();
}

class FirebaseUserRepository extends UserRepository{
  @override
  bool isUserLogged() {
    FirebaseAuth.instance.userChanges().last.then((value) => print(value));
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  String userName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? "Not logged-in";
  }

}

