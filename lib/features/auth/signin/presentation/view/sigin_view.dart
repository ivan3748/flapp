import 'package:flutter/material.dart';

import '../widget/create_email_and_password.dart';

class SiginView extends StatelessWidget {
  const SiginView({super.key});

  @override

  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CreateEmailAndPassword(),
        ),
      ),
    );
  }
}
