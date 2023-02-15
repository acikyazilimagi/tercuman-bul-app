// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Translator _$TranslatorFromJson(Map<String, dynamic> json) {
  return _Translator.fromJson(json);
}

/// @nodoc
mixin _$Translator {
  String? get uuid => throw _privateConstructorUsedError;
  Capabilities? get capabilities => throw _privateConstructorUsedError;
  Contact? get contact => throw _privateConstructorUsedError;
  bool get isInterpreter => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint get location => throw _privateConstructorUsedError;
  List<String> get languages => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TranslatorCopyWith<Translator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslatorCopyWith<$Res> {
  factory $TranslatorCopyWith(
          Translator value, $Res Function(Translator) then) =
      _$TranslatorCopyWithImpl<$Res, Translator>;
  @useResult
  $Res call(
      {String? uuid,
      Capabilities? capabilities,
      Contact? contact,
      bool isInterpreter,
      @GeoPointConverter() GeoPoint location,
      List<String> languages,
      String name});

  $CapabilitiesCopyWith<$Res>? get capabilities;
  $ContactCopyWith<$Res>? get contact;
}

/// @nodoc
class _$TranslatorCopyWithImpl<$Res, $Val extends Translator>
    implements $TranslatorCopyWith<$Res> {
  _$TranslatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? capabilities = freezed,
    Object? contact = freezed,
    Object? isInterpreter = null,
    Object? location = null,
    Object? languages = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: freezed == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as Capabilities?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      isInterpreter: null == isInterpreter
          ? _value.isInterpreter
          : isInterpreter // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CapabilitiesCopyWith<$Res>? get capabilities {
    if (_value.capabilities == null) {
      return null;
    }

    return $CapabilitiesCopyWith<$Res>(_value.capabilities!, (value) {
      return _then(_value.copyWith(capabilities: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TranslatorCopyWith<$Res>
    implements $TranslatorCopyWith<$Res> {
  factory _$$_TranslatorCopyWith(
          _$_Translator value, $Res Function(_$_Translator) then) =
      __$$_TranslatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      Capabilities? capabilities,
      Contact? contact,
      bool isInterpreter,
      @GeoPointConverter() GeoPoint location,
      List<String> languages,
      String name});

  @override
  $CapabilitiesCopyWith<$Res>? get capabilities;
  @override
  $ContactCopyWith<$Res>? get contact;
}

/// @nodoc
class __$$_TranslatorCopyWithImpl<$Res>
    extends _$TranslatorCopyWithImpl<$Res, _$_Translator>
    implements _$$_TranslatorCopyWith<$Res> {
  __$$_TranslatorCopyWithImpl(
      _$_Translator _value, $Res Function(_$_Translator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? capabilities = freezed,
    Object? contact = freezed,
    Object? isInterpreter = null,
    Object? location = null,
    Object? languages = null,
    Object? name = null,
  }) {
    return _then(_$_Translator(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      capabilities: freezed == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as Capabilities?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      isInterpreter: null == isInterpreter
          ? _value.isInterpreter
          : isInterpreter // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Translator with DiagnosticableTreeMixin implements _Translator {
  const _$_Translator(
      {this.uuid,
      this.capabilities,
      this.contact,
      required this.isInterpreter,
      @GeoPointConverter() required this.location,
      required final List<String> languages,
      required this.name})
      : _languages = languages;

  factory _$_Translator.fromJson(Map<String, dynamic> json) =>
      _$$_TranslatorFromJson(json);

  @override
  final String? uuid;
  @override
  final Capabilities? capabilities;
  @override
  final Contact? contact;
  @override
  final bool isInterpreter;
  @override
  @GeoPointConverter()
  final GeoPoint location;
  final List<String> _languages;
  @override
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Translator(uuid: $uuid, capabilities: $capabilities, contact: $contact, isInterpreter: $isInterpreter, location: $location, languages: $languages, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Translator'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('capabilities', capabilities))
      ..add(DiagnosticsProperty('contact', contact))
      ..add(DiagnosticsProperty('isInterpreter', isInterpreter))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('languages', languages))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Translator &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.capabilities, capabilities) ||
                other.capabilities == capabilities) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.isInterpreter, isInterpreter) ||
                other.isInterpreter == isInterpreter) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      capabilities,
      contact,
      isInterpreter,
      location,
      const DeepCollectionEquality().hash(_languages),
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TranslatorCopyWith<_$_Translator> get copyWith =>
      __$$_TranslatorCopyWithImpl<_$_Translator>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TranslatorToJson(
      this,
    );
  }
}

abstract class _Translator implements Translator {
  const factory _Translator(
      {final String? uuid,
      final Capabilities? capabilities,
      final Contact? contact,
      required final bool isInterpreter,
      @GeoPointConverter() required final GeoPoint location,
      required final List<String> languages,
      required final String name}) = _$_Translator;

  factory _Translator.fromJson(Map<String, dynamic> json) =
      _$_Translator.fromJson;

  @override
  String? get uuid;
  @override
  Capabilities? get capabilities;
  @override
  Contact? get contact;
  @override
  bool get isInterpreter;
  @override
  @GeoPointConverter()
  GeoPoint get location;
  @override
  List<String> get languages;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TranslatorCopyWith<_$_Translator> get copyWith =>
      throw _privateConstructorUsedError;
}

Capabilities _$CapabilitiesFromJson(Map<String, dynamic> json) {
  return _Capabilities.fromJson(json);
}

/// @nodoc
mixin _$Capabilities {
  bool? get translatorInPerson => throw _privateConstructorUsedError;
  bool? get translatorVirtual => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CapabilitiesCopyWith<Capabilities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CapabilitiesCopyWith<$Res> {
  factory $CapabilitiesCopyWith(
          Capabilities value, $Res Function(Capabilities) then) =
      _$CapabilitiesCopyWithImpl<$Res, Capabilities>;
  @useResult
  $Res call({bool? translatorInPerson, bool? translatorVirtual});
}

/// @nodoc
class _$CapabilitiesCopyWithImpl<$Res, $Val extends Capabilities>
    implements $CapabilitiesCopyWith<$Res> {
  _$CapabilitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translatorInPerson = freezed,
    Object? translatorVirtual = freezed,
  }) {
    return _then(_value.copyWith(
      translatorInPerson: freezed == translatorInPerson
          ? _value.translatorInPerson
          : translatorInPerson // ignore: cast_nullable_to_non_nullable
              as bool?,
      translatorVirtual: freezed == translatorVirtual
          ? _value.translatorVirtual
          : translatorVirtual // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CapabilitiesCopyWith<$Res>
    implements $CapabilitiesCopyWith<$Res> {
  factory _$$_CapabilitiesCopyWith(
          _$_Capabilities value, $Res Function(_$_Capabilities) then) =
      __$$_CapabilitiesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? translatorInPerson, bool? translatorVirtual});
}

/// @nodoc
class __$$_CapabilitiesCopyWithImpl<$Res>
    extends _$CapabilitiesCopyWithImpl<$Res, _$_Capabilities>
    implements _$$_CapabilitiesCopyWith<$Res> {
  __$$_CapabilitiesCopyWithImpl(
      _$_Capabilities _value, $Res Function(_$_Capabilities) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translatorInPerson = freezed,
    Object? translatorVirtual = freezed,
  }) {
    return _then(_$_Capabilities(
      translatorInPerson: freezed == translatorInPerson
          ? _value.translatorInPerson
          : translatorInPerson // ignore: cast_nullable_to_non_nullable
              as bool?,
      translatorVirtual: freezed == translatorVirtual
          ? _value.translatorVirtual
          : translatorVirtual // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Capabilities implements _Capabilities {
  const _$_Capabilities({this.translatorInPerson, this.translatorVirtual});

  factory _$_Capabilities.fromJson(Map<String, dynamic> json) =>
      _$$_CapabilitiesFromJson(json);

  @override
  final bool? translatorInPerson;
  @override
  final bool? translatorVirtual;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Capabilities &&
            (identical(other.translatorInPerson, translatorInPerson) ||
                other.translatorInPerson == translatorInPerson) &&
            (identical(other.translatorVirtual, translatorVirtual) ||
                other.translatorVirtual == translatorVirtual));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, translatorInPerson, translatorVirtual);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CapabilitiesCopyWith<_$_Capabilities> get copyWith =>
      __$$_CapabilitiesCopyWithImpl<_$_Capabilities>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CapabilitiesToJson(
      this,
    );
  }
}

abstract class _Capabilities implements Capabilities {
  const factory _Capabilities(
      {final bool? translatorInPerson,
      final bool? translatorVirtual}) = _$_Capabilities;

  factory _Capabilities.fromJson(Map<String, dynamic> json) =
      _$_Capabilities.fromJson;

  @override
  bool? get translatorInPerson;
  @override
  bool? get translatorVirtual;
  @override
  @JsonKey(ignore: true)
  _$$_CapabilitiesCopyWith<_$_Capabilities> get copyWith =>
      throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  String? get email => throw _privateConstructorUsedError;
  String? get facebook => throw _privateConstructorUsedError;
  String? get instagram => throw _privateConstructorUsedError;
  String? get linkedin => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get twitter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {String? email,
      String? facebook,
      String? instagram,
      String? linkedin,
      String? phone,
      String? twitter});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? facebook = freezed,
    Object? instagram = freezed,
    Object? linkedin = freezed,
    Object? phone = freezed,
    Object? twitter = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedin: freezed == linkedin
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$_ContactCopyWith(
          _$_Contact value, $Res Function(_$_Contact) then) =
      __$$_ContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? facebook,
      String? instagram,
      String? linkedin,
      String? phone,
      String? twitter});
}

