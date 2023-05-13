import 'dart:convert';
import 'dart:developer';

import 'package:game_info/app/constant/appString.dart';
import 'package:game_info/app/models/GenreModel.dart';
import 'package:game_info/app/models/gameModel.dart';
import 'package:game_info/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GameApi {
  static Future<List<ResultGame>?> all(String search , int page) async {
    String url = "${AppString.HOST}/games?page=$page&page_size=50&key=${AppString.API_KEY}&search=$search";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    print(data['results']);
    if (response.statusCode == 200) {
      // nexUrl.value = data["next"];
      final dm = GameModel.fromJson(data);
      log(url);
      inspect(dm);
      return GameModel.fromJson(data).results;
    } else {
      print(data);
      return GameModel.fromJson(data).results;
    }
  }

  // get all genre
  static Future<List<ResultGenre>?> allGenre() async {
    String url = "${AppString.HOST}/genre?key=${AppString.API_KEY}";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // nexUrl.value = data["next"];
      final dm = GenreModel.fromJson(data);
      return GenreModel.fromJson(data).results;
    }
    return GenreModel.fromJson(data).results;
  }
}
