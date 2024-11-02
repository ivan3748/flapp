import 'package:dartz/dartz.dart';
import 'package:movie/core/api_services/api/api_consumer.dart';
import 'package:movie/features/home/data/models/get_everything_response_model.dart';

class GetEverythingRepo {
  final ApiConsumer api;

  GetEverythingRepo({required this.api});

  Future<Either<String, GetEverythingResponseModel>> getEverythingRepo() async {
    try {
      final response = await api.get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=a674e3861f0ebf3d4563910dbabfbda5');
      final GetEverythingResponseModel model =
          GetEverythingResponseModel.fromJson(response.data);

      return Right(model);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
