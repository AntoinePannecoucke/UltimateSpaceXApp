// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launch',
      json,
      ($checkedConvert) {
        final val = Launch(
          id: $checkedConvert('id', (v) => v as String?),
          fairings: $checkedConvert(
              'fairings',
              (v) => v == null
                  ? null
                  : Fairings.fromJson(v as Map<String, dynamic>)),
          staticFireDateUnix:
              $checkedConvert('static_fire_date_unix', (v) => v as int?),
          staticFireDateUTC:
              $checkedConvert('static_fire_date_utc', (v) => v as String?),
          dateUTC: $checkedConvert('date_utc', (v) => v as String?),
          window: $checkedConvert('window', (v) => v as int?),
          rocket: $checkedConvert('rocket', (v) => v as String?),
          success: $checkedConvert('success', (v) => v as bool?),
          failures: $checkedConvert(
              'failures',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Fail.fromJson(e as Map<String, dynamic>))
                  .toList()),
          details: $checkedConvert('details', (v) => v as String?),
          crew: $checkedConvert('crew',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          payloads: $checkedConvert('payloads',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          launchpad: $checkedConvert('launchpad', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          upcoming: $checkedConvert('upcoming', (v) => v as bool?),
          links: $checkedConvert(
              'links',
              (v) =>
                  v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'staticFireDateUnix': 'static_fire_date_unix',
        'staticFireDateUTC': 'static_fire_date_utc',
        'dateUTC': 'date_utc'
      },
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'fairings': instance.fairings?.toJson(),
      'links': instance.links?.toJson(),
      'static_fire_date_unix': instance.staticFireDateUnix,
      'static_fire_date_utc': instance.staticFireDateUTC,
      'date_utc': instance.dateUTC,
      'window': instance.window,
      'rocket': instance.rocket,
      'success': instance.success,
      'failures': instance.failures?.map((e) => e.toJson()).toList(),
      'details': instance.details,
      'crew': instance.crew,
      'payloads': instance.payloads,
      'launchpad': instance.launchpad,
      'name': instance.name,
      'upcoming': instance.upcoming,
      'id': instance.id,
    };
