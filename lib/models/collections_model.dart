import 'package:cypherkicks/components/images.dart';

class CollectionsModel {
  String? title;
  String? season;
  String? nFTs;
  String? dateTime;
  String? imagePath;

  CollectionsModel(
      {this.title, this.season, this.nFTs, this.dateTime, this.imagePath});
}

List<CollectionsModel> collections = [
  CollectionsModel(
    title: 'CypherKicks',
    season: 'Season 1 & 2',
    nFTs: '350',
    dateTime: '22,Jan 2023',
    imagePath: Images.cypher1,
  ),
  CollectionsModel(
    title: 'CypherKicks',
    season: 'Season 3',
    nFTs: '350',
    dateTime: '11,Feb 2023',
    imagePath: Images.cypher1,
  ),
  CollectionsModel(
    title: 'CypherKicks',
    season: 'Season 2',
    nFTs: '250',
    dateTime: '22,Feb 2023',
    imagePath: Images.cypher2,
  ),
  CollectionsModel(
    title: 'CypherKicks',
    season: 'Season 1 & 2',
    nFTs: '350',
    dateTime: '22,Feb 2023',
    imagePath: Images.cypher2,
  ),
  CollectionsModel(
    title: 'DeadKicks',
    season: 'Season 1 & 2',
    nFTs: '350',
    dateTime: '22,Feb 2023',
    imagePath: Images.cypher1,
  )
];
