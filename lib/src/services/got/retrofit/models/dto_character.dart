import 'package:json_annotation/json_annotation.dart';

part 'dto_character.g.dart';

@JsonSerializable()
class DTOCharacter {
  @JsonKey(name: "name")
  final String name;

  DTOCharacter({required this.name});

  factory DTOCharacter.fromJson(Map<String, dynamic> json) => _$DTOCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$DTOCharacterToJson(this);
}