/// @nodoc
class __$$_ContactCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$_Contact>
    implements _$$_ContactCopyWith<$Res> {
  __$$_ContactCopyWithImpl(_$_Contact _value, $Res Function(_$_Contact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? facebook = freezed,
    Object? instagram = freezed,
    Object? linkedin = freezed,
    Object? phone = freezed,
    Object? twitter = freezed,
  }) {
    return _then(_$_Contact(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedin: freezed == linkedin
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contact extends _Contact {
  const _$_Contact(
      {this.email,
      this.facebook,
      this.instagram,
      this.linkedin,
      this.phone,
      this.twitter})
      : super._();

  factory _$_Contact.fromJson(Map<String, dynamic> json) =>
      _$$_ContactFromJson(json);

  @override
  final String? email;
  @override
  final String? facebook;
  @override
  final String? instagram;
  @override
  final String? linkedin;
  @override
  final String? phone;
  @override
  final String? twitter;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contact &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.linkedin, linkedin) ||
                other.linkedin == linkedin) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.twitter, twitter) || other.twitter == twitter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, facebook, instagram, linkedin, phone, twitter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      __$$_ContactCopyWithImpl<_$_Contact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactToJson(
      this,
    );
  }
}

abstract class _Contact extends Contact {
  const factory _Contact(
      {final String? email,
      final String? facebook,
      final String? instagram,
      final String? linkedin,
      final String? phone,
      final String? twitter}) = _$_Contact;
  const _Contact._() : super._();

  factory _Contact.fromJson(Map<String, dynamic> json) = _$_Contact.fromJson;

  @override
  String? get email;
  @override
  String? get facebook;
  @override
  String? get instagram;
  @override
  String? get linkedin;
  @override
  String? get phone;
  @override
  String? get twitter;
  @override
  @JsonKey(ignore: true)
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}
