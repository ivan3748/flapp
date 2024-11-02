// widgets/movie_details_widget.dart
import 'package:flutter/material.dart';
import 'package:movie/features/home/data/models/get_everything_model.dart';

class MovieDetailsWidget extends StatelessWidget {
  final GetEverythingModel movie;

  const MovieDetailsWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Poster
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.0),

          // Movie Title
          Text(
            movie.title ?? 'Untitled',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),

          // Rating and Vote Count
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 4.0),
              Text(
                '${movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'}/10 IMDb',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(width: 10.0),
              Text(
                '(${movie.voteCount ?? 0} votes)',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),

          // Release Date
          Text(
            'Release Date: ${movie.releaseDate ?? 'Unknown'}',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 16.0),

          // Overview
          Text(
            movie.overview ?? 'No description available.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
