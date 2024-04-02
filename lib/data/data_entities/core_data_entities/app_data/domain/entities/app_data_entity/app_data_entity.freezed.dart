// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppDataEntity _$AppDataEntityFromJson(Map<String, dynamic> json) {
  return _AppDataEntity.fromJson(json);
}

/// @nodoc
mixin _$AppDataEntity {
  AppDataVersions? get version => throw _privateConstructorUsedError;
  AppVersion? get appVersion => throw _privateConstructorUsedError;
  AppSettingDataEntity? get appSettings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDataEntityCopyWith<AppDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDataEntityCopyWith<$Res> {
  factory $AppDataEntityCopyWith(
          AppDataEntity value, $Res Function(AppDataEntity) then) =
      _$AppDataEntityCopyWithImpl<$Res, AppDataEntity>;
  @useResult
  $Res call(
      {AppDataVersions? version,
      AppVersion? appVersion,
      AppSettingDataEntity? appSettings});

  $AppVersionCopyWith<$Res>? get appVersion;
  $AppSettingDataEntityCopyWith<$Res>? get appSettings;
}

/// @nodoc
class _$AppDataEntityCopyWithImpl<$Res, $Val extends AppDataEntity>
    implements $AppDataEntityCopyWith<$Res> {
  _$AppDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? appVersion = freezed,
    Object? appSettings = freezed,
  }) {
    return _then(_value.copyWith(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as AppDataVersions?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      appSettings: freezed == appSettings
          ? _value.appSettings
          : appSettings // ignore: cast_nullable_to_non_nullable
              as AppSettingDataEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppVersionCopyWith<$Res>? get appVersion {
    if (_value.appVersion == null) {
      return null;
    }

    return $AppVersionCopyWith<$Res>(_value.appVersion!, (value) {
      return _then(_value.copyWith(appVersion: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppSettingDataEntityCopyWith<$Res>? get appSettings {
    if (_value.appSettings == null) {
      return null;
    }

    return $AppSettingDataEntityCopyWith<$Res>(_value.appSettings!, (value) {
      return _then(_value.copyWith(appSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppDataEntityImplCopyWith<$Res>
    implements $AppDataEntityCopyWith<$Res> {
  factory _$$AppDataEntityImplCopyWith(
          _$AppDataEntityImpl value, $Res Function(_$AppDataEntityImpl) then) =
      __$$AppDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppDataVersions? version,
      AppVersion? appVersion,
      AppSettingDataEntity? appSettings});

  @override
  $AppVersionCopyWith<$Res>? get appVersion;
  @override
  $AppSettingDataEntityCopyWith<$Res>? get appSettings;
}

/// @nodoc
class __$$AppDataEntityImplCopyWithImpl<$Res>
    extends _$AppDataEntityCopyWithImpl<$Res, _$AppDataEntityImpl>
    implements _$$AppDataEntityImplCopyWith<$Res> {
  __$$AppDataEntityImplCopyWithImpl(
      _$AppDataEntityImpl _value, $Res Function(_$AppDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? appVersion = freezed,
    Object? appSettings = freezed,
  }) {
    return _then(_$AppDataEntityImpl(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as AppDataVersions?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      appSettings: freezed == appSettings
          ? _value.appSettings
          : appSettings // ignore: cast_nullable_to_non_nullable
              as AppSettingDataEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppDataEntityImpl implements _AppDataEntity {
  const _$AppDataEntityImpl({this.version, this.appVersion, this.appSettings});

  factory _$AppDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppDataEntityImplFromJson(json);

  @override
  final AppDataVersions? version;
  @override
  final AppVersion? appVersion;
  @override
  final AppSettingDataEntity? appSettings;

  @override
  String toString() {
    return 'AppDataEntity(version: $version, appVersion: $appVersion, appSettings: $appSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppDataEntityImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.appSettings, appSettings) ||
                other.appSettings == appSettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, version, appVersion, appSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppDataEntityImplCopyWith<_$AppDataEntityImpl> get copyWith =>
      __$$AppDataEntityImplCopyWithImpl<_$AppDataEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppDataEntityImplToJson(
      this,
    );
  }
}

abstract class _AppDataEntity implements AppDataEntity {
  const factory _AppDataEntity(
      {final AppDataVersions? version,
      final AppVersion? appVersion,
      final AppSettingDataEntity? appSettings}) = _$AppDataEntityImpl;

  factory _AppDataEntity.fromJson(Map<String, dynamic> json) =
      _$AppDataEntityImpl.fromJson;

  @override
  AppDataVersions? get version;
  @override
  AppVersion? get appVersion;
  @override
  AppSettingDataEntity? get appSettings;
  @override
  @JsonKey(ignore: true)
  _$$AppDataEntityImplCopyWith<_$AppDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
