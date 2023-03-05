class TranslatorListItem {
  late String uid;
  late String name;
  late double distance;
  late List<String> languages;

  TranslatorListItem.fromJson(dynamic data) {
    uid = data['uid'] ?? '';
    name = data['name'] ?? '';
    distance = data['distance'] ?? '';
    languages = List.from(data['languages'] ?? []);
  }

  toJson()  => {
    "uid": uid,
    "name": name,
    "email": distance,
    "languages": languages,
  };
}