import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie/features/home/presentation/cubit_everything/cubit/get_everything_cubit.dart';
import 'package:movie/features/home/presentation/cubit_everything/cubit/popular_cubit.dart';
import 'package:movie/features/home/presentation/widgets/custom_see_more_widget.dart';
import 'package:movie/features/home/presentation/widgets/item_list_view_vertical.dart';
import 'package:movie/features/home/presentation/widgets/list_view_bulder.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/custom_text_style.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/widgets/custom_drawer.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FilmKu',
          style: CustomTextStyles.font28SemiBoldWith,
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetEverythingCubit()..fetchEverything(),
          ),
          BlocProvider(
            create: (context) => PopularCubit()..fetchPopular(),
          ),
        ],
        child: Container(
          padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              stops: const [0.6, 0.5],
              colors: [
                MyColors.primary,
                MyColors.bg.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10),
              const SeeMoreWidget(
                title: 'Now Showing',
              ),
              verticalSpace(6),
              const ShowingListViewWidget(),
              verticalSpace(6),
              const SeeMoreWidget(
                title: 'Popular',
              ),
              const Expanded(
                child: ItemListViewVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
