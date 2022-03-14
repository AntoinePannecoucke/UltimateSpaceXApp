import 'package:json_annotation/json_annotation.dart';

import 'headquarters.dart';


part 'company_info.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class CompanyInfo {
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

  CompanyInfo({
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

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => _$CompanyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);
}