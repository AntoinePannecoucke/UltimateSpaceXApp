import 'package:json_annotation/json_annotation.dart';

import 'headquarters.dart';


part 'compagny_info.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class CompagnyInfo {
  String id;
  String? name;
  String? founder;
  String? ceo;
  String? cto;
  String? coo;
  @JsonKey(name: "cto_propulsion")
  String? ctoPropulsion;
  int? founded;
  int? employees;
  String? summary;
  @JsonKey(name: "launch_sites")
  int? launchSites;
  Headquarters? headquarters;

  CompagnyInfo({
    required this.id,
    this.name,
    this.ceo,
    this.cto,
    this.coo,
    this.ctoPropulsion,
    this.founded,
    this.employees,
    this.founder,
    this.headquarters,
    this.launchSites,
    this.summary,
  });

  factory CompagnyInfo.fromJson(Map<String, dynamic> json) => _$CompagnyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompagnyInfoToJson(this);
}