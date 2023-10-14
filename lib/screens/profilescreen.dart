import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String profilePictureUrl;

  const ProfileScreen({Key? key, required this.profilePictureUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(profilePictureUrl),
        ),
      ),
    );
  }
}