import 'package:mocktail/mocktail.dart';
import 'package:ra_coding_challenge/src/features/houses/models/house.dart';
import 'package:ra_coding_challenge/src/features/houses/repository/houses_repository.dart';
import 'package:ra_coding_challenge/src/services/got/retrofit/got_retrofit.dart';
import 'package:ra_coding_challenge/src/services/got/retrofit/models/dto_character.dart';
import 'package:ra_coding_challenge/src/services/got/retrofit/models/dto_house.dart';

class MockGotRetrofit extends Mock implements GotRetrofit {}

class MockHousesRepository extends Mock implements HousesRepository {}

final dtoHouse1 = DTOHouse(
  url: "url/1",
  name: "house1",
  region: "region",
  coatOfArms: "coatOfArms",
  words: "words",
  titles: ["titles"],
  seats: ["seats"],
  currentLordUrl: "currentLordUrl/1",
  heirUrl: "heirUrl/1",
  overlordUrl: "overlordUrl/1",
  founded: "founded",
  founderUrl: "founderUrl/1",
  diedOut: "diedOut",
  ancestralWeapons: ["ancestralWeapons"],
  cadetBranchesUrls: ["cadetBranchesUrls/1"],
  swornMembersUrls: ["swornMembersUrls/1"],
);
final dtoCharacter1 = DTOCharacter(name: "Character1");
final detailedHouse1 = House(
  url: "url/1",
  name: "house1",
  region: "region",
  coatOfArms: "coatOfArms",
  words: "words",
  titles: ["titles"],
  seats: ["seats"],
  currentLordUrl: "currentLordUrl/1",
  heirUrl: "heirUrl/1",
  overlordUrl: "overlordUrl/1",
  founded: "founded",
  founderUrl: "founderUrl/1",
  diedOut: "diedOut",
  ancestralWeapons: ["ancestralWeapons"],
  cadetBranchesUrls: ["cadetBranchesUrls/1"],
  swornMembersUrls: ["swornMembersUrls/1"],
  currentLordName: "Character1",
  heirName: "Character1",
  overlordName: "house1",
  founderName: "Character1",
  cadetBranchesNames: ["house1"],
  swornMembersNames: ["Character1"],
);
