import 'package:aco/src/reusable/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../reusable/objects/user.dart';

class UserPage extends StatefulWidget {
  late User user;
  UserPage({super.key, required this.user});

  @override
  // ignore: no_logic_in_create_state
  State<UserPage> createState() => _UserPageState(user);
}

class _UserPageState extends State<UserPage> {
  late User user;
  _UserPageState(this.user);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('Welcome User ${user.getName()}')
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar().buil(context, page: 4, user: user)

    );
  }
}