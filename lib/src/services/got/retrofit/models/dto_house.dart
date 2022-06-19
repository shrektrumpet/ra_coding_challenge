import 'package:json_annotation/json_annotation.dart';

part 'dto_house.g.dart';

@JsonSerializable()
class DTOHouse {
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "region")
  final String region;
  @JsonKey(name: "coatOfArms")
  final String coatOfArms;
  @JsonKey(name: "words")
  final String words;
  @JsonKey(name: "titles")
  final List<String> titles;
  @JsonKey(name: "seats")
  final List<String> seats;
  @JsonKey(name: "currentLord")
  final String currentLordUrl;
  @JsonKey(name: "heir")
  final String heirUrl;
  @JsonKey(name: "overlord")
  final String overlordUrl;
  @JsonKey(name: "founded")
  final String founded;
  @JsonKey(name: "founder")
  final String founderUrl;
  @JsonKey(name: "diedOut")
  final String diedOut;
  @JsonKey(name: "ancestralWeapons")
  final List<String> ancestralWeapons;
  @JsonKey(name: "cadetBranches")
  final List<String> cadetBranchesUrls;
  @JsonKey(name: "swornMembers")
  final List<String> swornMembersUrls;

  DTOHouse({
    required this.url,
    required this.name,
    required this.region,
    required this.coatOfArms,
    required this.words,
    required this.titles,
    required this.seats,
    required this.currentLordUrl,
    required this.heirUrl,
    required this.overlordUrl,
    required this.founded,
    required this.founderUrl,
    required this.diedOut,
    required this.ancestralWeapons,
    required this.cadetBranchesUrls,
    required this.swornMembersUrls,
  });

  factory DTOHouse.fromJson(Map<String, dynamic> json) => _$DTOHouseFromJson(json);

  Map<String, dynamic> toJson() => _$DTOHouseToJson(this);
}
