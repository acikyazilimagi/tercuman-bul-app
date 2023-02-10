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
      linkedin: json['linkedin'] as String?,
      facebook: json['facebook'] as String?,
      messenger: json['messenger'] as String?,
      phone: json['phone'] as String?,
      isInterpreter: json['isInterpreter'] as bool,
      location:
          const GeoPointConverter().fromJson(json['location'] as GeoPoint),
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_TranslatorToJson(_$_Translator instance) =>
    <String, dynamic>{
      'email': instance.email,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
      'facebook': instance.facebook,
      'messenger': instance.messenger,
      'phone': instance.phone,
      'isInterpreter': instance.isInterpreter,
      'location': const GeoPointConverter().toJson(instance.location),
      'languages': instance.languages,
      'name': instance.name,
    };
