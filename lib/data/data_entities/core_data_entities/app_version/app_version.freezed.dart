// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppVersion _$AppVersionFromJson(Map<String, dynamic> json) {
  return _AppVersion.fromJson(json);
}

/// @nodoc
mixin _$AppVersion {
  String get version => throw _privateConstructorUsedError;
  List<String>? get changes => throw _privateConstructorUsedError;
  AppVersionTypes? get versionType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVersionCopyWith<AppVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionCopyWith<$Res> {
  factory $AppVersionCopyWith(
          AppVersion value, $Res Function(AppVersion) then) =
      _$AppVersionCopyWithImpl<$Res, AppVersion>;
  @useResult
  $Res call(
      {String version, List<String>? changes, AppVersionTypes? versionType});
}

/// @nodoc
class _$AppVersionCopyWithImpl<$Res, $Val extends AppVersion>
    implements $AppVersionCopyWith<$Res> {
  _$AppVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? changes = freezed,
    Object? versionType = freezed,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      changes: freezed == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      versionType: freezed == versionType
          ? _value.versionType
          : versionType // ignore: cast_nullable_to_non_nullable
              as AppVersionTypes?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionImplCopyWith<$Res>
    implements $AppVersionCopyWith<$Res> {
  factory _$$AppVersionImplCopyWith(
          _$AppVersionImpl value, $Res Function(_$AppVersionImpl) then) =
      __$$AppVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version, List<String>? changes, AppVersionTypes? versionType});
}

/// @nodoc
class __$$AppVersionImplCopyWithImpl<$Res>
    extends _$AppVersionCopyWithImpl<$Res, _$AppVersionImpl>
    implements _$$AppVersionImplCopyWith<$Res> {
  __$$AppVersionImplCopyWithImpl(
      _$AppVersionImpl _value, $Res Function(_$AppVersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? changes = freezed,
    Object? versionType = freezed,
  }) {
    return _then(_$AppVersionImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      changes: freezed == changes
          ? _value._changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      versionType: freezed == versionType
          ? _value.versionType
          : versionType // ignore: cast_nullable_to_non_nullable
              as AppVersionTypes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppVersionImpl implements _AppVersion {
  const _$AppVersionImpl(
      {required this.version, final List<String>? changes, this.versionType})
      : _changes = changes;

  factory _$AppVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppVersionImplFromJson(json);

  @override
  final String version;
  final List<String>? _changes;
  @override
  List<String>? get changes {
    final value = _changes;
    if (value == null) return null;
    if (_changes is EqualUnmodifiableListView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AppVersionTypes? versionType;

  @override
  String toString() {
    return 'AppVersion(version: $version, changes: $changes, versionType: $versionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionImpl &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._changes, _changes) &&
            (identical(other.versionType, versionType) ||
                other.versionType == versionType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version,
      const DeepCollectionEquality().hash(_changes), versionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionImplCopyWith<_$AppVersionImpl> get copyWith =>
      __$$AppVersionImplCopyWithImpl<_$AppVersionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppVersionImplToJson(
      this,
    );
  }
}

abstract class _AppVersion implements AppVersion {
  const factory _AppVersion(
      {required final String version,
      final List<String>? changes,
      final AppVersionTypes? versionType}) = _$AppVersionImpl;

  factory _AppVersion.fromJson(Map<String, dynamic> json) =
      _$AppVersionImpl.fromJson;

  @override
  String get version;
  @override
  List<String>? get changes;
  @override
  AppVersionTypes? get versionType;
  @override
  @JsonKey(ignore: true)
  _$$AppVersionImplCopyWith<_$AppVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppVersionsList _$AppVersionsListFromJson(Map<String, dynamic> json) {
  return _AppVersionsList.fromJson(json);
}

/// @nodoc
mixin _$AppVersionsList {
  List<AppVersion> get versionsList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVersionsListCopyWith<AppVersionsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionsListCopyWith<$Res> {
  factory $AppVersionsListCopyWith(
          AppVersionsList value, $Res Function(AppVersionsList) then) =
      _$AppVersionsListCopyWithImpl<$Res, AppVersionsList>;
  @useResult
  $Res call({List<AppVersion> versionsList});
}

/// @nodoc
class _$AppVersionsListCopyWithImpl<$Res, $Val extends AppVersionsList>
    implements $AppVersionsListCopyWith<$Res> {
  _$AppVersionsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionsList = null,
  }) {
    return _then(_value.copyWith(
      versionsList: null == versionsList
          ? _value.versionsList
          : versionsList // ignore: cast_nullable_to_non_nullable
              as List<AppVersion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionsListImplCopyWith<$Res>
    implements $AppVersionsListCopyWith<$Res> {
  factory _$$AppVersionsListImplCopyWith(_$AppVersionsListImpl value,
          $Res Function(_$AppVersionsListImpl) then) =
      __$$AppVersionsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppVersion> versionsList});
}

/// @nodoc
class __$$AppVersionsListImplCopyWithImpl<$Res>
    extends _$AppVersionsListCopyWithImpl<$Res, _$AppVersionsListImpl>
    implements _$$AppVersionsListImplCopyWith<$Res> {
  __$$AppVersionsListImplCopyWithImpl(
      _$AppVersionsListImpl _value, $Res Function(_$AppVersionsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionsList = null,
  }) {
    return _then(_$AppVersionsListImpl(
      versionsList: null == versionsList
          ? _value._versionsList
          : versionsList // ignore: cast_nullable_to_non_nullable
              as List<AppVersion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppVersionsListImpl implements _AppVersionsList {
  _$AppVersionsListImpl(
      {final List<AppVersion> versionsList = const <AppVersion>[]})
      : _versionsList = versionsList;

  factory _$AppVersionsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppVersionsListImplFromJson(json);

  final List<AppVersion> _versionsList;
  @override
  @JsonKey()
  List<AppVersion> get versionsList {
    if (_versionsList is EqualUnmodifiableListView) return _versionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versionsList);
  }

  @override
  String toString() {
    return 'AppVersionsList(versionsList: $versionsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionsListImpl &&
            const DeepCollectionEquality()
                .equals(other._versionsList, _versionsList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_versionsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionsListImplCopyWith<_$AppVersionsListImpl> get copyWith =>
      __$$AppVersionsListImplCopyWithImpl<_$AppVersionsListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppVersionsListImplToJson(
      this,
    );
  }
}

abstract class _AppVersionsList implements AppVersionsList {
  factory _AppVersionsList({final List<AppVersion> versionsList}) =
      _$AppVersionsListImpl;

  factory _AppVersionsList.fromJson(Map<String, dynamic> json) =
      _$AppVersionsListImpl.fromJson;

  @override
  List<AppVersion> get versionsList;
  @override
  @JsonKey(ignore: true)
  _$$AppVersionsListImplCopyWith<_$AppVersionsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
