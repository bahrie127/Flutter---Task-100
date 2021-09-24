import 'package:flutter/material.dart';
import 'package:tech387task/Widgets/user_social_buttons.dart';
import 'package:tech387task/screens/login_screen.dart';

import '../Models/user.dart';
import '../Models/user_info.dart';
import '../Widgets/profile_widget.dart';
import '../screens/profile_edit.dart';
import '../provider/auth_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserInfo.myUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfF86B4CF),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
              },
            ),
            const SizedBox(height: 44),
            buildName(user),
            const SizedBox(height: 14),
            const UserSocalButtns(),
            const SizedBox(height: 24),
            buildlocation(user),
            const SizedBox(height: 48),
            buildAbout(user),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: FloatingActionButton(
                onPressed: () {
                  //Log
                  AuthClass().signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false);
                },
                child: const Icon(Icons.exit_to_app),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.black),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildlocation(User location) => MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: const Text('Location')),
          ],
        ),
      );
}
