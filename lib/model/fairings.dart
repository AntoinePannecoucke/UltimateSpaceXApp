import 'package:json_annotation/json_annotation.dart';

part 'fairings.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;

  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered
  });

  factory Fairings.fromJson(Map<String, dynamic> json) => _$FairingsFromJson(json);

  Map<String, dynamic> toJson() => _$FairingsToJson(this);
}