// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Translator _$$_TranslatorFromJson(Map<String, dynamic> json) =>
    _$_Translator(
      email: json['email'] as String?,
      instagram: json['instagram'] as String?,
      twitter: json['twitter'] as String?,
      phone: json['phone'] as String?,
      isInterpreter: json['isInterpreter'] as bool,
      location: json['location'] as String,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_TranslatorToJson(_$_Translator instance) =>
    <String, dynamic>{
      'email': instance.email,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'phone': instance.phone,
      'isInterpreter': instance.isInterpreter,
      'location': instance.location,
      'languages': instance.languages,
    };
