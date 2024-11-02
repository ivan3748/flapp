import 'package:movie/features/home/data/models/get_everything_model.dart';

class GetEverythingResponseModel {
  final List<GetEverythingModel> results;
  final int page;

  GetEverythingResponseModel({
    required this.results,
    required this.page,
  });

  factory GetEverythingResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<GetEverythingModel> resultsList =
        list.map((i) => GetEverythingModel.fromJson(i)).toList();
    return GetEverythingResponseModel(
      results: resultsList,
      page: json['page'],
    );


  }
}
