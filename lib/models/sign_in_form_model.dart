class SignInFormModel {
  final String? email;
  final String? password;

  SignInFormModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  SignInFormModel copyWith({
    String? email,
    String? password,
  }) =>
      SignInFormModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
