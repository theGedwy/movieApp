import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/movie_model.dart';

Future<List<Movie>> fetchPopularMovies() async {
  final url = Uri.parse(
    'https://api.themoviedb.org/3/movie/popular?api_key=492c455dd5c9f0b9f8e10f74fd261015&language=en-US&page=1',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List results = data['results'];

    return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
  } else {
    throw Exception('Failed to load popular movies');
  }
}

Future<List<Movie>> fetchTopRated() async {
  final url = Uri.parse(
    'https://api.themoviedb.org/3/movie/top_rated?api_key=492c455dd5c9f0b9f8e10f74fd261015&language=en-US&page=1',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List results = data['results'];

    return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
  } else {
    throw Exception('Failed to load popular movies');
  }
}
