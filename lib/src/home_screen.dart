import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:pather/src/widgets/drawer/haburger_button.dart';
import 'package:pather/src/widgets/drawer/menu_drawer.dart';
import 'package:pather/src/widgets/map/map_screen.dart';
import 'package:pather/src/data/repositories/auth_repository.dart';
import 'package:pather/src/widgets/sign_in/auth_gate.dart';

class HomeScreen extends StatefulWidget {
  final UserRepository userRepository;

  const HomeScreen({super.key, required this.userRepository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    isLoggedIn = widget.userRepository.isUserLogged();
  }

  CircleAvatar getButtonIcon(bool isLoggedIn) {
    if (isLoggedIn) {
      String photoUrl = FirebaseAuth.instance.currentUser?.photoURL ?? "";
      if (photoUrl.isEmpty) {
        return const CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Padding(
            padding: EdgeInsets.all(1.75),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        );
      } else {
        return CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Padding(
            padding: EdgeInsets.all(1.75),
            child: CircleAvatar(backgroundImage: Image.network(photoUrl).image),
          ),
        );
      }
    } else {
      return const CircleAvatar(
        backgroundColor: Colors.indigo,
        child: Padding(
          padding: EdgeInsets.all(1.75),
          child: CircleAvatar(child: Icon(Icons.login)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = widget.userRepository;
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        leading: const HamburgerButton(),
        actions: [
          IconButton(
            icon: getButtonIcon(isLoggedIn),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => userRepository.isUserLogged()
                      ? ProfileScreen(
                          appBar: AppBar(
                            title: Text('${userRepository.userName()} Profile'),
                          ),
                          actions: [
                            SignedOutAction((context) {
                              FirebaseAuth.instance.signOut().then((value) {
                                if (mounted) {
                                  setState(() => isLoggedIn =
                                      userRepository.isUserLogged());
                                }
                              }).then((value) => Navigator.of(context).pop());
                            })
                          ],
                          children: const [
                            Divider(),
                          ],
                        )
                      : AuthGate(
                          userRepository: userRepository,
                        ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: const MapScreen(),
    );
  }
}
