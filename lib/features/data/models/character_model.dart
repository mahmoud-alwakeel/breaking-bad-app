class CharacterModel {
  late final int id;
  late final String name;
  late final String status;
  late final String species;
  late final String type;
  late final String gender;
  late final String image;
  late final List<dynamic> episode;
  
  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['results']['id'];
    name = json['results']['name'];
    status = json['results']['status'];
    species = json['results']['species'];
    type = json['results']['type'];
    gender = json['results']['gender'];
    image = json['results']['image'];
    episode = json['results']['episode'];
  }
}