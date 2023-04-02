class UserProfileModel {
  final String email;
  final String name;
  final String uid;
  final String bio;
  final String link;
  final bool hasAvatar;

  UserProfileModel({
    required this.hasAvatar,
    required this.email,
    required this.name,
    required this.uid,
    required this.bio,
    required this.link,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        bio = "",
        link = "",
        hasAvatar = false;

  UserProfileModel.fromjson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["email"],
        name = json["name"],
        bio = json["bio"],
        hasAvatar = json["hasAvatar"],
        link = json["link"];

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "bio": bio,
      "link": link,
    };
  }

  UserProfileModel copywith({
    String? email,
    String? name,
    String? uid,
    String? bio,
    String? link,
    bool? hasAvatar,
  }) {
    return UserProfileModel(
      hasAvatar: hasAvatar ?? this.hasAvatar,
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      link: link ?? this.link,
    );
  }
}

// 다른 유저의 정보를 불러오는것은 firebase auth 가 아닌 firestore(database)

