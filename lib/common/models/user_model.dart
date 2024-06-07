

class UserProfile {
  final String? uid;
  final String? email;
  final String? username;

  UserProfile({this.email, this.username, this.uid});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
      };
}
