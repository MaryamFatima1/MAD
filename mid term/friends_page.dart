import 'package:flutter/material.dart';
import 'friend_detail_page.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: ListView(
        children: [
          FriendCard(
            name: 'Aftab Ahmad',
            email: 'aftab@gmail.com',
            profileImage:
                'assets/aftab_profile.png', // Add the path to the profile image
          ),
          FriendCard(
            name: 'John Doe',
            email: 'johndoe@gmail.com',
            profileImage:
                'assets/john_doe_profile.png', // Add the path to the profile image
          ),
          // Add more FriendCard widgets for other friends
        ],
      ),
    );
  }
}

class FriendCard extends StatelessWidget {
  final String name;
  final String email;
  final String profileImage;

  FriendCard({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FriendDetailPage(
                  name: name,
                  followers: 100,
                  following: 22,
                  profileImage: profileImage)),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(profileImage),
              ),
            ),
          ),
          title: Text(name),
          subtitle: Text(email),
        ),
      ),
    );
  }
}
