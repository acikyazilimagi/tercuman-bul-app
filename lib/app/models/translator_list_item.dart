class TranslatorListItem {
  late String name;
  late String distance;
  late List<String> languages;

  TranslatorListItem.fromJson(dynamic data) {
    name = data['name'];
    distance = data['email'];
    languages = List.from(data['languages']);
  }

  toJson()  => {
    "name": name,
    "email": distance,
    "languages": languages
  };
}