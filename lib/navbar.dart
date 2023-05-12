import 'package:expense_tracker/passchange.dart';
import 'package:expense_tracker/statistics.dart';

import './authRepository.dart';
import 'package:expense_tracker/homepage.dart';
import 'package:expense_tracker/login.dart';
import 'package:flutter/material.dart';

final AuthRepository _auth = AuthRepository();

class navbar extends StatelessWidget {
  const navbar({Key? key}) : super(key: key);

  signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.black,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage())),
            ),
            ListTile(
              leading: const Icon(Icons.auto_graph_outlined),
              title: const Text('Statistics'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Statistics())),
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Change Password'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePass()))),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
              onTap: () {
                signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignInPage()));
              },
            ),
          ],
        ),
      );
}
