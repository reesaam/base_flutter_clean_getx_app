// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppDataEntityImpl _$$AppDataEntityImplFromJson(Map<String, dynamic> json) =>
    _$AppDataEntityImpl(
      version: $enumDecodeNullable(_$AppDataVersionsEnumMap, json['version']),
      appVersion: json['appVersion'] == null
          ? null
          : AppVersion.fromJson(json['appVersion'] as Map<String, dynamic>),
      appSettings: json['appSettings'] == null
          ? null
          : AppSettingDataEntity.fromJson(
              json['appSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppDataEntityImplToJson(_$AppDataEntityImpl instance) =>
    <String, dynamic>{
      'version': _$AppDataVersionsEnumMap[instance.version],
      'appVersion': instance.appVersion,
      'appSettings': instance.appSettings,
    };

const _$AppDataVersionsEnumMap = {
  AppDataVersions.v1: 'v1',
};
