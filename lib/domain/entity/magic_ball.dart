
class MagicBall {
  String? reading;

  MagicBall({this.reading});

  MagicBall.fromJson(Map<String, dynamic> json) {
    if(json["reading"] is String) {
      reading = json["reading"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["reading"] = reading;
    return _data;
  }
}