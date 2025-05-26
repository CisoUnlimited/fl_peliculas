import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'e6e555ece9275afce990182db5367f89';
  final String _language = 'es-ES';

  List<Result> onDisplayMovies = [];
  List<Result> favoriteMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getFavoriteMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    var response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getFavoriteMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    var response = await http.get(url);

    final favoritesResponse = NowPlayingResponse.fromJson(response.body);

    favoriteMovies = [...favoriteMovies, ...favoritesResponse.results];
    notifyListeners();
  }
}
