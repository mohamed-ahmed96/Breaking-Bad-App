class Character {
  int? char_id;
  String? name;
  String? birthday;
  List<dynamic>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<dynamic>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? better_call_saul_appearance;

  Character.fromJson(Map<String, dynamic> json) {
    char_id = json["char_id"];

    name=json["name"];
    birthday=json["birthday"];
    occupation=json["occupation"];
    img=json["img"];
    status=json["status"];
    nickname=json["nickname"];
    appearance=json["appearance"];
    portrayed=json["portrayed"];
    category=json["category"];
    better_call_saul_appearance=json["better_call_saul_appearance"];
  }
}
