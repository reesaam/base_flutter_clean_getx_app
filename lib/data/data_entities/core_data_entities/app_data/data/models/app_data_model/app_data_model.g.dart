// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppDataModelImpl _$$AppDataModelImplFromJson(Map<String, dynamic> json) =>
    _$AppDataModelImpl(
      version: $enumDecodeNullable(_$AppDataVersionsEnumMap, json['version']),
      appVersion: json['appVersion'] == null
          ? null
          : AppVersion.fromJson(json['appVersion'] as Map<String, dynamic>),
      settings: json['settings'] == null
          ? null
          : AppSettingDataModel.fromJson(
              json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppDataModelImplToJson(_$AppDataModelImpl instance) =>
    <String, dynamic>{
      'version': _$AppDataVersionsEnumMap[instance.version],
      'appVersion': instance.appVersion,
      'settings': instance.settings,
    };

const _$AppDataVersionsEnumMap = {
  AppDataVersions.v1: 'v1',
};
