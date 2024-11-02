import 'package:flutter/material.dart';

import '../widgets/login_email_and_password_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: EmailAndPassword(),
        ),
      ),
    );
  }
}
