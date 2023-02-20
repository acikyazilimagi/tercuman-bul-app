class TranslatorListItem {
  late String name;
  late double distance;
  late List<String> languages;
  late Map<String, String?> contact;

  TranslatorListItem.fromJson(dynamic data) {
    name = data['name'] ?? '';
    distance = data['distance'] ?? '';
    languages = List.from(data['languages'] ?? []);
    contact = Map.from(data['contact'] ?? {});
  }

  toJson()  => {
    "name": name,
    "email": distance,
    "languages": languages,
    "contact": contact
  };
}