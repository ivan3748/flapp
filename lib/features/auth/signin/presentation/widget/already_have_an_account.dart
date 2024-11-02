import 'package:flutter/material.dart';
import 'package:movie/core/utils/custom_text_style.dart';

import '../../../../../core/routing/routes.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ?',
          style: CustomTextStyles.font14Dark,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.login);
          },
          child: Text(
            "Login Now",
            style: CustomTextStyles.font14Blue,
          ),
        )
      ],
    );
  }
}
