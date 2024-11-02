// home/presentation/views/show_movie_details.dart
import 'package:flutter/material.dart';
import '../../data/models/get_everything_model.dart';
import 'movie_details_widget.dart';
class ShowMovieDetails extends StatelessWidget {
  final GetEverythingModel movie;

  const ShowMovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? 'Movie Details'),
      ),
      body: SingleChildScrollView(
        child: MovieDetailsWidget(movie: movie),
      ),
    );
  }
}
