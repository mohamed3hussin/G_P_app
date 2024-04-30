class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class ErrorResponse {
  final List<String> errors;
  final int statusCode;
  final String message;

  ErrorResponse({
    required this.errors,
    required this.statusCode,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    List<String> errorList = json['errors'] != null ? List<String>.from(json['errors']) : [];
    return ErrorResponse(
      errors: errorList,
      statusCode: json['satusCode'],
      message: json['message'],
    );
  }
}

class LoginSuccessResponse {
  final String displayName;
  final String email;
  final String token;
  final List<String> roles;

  LoginSuccessResponse({
    required this.displayName,
    required this.email,
    required this.token,
    required this.roles,
  });

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) {
    return LoginSuccessResponse(
      displayName: json['displayName'],
      email: json['email'],
      token: json['token'],
      roles: List<String>.from(json['roles']),
    );
  }
}
