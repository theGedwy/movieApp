class Movie {
  final String title;
  final String posterUrl;
  final double? voteAverage; // ده اختياري

  Movie({required this.title, required this.posterUrl, this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      posterUrl: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      voteAverage: json['vote_average']?.toDouble(),
    );
  }
}
