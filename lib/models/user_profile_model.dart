class UserProfileModel {
  String? nickname;
  String? address;
  String? discordUsername;
  String? country;

  UserProfileModel(
      {this.nickname, this.address, this.discordUsername, this.country});

  factory UserProfileModel.fromJson(map) {
    return UserProfileModel(
      nickname: map['uid'],
      address: map['email'] ?? '',
      discordUsername: map['password'] ?? '',
      country: map['phoneNumber'] ?? '',
    );
  }
  toJson() {
    return {
      "nickname": nickname,
      "address": address,
      "discordUsername": discordUsername,
      "country": country,
    };
  }
}
