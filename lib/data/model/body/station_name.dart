class StationName {
  String? en;
  String? ar;

  StationName({this.en, this.ar});

  StationName.fromJson(Map<String, dynamic> data) {
    en = data['En'];
    ar = data['Ar'];
  }
}
