// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTOHouse _$DTOHouseFromJson(Map<String, dynamic> json) => DTOHouse(
      url: json['url'] as String,
      name: json['name'] as String,
      region: json['region'] as String,
      coatOfArms: json['coatOfArms'] as String,
      words: json['words'] as String,
      titles:
          (json['titles'] as List<dynamic>).map((e) => e as String).toList(),
      seats: (json['seats'] as List<dynamic>).map((e) => e as String).toList(),
      currentLordUrl: json['currentLord'] as String,
      heirUrl: json['heir'] as String,
      overlordUrl: json['overlord'] as String,
      founded: json['founded'] as String,
      founderUrl: json['founder'] as String,
      diedOut: json['diedOut'] as String,
      ancestralWeapons: (json['ancestralWeapons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cadetBranchesUrls: (json['cadetBranches'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      swornMembersUrls: (json['swornMembers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DTOHouseToJson(DTOHouse instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'region': instance.region,
      'coatOfArms': instance.coatOfArms,
      'words': instance.words,
      'titles': instance.titles,
      'seats': instance.seats,
      'currentLord': instance.currentLordUrl,
      'heir': instance.heirUrl,
      'overlord': instance.overlordUrl,
      'founded': instance.founded,
      'founder': instance.founderUrl,
      'diedOut': instance.diedOut,
      'ancestralWeapons': instance.ancestralWeapons,
      'cadetBranches': instance.cadetBranchesUrls,
      'swornMembers': instance.swornMembersUrls,
    };
