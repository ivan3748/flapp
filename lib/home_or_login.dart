import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie/core/utils/my_colors.dart';

import 'features/auth/login/presentation/views/login_view.dart';
import 'features/home/presentation/views/home_view.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return const LoginView();
            } else {
              return const HomeView();
            }
          }

          return Center(
            child: LoadingAnimationWidget.newtonCradle(
                color: MyColors.secondary, size: 70),
          );
        });
  }
}
