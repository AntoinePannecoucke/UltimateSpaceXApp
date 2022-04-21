// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launchpad _$LaunchpadFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launchpad',
      json,
      ($checkedConvert) {
        final val = Launchpad(
          id: $checkedConvert('id', (v) => v as String?),
          launches: $checkedConvert('launches',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          launchAttempts: $checkedConvert('launch_attempts', (v) => v as int?),
          launchSuccesses:
              $checkedConvert('launch_successes', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          fullName: $checkedConvert('full_name', (v) => v as String?),
          latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
          longitude:
              $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'launchAttempts': 'launch_attempts',
        'launchSuccesses': 'launch_successes',
        'fullName': 'full_name'
      },
    );

Map<String, dynamic> _$LaunchpadToJson(Launchpad instance) => <String, dynamic>{
      'id': instance.id,
      'launches': instance.launches,
      'launch_attempts': instance.launchAttempts,
      'launch_successes': instance.launchSuccesses,
      'name': instance.name,
      'full_name': instance.fullName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
