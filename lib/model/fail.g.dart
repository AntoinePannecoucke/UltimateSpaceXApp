// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fail _$FailFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Fail',
      json,
      ($checkedConvert) {
        final val = Fail(
          time: $checkedConvert('time', (v) => v as int?),
          altitude: $checkedConvert('altitude', (v) => v as int?),
          reason: $checkedConvert('reason', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$FailToJson(Fail instance) => <String, dynamic>{
      'time': instance.time,
      'altitude': instance.altitude,
      'reason': instance.reason,
    };
