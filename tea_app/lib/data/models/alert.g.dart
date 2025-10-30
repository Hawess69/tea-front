// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlertImpl _$$AlertImplFromJson(Map<String, dynamic> json) => _$AlertImpl(
      id: (json['id'] as num).toInt(),
      nameToTrack: json['name_to_track'] as String,
      isActive: json['is_active'] as bool,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AlertImplToJson(_$AlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_to_track': instance.nameToTrack,
      'is_active': instance.isActive,
      'user': instance.user,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$AlertsResponseImpl _$$AlertsResponseImplFromJson(Map<String, dynamic> json) =>
    _$AlertsResponseImpl(
      alerts: (json['alerts'] as List<dynamic>)
          .map((e) => Alert.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AlertsResponseImplToJson(
        _$AlertsResponseImpl instance) =>
    <String, dynamic>{
      'alerts': instance.alerts,
    };
