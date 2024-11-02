import 'package:flutter/material.dart';

import '../../../../../core/utils/custom_text_style.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        'Forget you password ?',
        style: CustomTextStyles.font14Blue,
      ),
    );
  }
}
