import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/app/models/geo_point_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'translator.freezed.dart';
part 'translator.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Translator with _$Translator {
  @JsonSerializable(explicitToJson: true)
  const factory Translator({
    String? uuid,
    Capabilities? capabilities,
    Contact? contact,
    required bool isInterpreter,
    @GeoPointConverter() required GeoPoint location,
    required List<String> languages,
    required String name,
  }) = _Translator;

  factory Translator.fromJson(Map<String, Object?> json) =>
      _$TranslatorFromJson(json);

  factory Translator.empty(
          {String? uuid,
          Capabilities? capabilities,
          Contact? contact,
          bool? isInterpreter,
          GeoPoint? location,
          List<String>? languages,
          String? name}) =>
      Translator(
          uuid: uuid,
          capabilities: capabilities ?? Capabilities(),
          contact: contact ?? Contact(),
          isInterpreter: isInterpreter ?? false,
          location: location ?? GeoPoint(0, 0),
          languages: languages ?? const [],
          name: name ?? "-");
}

@freezed
class Capabilities with _$Capabilities {
  const factory Capabilities({
    bool? translatorInPerson,
    bool? translatorVirtual,
  }) = _Capabilities;

  factory Capabilities.fromJson(Map<String, Object?> json) =>
      _$CapabilitiesFromJson(json);

  @override
  String toString() {
    return "translatorInPerson: $translatorInPerson" +
        " translatorVirtual: $translatorVirtual";
  }
}

@freezed
class Contact with _$Contact {
  const factory Contact({
    String? email,
    String? facebook,
    String? instagram,
    String? linkedin,
    String? phone,
    String? twitter,
  }) = _Contact;
  const Contact._();

  factory Contact.fromJson(Map<String, Object?> json) =>
      _$ContactFromJson(json);

  @override
  String toString() {
    return "email: $email" +
        " facebook: $facebook" +
        " instagram: $instagram" +
        " linkedin: $linkedin" +
        " phone: $phone" +
        " twitter: $twitter ";
  }

  bool get haveAnyContactInformation =>
      (facebook?.isNotEmpty == true) ||
      (twitter?.isNotEmpty == true) ||
      (instagram?.isNotEmpty == true) ||
      (linkedin?.isNotEmpty == true);
}
