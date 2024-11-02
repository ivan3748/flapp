import 'dart:convert';
import 'dart:developer';

import 'package:movie/core/utils/utils.dart';

import '../../features/home/data/models/up_coming_movie_model.dart';

import 'package:http/http.dart' as http;

var key = "?api_key=$apiKey";

late String endPoint;

class ApiServices {
  Future<List<UpcomingMovieModel>> getUpComingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl/$endPoint$key";

    final response = await http.get(Uri.parse(url));

    log('Status : ${response.body}');
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<UpcomingMovieModel> movies =
          data.map((movie) => UpcomingMovieModel.fromJson(movie)).toList();

      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
