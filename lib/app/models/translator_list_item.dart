class TranslatorListItem {
  late String name;
  late double distance;
  late List<String> languages;

  TranslatorListItem.fromJson(dynamic data) {
    name = data['name'] ?? '';
    distance = data['distance'] ?? '';
    languages = List.from(data['languages'] ?? []);
  }

  toJson()  => {
    "name": name,
    "email": distance,
    "languages": languages,
  };
}