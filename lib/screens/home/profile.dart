import 'package:flutter/material.dart';
import 'package:zym_attendance/controller/authController.dart';

import '../../widgets/bottomBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomTabBar(),
      body: ListView(
        padding: const EdgeInsets.all(25),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
              ),
              SizedBox(height: 20.0),
              Text(
                auth.currentUser!.displayName.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                auth.currentUser!.email.toString(),
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              OutlinedButton(
                onPressed: () {
                  auth.signOut();
                },
                child: Text('Sign Out'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
