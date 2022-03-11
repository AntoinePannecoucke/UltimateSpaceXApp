import 'package:json_annotation/json_annotation.dart';

import 'fairings.dart';
import 'links.dart';
import 'fail.dart';

part 'launch.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launch {
  Fairings? fairings;
  Links? links;
  @JsonKey(name: "static_fire_date_unix")
  int? staticFireDateUnix;
  @JsonKey(name: "static_fire_date_utc")
  String? staticFireDateUTC;
  @JsonKey(name: "date_utc")
  String? dateUTC;
  int? window;
  String? rocket;
  bool? success;
  List<Fail>? failures;
  String? details;
  List<String>? crew;
  List<String>? payloads;
  String? launchpad;
  String? name;
  bool? upcoming;
  String? id;

  Launch({
    required this.id,
    this.fairings,
    this.staticFireDateUnix,
    this.staticFireDateUTC,
    this.dateUTC,
    this.window,
    this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.payloads,
    this.launchpad,
    this.name,
    this.upcoming,
    this.links
  });


  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}