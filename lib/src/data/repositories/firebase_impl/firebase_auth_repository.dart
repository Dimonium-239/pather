import 'package:firebase_auth/firebase_auth.dart';
import 'package:pather/src/data/repositories/interfaces/auth_repository.dart';


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

