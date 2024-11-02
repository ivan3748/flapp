import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/widgets/items_showing_list.dart';
import '../../data/models/get_everything_model.dart';

import '../cubit_everything/cubit/get_everything_cubit.dart';

class ShowingListViewWidget extends StatelessWidget {
  const ShowingListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEverythingCubit, GetEverythingState>(
      builder: (context, state) {
        print("Current state: $state");

        if (state is GetEverythingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetEverythingError) {
          return Center(
            child: Text("Failed to load data: ${state.errorMessage}"),
          );
        } else if (state is GetEverythingSuccess) {
          final List<GetEverythingModel> results =
              state.model.results; 

          if (results.isEmpty) {
            return const Center(child: Text("No results found"));
          }

          return SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: results.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemSowhingList(results: results[index]);
              },
            ),
          );
        } else {
          return const Center(child: Text("No results found"));
        }
      },
    );
  }
}
