// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fairings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fairings _$FairingsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Fairings',
      json,
      ($checkedConvert) {
        final val = Fairings(
          reused: $checkedConvert('reused', (v) => v as bool?),
          recoveryAttempt:
              $checkedConvert('recovery_attempt', (v) => v as bool?),
          recovered: $checkedConvert('recovered', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'recoveryAttempt': 'recovery_attempt'},
    );

Map<String, dynamic> _$FairingsToJson(Fairings instance) => <String, dynamic>{
      'reused': instance.reused,
      'recovery_attempt': instance.recoveryAttempt,
      'recovered': instance.recovered,
    };
