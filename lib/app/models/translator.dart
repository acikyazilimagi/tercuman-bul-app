import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/app/models/geo_point_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'translator.freezed.dart';
part 'translator.g.dart';

@freezed
class Translator with _$Translator {
  const factory Translator({
    String? email,
    String? instagram,
    String? twitter,
    String? linkedin,
    String? facebook,
    String? messenger,
    String? phone,
    required bool isInterpreter,
    @GeoPointConverter() required GeoPoint location,
    required List<String> languages,
    required String name,
  }) = _Translator;

  factory Translator.fromJson(Map<String, Object?> json) =>
      _$TranslatorFromJson(json);
}
