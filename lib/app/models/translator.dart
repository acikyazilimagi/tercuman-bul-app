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
    String? phone,
    required bool isInterpreter,
    required String location,
    required List<String> languages,
  }) = _Translator;

  factory Translator.fromJson(Map<String, Object?> json) =>
      _$TranslatorFromJson(json);
}
