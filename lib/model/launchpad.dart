import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launchpad {
  String? id;
  List<String>? launches;
  int? launchAttempts;
  int? launchSuccesses;
  String? name;
  String? fullName;
  double? latitude;
  double? longitude;

Launchpad({
  required this.id,
  this.launches,
  this.launchAttempts,
  this.launchSuccesses,
  this.name,
  this.fullName,
  this.latitude,
  this.longitude
  });

  factory Launchpad.fromJson(Map<String, dynamic> json) => _$LaunchpadFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchpadToJson(this);
}