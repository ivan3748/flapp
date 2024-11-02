
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/models/get_everything_response_model.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  Future<void> fetchPopular() async {
    emit(PopularLoading());
    try {
      final response = await Dio().get(
          'https://api.themoviedb.org/3/movie/popular?api_key=a674e3861f0ebf3d4563910dbabfbda5');
      final GetEverythingResponseModel model =
          GetEverythingResponseModel.fromJson(response.data);
      emit(PopularSuccess(model: model));
    } catch (e) {
      emit(PopularError(errorMessage: e.toString()));
    }
  }
}
