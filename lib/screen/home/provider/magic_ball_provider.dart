import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/api_client/ball_api_client.dart';
import 'package:surf_practice_magic_ball/domain/entity/magic_ball.dart';

class MagicBallProvider extends ChangeNotifier{
  MagicBall? _magicBall;
  Object? _error;
  bool? _isPressed;

  MagicBall? get magicBall => _magicBall;
  Object? get error => _error;
  bool? get isPressed =>_isPressed;

  final _ballApiClient = BallApiClient();

  getPredictionResponse() async{
    _isPressed=true;
    notifyListeners();
    if(_magicBall!=null){
      _magicBall=null;
      notifyListeners();
    }
    if(_error!=null){
      _error=null;
      notifyListeners();
    }
    try{
      
      _magicBall=await _ballApiClient.getPrediction();
      _isPressed=false;
      notifyListeners();
    }catch (e){
      _error=e;
      _isPressed=false;
      notifyListeners();
    }
  }
}