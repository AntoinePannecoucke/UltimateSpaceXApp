import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Crew {
  String? id;
  String? name;
  String? image;

  Crew({
    required this.id,
    this.name,
    this.image
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}