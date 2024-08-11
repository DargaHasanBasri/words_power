class UserModel {
  UserModel({
    this.name,
    this.email,
    this.password,
    this.userID,
    this.profilePhoto,
    this.posts,
    this.score,
    this.followers,
    this.followings,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userID: map['userID'] as String,
      profilePhoto: map['profilePhoto'] as String,
      posts: map['posts'] as int? ?? 0,
      score: map['score'] as int? ?? 0,
      followers: List<String>.from(
        map['followers'] != null
            ? List<String>.from(map['followers'] as List)
            : [],
      ),
      followings: List<String>.from(
        map['followings'] != null
            ? List<String>.from(map['followings'] as List)
            : [],
      ),
    );
  }
  String? name;
  String? email;
  String? password;
  String? userID;
  String? profilePhoto;
  int? posts;
  int? score;
  List<String>? followers;
  List<String>? followings;

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? userID,
    String? profilePhoto,
    int? posts,
    int? score,
    List<String>? followers,
    List<String>? followings,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userID: userID ?? this.userID,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      posts: posts ?? this.posts,
      score: score ?? this.score,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'userID': userID,
      'profilePhoto': profilePhoto,
      'posts': posts,
      'score': score,
      'followers': followers,
      'followings': followings,
    };
  }
}
