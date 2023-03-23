class UserProfileModel {
  final String email;
  final String name;
  final String uid;
  final String bio;
  final String link;

  UserProfileModel(
      {required this.email,
      required this.name,
      required this.uid,
      required this.bio,
      required this.link});

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        bio = "",
        link = "";

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "bio": bio,
      "link": link,
    };
  }
}

// 다른 유저의 정보를 불러오는것은 firebase auth 가 아닌 firestore(database)

