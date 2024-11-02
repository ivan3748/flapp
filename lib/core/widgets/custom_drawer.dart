import 'package:flutter/material.dart';
import 'package:movie/core/utils/my_colors.dart';
import '../utils/custom_text_style.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.bg.withOpacity(0.8),
              MyColors.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-photo/round-circle-with-mans-head-circle-with-circle-middle_807814-680.jpg'),
                ),
                const SizedBox(height: 10),
                Text(
                  "Mostafa & Salah",
                  style: CustomTextStyles.font18secondary
                      .copyWith(color: Colors.black),
                ),
                Text(
                  "mo@test.com",
                  style: CustomTextStyles.subtitle14dark
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 20),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text("Home", style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title:
                  const Text("Settings", style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.black),
              title: const Text("About", style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.black),
              title:
                  const Text("Logout", style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
