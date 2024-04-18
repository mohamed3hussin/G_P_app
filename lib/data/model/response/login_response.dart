/// displayName : "mahmoodmidoTest1"
/// email : "mahmoodmido1@gmail.com"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJtYWhtb29kbWlkb1Rlc3QxIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoibWFobW9vZG1pZG8xQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJleHAiOjE3MTM2MDE0MzAsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcwODQiLCJhdWQiOiJNeVNlY3VyZUtleSJ9.T37WP5m2Sxejnr6ze5x5-y_tT6kVoTgQYwSzSUh_Uv0"
/// roles : ["User"]

class LoginResponse {
  LoginResponse({
    this.displayName,
    this.email,
    this.token,
    this.statusCode,
    this.message,
    this.roles,
  });

  LoginResponse.fromJson(dynamic json) {
    displayName = json['displayName'];
    email = json['email'];
    token = json['token'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    statusCode = json['statusMsg'];
    message = json['message'];
  }

  String? displayName;
  String? email;
  String? token;
  int? statusCode;
  String? message;
  List<String>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['displayName'] = displayName;
    map['email'] = email;
    map['token'] = token;
    map['roles'] = roles;
    return map;
  }
}
