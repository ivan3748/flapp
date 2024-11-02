import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/get_everything_response_model.dart';

part 'get_everything_state.dart';

class GetEverythingCubit extends Cubit<GetEverythingState> {
  GetEverythingCubit() : super(GetEverythingInitial());

  // final GetEverythingRepo getEverythingRepo;

  Future<void> fetchEverything() async {
    emit(GetEverythingLoading());
    try {
      final response = await Dio().get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=a674e3861f0ebf3d4563910dbabfbda5');
      final GetEverythingResponseModel model =
          GetEverythingResponseModel.fromJson(response.data);
      emit(GetEverythingSuccess(model: model));
    } catch (e) {
      emit(GetEverythingError(errorMessage: e.toString()));
    }
  }

  
}
