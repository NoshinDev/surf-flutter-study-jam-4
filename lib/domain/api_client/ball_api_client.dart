import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/domain/entity/magic_ball.dart';

class BallApiClient {
  Future<MagicBall> getPrediction() async {
    try {
      final url = Uri.parse('https://eightballapi.com/api');
      final response = await http.get(url);
      return MagicBall.fromJson(
        json.decode(response.body),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
