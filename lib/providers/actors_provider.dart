import 'dart:convert';
import 'package:fl_damflix/models/credits_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_damflix/models/models.dart';

class ActorsProvider extends ChangeNotifier {
  String _apiKey = 'f13f15ad46ff8743695b6f4ab37a82c7';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  List<Cast> onDisplayActors = [];

  // ActorsProvider() {
  //   print('MoviesProvider ha sido inicializado');

  //   this.getOnDisplayMovies();
  //   this.getPopularMovies();
  // }

  getOnDisplayActors(int id) async {
    var url = Uri.https(_baseUrl, '/3/movie/$id/credits', {
      'api_key': _apiKey,
      'language': _languaje,
      //'page': '1',
    });
    var response = await http.get(url);

    //final Map<String, dynamic> decodeData = json.decode( response.body );
    final actorResponse = CreditsResponse.fromJson(response.body);

    //print( nowPlayingResponse.results[0].title);
    onDisplayActors = actorResponse.cast;

    notifyListeners();
  }
}
