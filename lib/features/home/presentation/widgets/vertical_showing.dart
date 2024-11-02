import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/custom_text_style.dart';
import '../../data/models/get_everything_model.dart';

class VerticalShowingWidget extends StatelessWidget {
  const VerticalShowingWidget({
    super.key,
    required this.results,
  });
  final GetEverythingModel results;
  @override
  Widget build(BuildContext context) {
    const String baseImageUrl = 'https://image.tmdb.org/t/p/w400';
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Image.network(
            '$baseImageUrl${results.posterPath}',
            height: 150,
            width: 90,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10),
            SizedBox(
              width: 100,
              child: Text(
                results.title ?? '',
                style: CustomTextStyles.subtitle14dark,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/images/star.svg'),
                horizontalSpace(5),
                Text(
                  '${results.voteAverage}/10 IMDb',
                  style: CustomTextStyles.subtitle12gery,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
