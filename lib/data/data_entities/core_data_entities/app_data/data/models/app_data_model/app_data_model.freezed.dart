// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppDataModel _$AppDataModelFromJson(Map<String, dynamic> json) {
  return _AppDataModel.fromJson(json);
}

/// @nodoc
mixin _$AppDataModel {
  AppDataVersions? get version => throw _privateConstructorUsedError;
  AppVersion? get appVersion => throw _privateConstructorUsedError;
  AppSettingDataModel? get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDataModelCopyWith<AppDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDataModelCopyWith<$Res> {
  factory $AppDataModelCopyWith(
          AppDataModel value, $Res Function(AppDataModel) then) =
      _$AppDataModelCopyWithImpl<$Res, AppDataModel>;
  @useResult
  $Res call(
      {AppDataVersions? version,
      AppVersion? appVersion,
      AppSettingDataModel? settings});

  $AppVersionCopyWith<$Res>? get appVersion;
  $AppSettingDataModelCopyWith<$Res>? get settings;
}

/// @nodoc
class _$AppDataModelCopyWithImpl<$Res, $Val extends AppDataModel>
    implements $AppDataModelCopyWith<$Res> {
  _$AppDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? appVersion = freezed,
    Object? settings = freezed,
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
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettingDataModel?,
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
  $AppSettingDataModelCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $AppSettingDataModelCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppDataModelImplCopyWith<$Res>
    implements $AppDataModelCopyWith<$Res> {
  factory _$$AppDataModelImplCopyWith(
          _$AppDataModelImpl value, $Res Function(_$AppDataModelImpl) then) =
      __$$AppDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppDataVersions? version,
      AppVersion? appVersion,
      AppSettingDataModel? settings});

  @override
  $AppVersionCopyWith<$Res>? get appVersion;
  @override
  $AppSettingDataModelCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$AppDataModelImplCopyWithImpl<$Res>
    extends _$AppDataModelCopyWithImpl<$Res, _$AppDataModelImpl>
    implements _$$AppDataModelImplCopyWith<$Res> {
  __$$AppDataModelImplCopyWithImpl(
      _$AppDataModelImpl _value, $Res Function(_$AppDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? appVersion = freezed,
    Object? settings = freezed,
  }) {
    return _then(_$AppDataModelImpl(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as AppDataVersions?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettingDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppDataModelImpl implements _AppDataModel {
  const _$AppDataModelImpl({this.version, this.appVersion, this.settings});

  factory _$AppDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppDataModelImplFromJson(json);

  @override
  final AppDataVersions? version;
  @override
  final AppVersion? appVersion;
  @override
  final AppSettingDataModel? settings;

  @override
  String toString() {
    return 'AppDataModel(version: $version, appVersion: $appVersion, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppDataModelImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version, appVersion, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppDataModelImplCopyWith<_$AppDataModelImpl> get copyWith =>
      __$$AppDataModelImplCopyWithImpl<_$AppDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppDataModelImplToJson(
      this,
    );
  }
}

abstract class _AppDataModel implements AppDataModel {
  const factory _AppDataModel(
      {final AppDataVersions? version,
      final AppVersion? appVersion,
      final AppSettingDataModel? settings}) = _$AppDataModelImpl;

  factory _AppDataModel.fromJson(Map<String, dynamic> json) =
      _$AppDataModelImpl.fromJson;

  @override
  AppDataVersions? get version;
  @override
  AppVersion? get appVersion;
  @override
  AppSettingDataModel? get settings;
  @override
  @JsonKey(ignore: true)
  _$$AppDataModelImplCopyWith<_$AppDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
