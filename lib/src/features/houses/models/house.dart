import 'package:ra_coding_challenge/src/services/got/retrofit/models/dto_house.dart';

class House {
  final String url;
  final String name;
  final String region;
  final String coatOfArms;
  final String words;
  final List<String> titles;
  final List<String> seats;
  final String currentLordUrl;
  final String heirUrl;
  final String overlordUrl;
  final String founded;
  final String founderUrl;
  final String diedOut;
  final List<String> ancestralWeapons;
  final List<String> cadetBranchesUrls;
  final List<String> swornMembersUrls;
  final String? currentLordName;
  final String? heirName;
  final String? overlordName;
  final String? founderName;
  final List<String>? cadetBranchesNames;
  final List<String>? swornMembersNames;

  House({
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
    this.currentLordName,
    this.heirName,
    this.overlordName,
    this.founderName,
    this.cadetBranchesNames,
    this.swornMembersNames,
  });

  factory House.fromDtoHouse(DTOHouse dtoHouse) {
    return House(
      url: dtoHouse.url,
      name: dtoHouse.name,
      region: dtoHouse.region,
      coatOfArms: dtoHouse.coatOfArms,
      words: dtoHouse.words,
      titles: dtoHouse.titles,
      seats: dtoHouse.seats,
      currentLordUrl: dtoHouse.currentLordUrl,
      heirUrl: dtoHouse.heirUrl,
      overlordUrl: dtoHouse.overlordUrl,
      founded: dtoHouse.founded,
      founderUrl: dtoHouse.founderUrl,
      diedOut: dtoHouse.diedOut,
      ancestralWeapons: dtoHouse.ancestralWeapons,
      cadetBranchesUrls: dtoHouse.cadetBranchesUrls,
      swornMembersUrls: dtoHouse.swornMembersUrls,
    );
  }

  House copyWith({
    String? url,
    String? name,
    String? region,
    String? coatOfArms,
    String? words,
    List<String>? titles,
    List<String>? seats,
    String? currentLordUrl,
    String? heirUrl,
    String? overlordUrl,
    String? founded,
    String? founderUrl,
    String? diedOut,
    List<String>? ancestralWeapons,
    List<String>? cadetBranchesUrls,
    List<String>? swornMembersUrls,
    String? currentLordName,
    String? heirName,
    String? overlordName,
    String? founderName,
    List<String>? cadetBranchesNames,
    List<String>? swornMembersNames,
  }) {
    return House(
      url: url ?? this.url,
      name: name ?? this.name,
      region: region ?? this.region,
      coatOfArms: coatOfArms ?? this.coatOfArms,
      words: words ?? this.words,
      titles: titles ?? this.titles,
      seats: seats ?? this.seats,
      currentLordUrl: currentLordUrl ?? this.currentLordUrl,
      heirUrl: heirUrl ?? this.heirUrl,
      overlordUrl: overlordUrl ?? this.overlordUrl,
      founded: founded ?? this.founded,
      founderUrl: founderUrl ?? this.founderUrl,
      diedOut: diedOut ?? this.diedOut,
      ancestralWeapons: ancestralWeapons ?? this.ancestralWeapons,
      cadetBranchesUrls: cadetBranchesUrls ?? this.cadetBranchesUrls,
      swornMembersUrls: swornMembersUrls ?? this.swornMembersUrls,
      currentLordName: currentLordName ?? this.currentLordName,
      heirName: heirName ?? this.heirName,
      overlordName: overlordName ?? this.overlordName,
      founderName: founderName ?? this.founderName,
      cadetBranchesNames: cadetBranchesNames ?? this.cadetBranchesNames,
      swornMembersNames: swornMembersNames ?? this.swornMembersNames,
    );
  }
}
