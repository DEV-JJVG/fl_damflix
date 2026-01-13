import 'dart:convert';

import 'package:fl_damflix/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '878d5bce615869b2a11a24c63e7054cc';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';
  List<Result> onDisplayMovies = [];
  MoviesProvider() {
    print("MoviesProvider inicializado");
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    var response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    // print(nowPlayingResponse.results[0].title);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}
