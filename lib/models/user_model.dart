class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.userID,
    this.profilePhoto,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userID: map['userID'] as String,
      profilePhoto: map['profilePhoto'] as String,
    );
  }
  String name;
  String email;
  String password;
  String? userID;
  String? profilePhoto;

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? userID,
    String? profilePhoto,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userID: userID ?? this.userID,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'userID': userID,
      'profilePhoto': profilePhoto,
    };
  }
}
