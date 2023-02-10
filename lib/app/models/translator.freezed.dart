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
  String? get email => throw _privateConstructorUsedError;
  String? get instagram => throw _privateConstructorUsedError;
  String? get twitter => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  bool get isInterpreter => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  List<String> get languages => throw _privateConstructorUsedError;

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
      {String? email,
      String? instagram,
      String? twitter,
      String? phone,
      bool isInterpreter,
      String location,
      List<String> languages});
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
    Object? email = freezed,
    Object? instagram = freezed,
    Object? twitter = freezed,
    Object? phone = freezed,
    Object? isInterpreter = null,
    Object? location = null,
    Object? languages = null,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isInterpreter: null == isInterpreter
          ? _value.isInterpreter
          : isInterpreter // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
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
      {String? email,
      String? instagram,
      String? twitter,
      String? phone,
      bool isInterpreter,
      String location,
      List<String> languages});
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
    Object? email = freezed,
    Object? instagram = freezed,
    Object? twitter = freezed,
    Object? phone = freezed,
    Object? isInterpreter = null,
    Object? location = null,
    Object? languages = null,
  }) {
    return _then(_$_Translator(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isInterpreter: null == isInterpreter
          ? _value.isInterpreter
          : isInterpreter // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Translator with DiagnosticableTreeMixin implements _Translator {
  const _$_Translator(
      {this.email,
      this.instagram,
      this.twitter,
      this.phone,
      required this.isInterpreter,
      required this.location,
      required final List<String> languages})
      : _languages = languages;

  factory _$_Translator.fromJson(Map<String, dynamic> json) =>
      _$$_TranslatorFromJson(json);

  @override
  final String? email;
  @override
  final String? instagram;
  @override
  final String? twitter;
  @override
  final String? phone;
  @override
  final bool isInterpreter;
  @override
  final String location;
  final List<String> _languages;
  @override
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Translator(email: $email, instagram: $instagram, twitter: $twitter, phone: $phone, isInterpreter: $isInterpreter, location: $location, languages: $languages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Translator'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('instagram', instagram))
      ..add(DiagnosticsProperty('twitter', twitter))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('isInterpreter', isInterpreter))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('languages', languages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Translator &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isInterpreter, isInterpreter) ||
                other.isInterpreter == isInterpreter) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, instagram, twitter, phone,
      isInterpreter, location, const DeepCollectionEquality().hash(_languages));

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
      {final String? email,
      final String? instagram,
      final String? twitter,
      final String? phone,
      required final bool isInterpreter,
      required final String location,
      required final List<String> languages}) = _$_Translator;

  factory _Translator.fromJson(Map<String, dynamic> json) =
      _$_Translator.fromJson;

  @override
  String? get email;
  @override
  String? get instagram;
  @override
  String? get twitter;
  @override
  String? get phone;
  @override
  bool get isInterpreter;
  @override
  String get location;
  @override
  List<String> get languages;
  @override
  @JsonKey(ignore: true)
  _$$_TranslatorCopyWith<_$_Translator> get copyWith =>
      throw _privateConstructorUsedError;
}
