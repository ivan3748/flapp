import 'package:flutter/material.dart';

import '../../../../core/utils/custom_text_style.dart';

class SeeMoreWidget extends StatelessWidget {
  const SeeMoreWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomTextStyles.text20Black,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            backgroundColor: Colors.grey.withOpacity(.25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Creates the egg shape
            ),
          ),
          onPressed: () {},
          child: Text(
            'See More',
            style: CustomTextStyles.text16Black.copyWith(
              color: Colors.black, // Text color
              fontSize: 12, // Smaller font size
            ),
          ),
        ),
      ],
    );
  }
}
