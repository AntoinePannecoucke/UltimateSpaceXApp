import 'package:json_annotation/json_annotation.dart';


part 'fail.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Fail {
  int? time;
  int? altitude;
  String? reason;

  Fail({
    this.time,
    this.altitude,
    this.reason
  });

  factory Fail.fromJson(Map<String, dynamic> json) => _$FailFromJson(json);

  Map<String, dynamic> toJson() => _$FailToJson(this);
}