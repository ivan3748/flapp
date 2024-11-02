import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/features/home/data/models/get_everything_model.dart';

import '../../../../core/utils/custom_text_style.dart';

class ItemSowhingList extends StatelessWidget {
  const ItemSowhingList({
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                    '$baseImageUrl${results.posterPath}'
                    'https://b3751545.smushcdn.com/3751545/wp-content/uploads/2024/09/Venom-The-Last-Dance-2024.webp?lossy=1&strip=1&webp=1',
                    height: 215,
                    width: 143),
              ),
              SizedBox(
                width: 100.h,
                child: Text(
                  results.title ?? "",
                  maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.subtitle14dark,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/images/star.svg'),
                  Text(
                    '${results.voteAverage}/10 IMDb',
                    style: CustomTextStyles.subtitle12gery,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
