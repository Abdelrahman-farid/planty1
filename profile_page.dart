import 'package:flutter/material.dart';
import 'package:plantproject/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Debugging: Print colors
    print("primaryColor: ${Constants.primaryColor}");
    print("blackColor: ${Constants.blackColor}");

    // Use fallback colors if null
    final Color primaryColor = Constants.primaryColor ?? Colors.green;
    final Color blackColor = Constants.blackColor ?? Colors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    // ignore: deprecated_member_use
                    color: primaryColor.withOpacity(.5),  // Fixed null issue
                    width: 5.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * .5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 24,
                      child: Image.asset("assets/images/verified.png"),
                    ),
                  ],
                ),
              ),
              Text(
                'johndoe@gmail.com',
                style: TextStyle(
                  // ignore: deprecated_member_use
                  color: blackColor.withOpacity(.5),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileWidget(icon: Icons.person, title: 'My Profile', primaryColor: primaryColor, blackColor: blackColor),
                  ProfileWidget(icon: Icons.settings, title: 'Settings', primaryColor: primaryColor, blackColor: blackColor),
                  ProfileWidget(icon: Icons.notifications, title: 'Notifications', primaryColor: primaryColor, blackColor: blackColor),
                  ProfileWidget(icon: Icons.chat, title: 'FAQs', primaryColor: primaryColor, blackColor: blackColor),
                  ProfileWidget(icon: Icons.share, title: 'Share', primaryColor: primaryColor, blackColor: blackColor),
                  ProfileWidget(icon: Icons.logout, title: 'Log Out', primaryColor: primaryColor, blackColor: blackColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color primaryColor;
  final Color blackColor;

  const ProfileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.primaryColor,
    required this.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 28),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
              color: blackColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
