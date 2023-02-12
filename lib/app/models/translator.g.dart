// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Translator _$$_TranslatorFromJson(Map<String, dynamic> json) =>
    _$_Translator(
      uuid: json['uuid'] as String?,
      capabilities: json['capabilities'] == null
          ? null
          : Capabilities.fromJson(json['capabilities'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      isInterpreter: json['isInterpreter'] as bool,
      location:
          const GeoPointConverter().fromJson(json['location'] as GeoPoint),
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_TranslatorToJson(_$_Translator instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'capabilities': instance.capabilities?.toJson(),
      'contact': instance.contact?.toJson(),
      'isInterpreter': instance.isInterpreter,
      'location': const GeoPointConverter().toJson(instance.location),
      'languages': instance.languages,
      'name': instance.name,
    };

_$_Capabilities _$$_CapabilitiesFromJson(Map<String, dynamic> json) =>
    _$_Capabilities(
      translatorInPerson: json['translatorInPerson'] as bool?,
      translatorVirtual: json['translatorVirtual'] as bool?,
    );

Map<String, dynamic> _$$_CapabilitiesToJson(_$_Capabilities instance) =>
    <String, dynamic>{
      'translatorInPerson': instance.translatorInPerson,
      'translatorVirtual': instance.translatorVirtual,
    };

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      email: json['email'] as String?,
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      linkedin: json['linkedin'] as String?,
      phone: json['phone'] as String?,
      twitter: json['twitter'] as String?,
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'email': instance.email,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'linkedin': instance.linkedin,
      'phone': instance.phone,
      'twitter': instance.twitter,
    };
