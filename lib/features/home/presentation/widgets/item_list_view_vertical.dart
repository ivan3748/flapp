import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/cubit_everything/cubit/popular_cubit.dart';
import 'package:movie/features/home/presentation/widgets/vertical_showing.dart';

import '../../data/models/get_everything_model.dart';

class ItemListViewVertical extends StatelessWidget {
  const ItemListViewVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PopularError) {
          return Center(
            child: Text("Failed to load data: ${state.errorMessage}"),
          );
        } else if (state is PopularSuccess) {
          final List<GetEverythingModel> results = state.model.results;

          if (results.isEmpty) {
            return const Center(child: Text("No results found"));
          }

          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: results.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return VerticalShowingWidget(results: results[index]);
            },
          );
        } else {
          return const Center(child: Text("No results found"));
        }
      },
    );
  }
}
