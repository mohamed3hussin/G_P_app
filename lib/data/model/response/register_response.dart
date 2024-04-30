class RegisterRequest {
  final String displayName;
  final String email;
  final String password;

  RegisterRequest({
    required this.displayName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'password': password,
    };
  }
}

class RegisterSuccessResponse {
  final String displayName;
  final String email;
  final String token;
  final List<String> roles;

  RegisterSuccessResponse({
    required this.displayName,
    required this.email,
    required this.token,
    required this.roles,
  });

  factory RegisterSuccessResponse.fromJson(Map<String, dynamic> json) {
    return RegisterSuccessResponse(
      displayName: json['displayName'],
      email: json['email'],
      token: json['token'],
      roles: List<String>.from(json['roles']),
    );
  }
}

class RegisterErrorResponse {
  final int statusCode;
  final String message;

  RegisterErrorResponse({
    required this.statusCode,
    required this.message,
  });

  factory RegisterErrorResponse.fromJson(Map<String, dynamic> json) {
    return RegisterErrorResponse(
      statusCode: json['satusCode'],
      message: json['message'],
    );
  }
}
