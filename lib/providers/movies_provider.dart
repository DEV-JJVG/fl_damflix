import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_damflix/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'f13f15ad46ff8743695b6f4ab37a82c7';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  List<Result> onDisplayMovies = [];
  List<ResultPopular> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider ha sido inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _languaje,
      'page': '1',
    });
    var response = await http.get(url);

    //final Map<String, dynamic> decodeData = json.decode( response.body );
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    //print( nowPlayingResponse.results[0].title);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/popular', {
      'api_key': _apiKey,
      'language': _languaje,
      'page': '1',
    });
    var response = await http.get(url);

    //final Map<String, dynamic> decodeData = json.decode( response.body );
    final popularResponse = PopularResponse.fromJson(response.body);

    //print( nowPlayingResponse.results[0].title);
    popularMovies = popularResponse.results;

    notifyListeners();
  }
}
