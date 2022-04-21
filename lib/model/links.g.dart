// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Links',
      json,
      ($checkedConvert) {
        final val = Links(
          patch: $checkedConvert(
              'patch',
              (v) =>
                  v == null ? null : Patch.fromJson(v as Map<String, dynamic>)),
          youtubeId: $checkedConvert('youtube_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'youtubeId': 'youtube_id'},
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch?.toJson(),
      'youtube_id': instance.youtubeId,
    };
