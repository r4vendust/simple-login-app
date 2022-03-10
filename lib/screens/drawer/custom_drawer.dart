import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_login_app/services/flutterfire.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerHeader(),
          CustomListTile(
            icon: Icons.home_outlined,
            text: 'Home',
            onTap: () => Navigator.pop(context),
          ),
          CustomListTile(
            icon: Icons.arrow_circle_down,
            text: 'Log out',
            onTap: () async {
              await context.read<AuthenticationService>().signOut();
            },
          ),
        ],
      ),
    );
  }
}

class CustomDrawerHeader extends StatelessWidget {
  CustomDrawerHeader({Key? key}) : super(key: key);

  final String? _email = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('lib/assets/default_profile_pic.jpg'),
              ),
            ),
          ),
          const Text(
            'Username Surname',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text('$_email'),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const CustomListTile(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 15.0),
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
