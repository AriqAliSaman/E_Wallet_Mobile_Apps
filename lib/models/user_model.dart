class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? password;
  String? emailVerifiedAt;
  int? verified;
  String? profilePicture;
  String? ktp;
  String? createdAt;
  String? updatedAt;
  int? balance;
  String? cardNumber;
  String? pin;
  String? token;
  int? tokenExpiresIn;
  String? tokenType;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.password,
      this.emailVerifiedAt,
      this.verified,
      this.profilePicture,
      this.ktp,
      this.createdAt,
      this.updatedAt,
      this.balance,
      this.cardNumber,
      this.pin,
      this.token,
      this.tokenExpiresIn,
      this.tokenType});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    emailVerifiedAt = json['email_verified_at'];
    verified = json['verified'];
    profilePicture = json['profile_picture'];
    ktp = json['ktp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    balance = json['balance'];
    cardNumber = json['card_number'];
    pin = json['pin'];
    token = json['token'];
    tokenExpiresIn = json['token_expires_in'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    data['email_verified_at'] = emailVerifiedAt;
    data['verified'] = verified;
    data['profile_picture'] = profilePicture;
    data['ktp'] = ktp;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['balance'] = balance;
    data['card_number'] = cardNumber;
    data['pin'] = pin;
    data['token'] = token;
    data['token_expires_in'] = tokenExpiresIn;
    data['token_type'] = tokenType;
    return data;
  }

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        emailVerifiedAt: emailVerifiedAt,
        verified: verified,
        profilePicture: profilePicture,
        ktp: ktp,
        createdAt: createdAt,
        updatedAt: updatedAt,
        balance: balance ?? this.balance,
        cardNumber: cardNumber,
        pin: pin ?? this.pin,
        token: token,
        tokenExpiresIn: tokenExpiresIn,
        tokenType: tokenType,
      );
}
