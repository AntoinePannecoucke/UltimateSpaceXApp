
import 'package:json_annotation/json_annotation.dart';
import 'patch.dart';

part 'links.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Links {
  Patch? patch;
  String? youtubeId;

  Links({
    this.patch,
    this.youtubeId
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}