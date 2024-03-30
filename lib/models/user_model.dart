class UserModel {
  String uid;
  String userName;
  String? fullName;
  String emailId;
  double? rating;

  UserModel({
    required this.uid,
    required this.userName,
    required this.emailId,
    this.fullName,
    this.rating,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      userName: json['userName'],
      fullName: json['fullName'],
      emailId: json['emailId'],
      rating: json['rating']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['userName'] = userName;
    data['fullName'] = fullName;
    data['emailId'] = emailId;
    data['rating'] = rating;
    return data;
  }

  @override
  String toString() {
    return 'UserModel{uid: $uid, userName: $userName, fullName: $fullName, emailId: $emailId, rating: $rating}';
  }

  List<UserModel> users = [
    UserModel(
      uid: '1',
      userName: 'swagnik',
      fullName: 'Swagnik Saha',
      emailId: 'swagnik1234@gmail.com',
      rating: 4.5,
    ),
    UserModel(
      uid: '2',
      userName: 'john123',
      fullName: 'John Doe',
      emailId: 'user1@example.com',
      rating: 4.5,
    ),
    UserModel(
      uid: '3',
      userName: 'jane456',
      fullName: 'Jane Smith',
      emailId: 'user2@example.com',
      rating: 3.8,
    ),
    UserModel(
      uid: '4',
      userName: 'alice789',
      fullName: 'Alice Johnson',
      emailId: 'user3@example.com',
      rating: 4.2,
    ),
    UserModel(
      uid: '5',
      userName: 'bob234',
      fullName: 'Bob Brown',
      emailId: 'user4@example.com',
      rating: 4.0,
    ),
  ];
}
