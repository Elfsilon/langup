// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordData _$WordDataFromJson(Map<String, dynamic> json) {
  return _WordData.fromJson(json);
}

/// @nodoc
mixin _$WordData {
  String get word => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordDataCopyWith<WordData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordDataCopyWith<$Res> {
  factory $WordDataCopyWith(WordData value, $Res Function(WordData) then) =
      _$WordDataCopyWithImpl<$Res, WordData>;
  @useResult
  $Res call({String word, String translation});
}

/// @nodoc
class _$WordDataCopyWithImpl<$Res, $Val extends WordData>
    implements $WordDataCopyWith<$Res> {
  _$WordDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? translation = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordDataCopyWith<$Res> implements $WordDataCopyWith<$Res> {
  factory _$$_WordDataCopyWith(
          _$_WordData value, $Res Function(_$_WordData) then) =
      __$$_WordDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, String translation});
}

/// @nodoc
class __$$_WordDataCopyWithImpl<$Res>
    extends _$WordDataCopyWithImpl<$Res, _$_WordData>
    implements _$$_WordDataCopyWith<$Res> {
  __$$_WordDataCopyWithImpl(
      _$_WordData _value, $Res Function(_$_WordData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? translation = null,
  }) {
    return _then(_$_WordData(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordData implements _WordData {
  const _$_WordData({required this.word, required this.translation});

  factory _$_WordData.fromJson(Map<String, dynamic> json) =>
      _$$_WordDataFromJson(json);

  @override
  final String word;
  @override
  final String translation;

  @override
  String toString() {
    return 'WordData(word: $word, translation: $translation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordData &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.translation, translation) ||
                other.translation == translation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, word, translation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordDataCopyWith<_$_WordData> get copyWith =>
      __$$_WordDataCopyWithImpl<_$_WordData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordDataToJson(
      this,
    );
  }
}

abstract class _WordData implements WordData {
  const factory _WordData(
      {required final String word,
      required final String translation}) = _$_WordData;

  factory _WordData.fromJson(Map<String, dynamic> json) = _$_WordData.fromJson;

  @override
  String get word;
  @override
  String get translation;
  @override
  @JsonKey(ignore: true)
  _$$_WordDataCopyWith<_$_WordData> get copyWith =>
      throw _privateConstructorUsedError;
}
