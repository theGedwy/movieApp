import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/resources/app_colors.dart';

class HorizontalMovieSection extends StatelessWidget {
  final String title;
  final Future<List<Movie>> futureMovies;

  const HorizontalMovieSection({
    required this.title,
    required this.futureMovies,
    super.key,
    required this.needRate,
  });

  final bool needRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: FutureBuilder<List<Movie>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error loading $title'));
              }

              final movies = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    width: 140,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              movie.posterUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        if (needRate &&
                            movie.voteAverage != null) // 👈 دي الإضافة
                          Text(
                            '⭐ ${movie.voteAverage!.toStringAsFixed(1)}',
                            style: TextStyle(color: Colors.orange),
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
