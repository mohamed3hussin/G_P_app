/// displayName : "mahmoodmidoTest1"
/// email : "mahmoodmido1@gmail.com"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJtYWhtb29kbWlkb1Rlc3QxIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoibWFobW9vZG1pZG8xQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJleHAiOjE3MTM2MDE0MzAsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcwODQiLCJhdWQiOiJNeVNlY3VyZUtleSJ9.T37WP5m2Sxejnr6ze5x5-y_tT6kVoTgQYwSzSUh_Uv0"
/// roles : ["User"]

class UserModel {
  String? displayName;
  String? email;
  String? token;
  List<String>? roles;

  UserModel({this.displayName, this.email, this.token, this.roles});

  UserModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }
}
class LoginUserModel {
  int? satusCode;
  bool? status;
  String? message;
  List<String>? errors;
  UserModel? data;

  LoginUserModel.fromJson(Map<String, dynamic>json)
  {
    if (json['errors'] != null) {
      errors = List<String>.from(json['errors']);
    } else {
      errors = [];
    }
    satusCode = json['satusCode'];
    status = json['status'];
    message = json['message'];
    data=json['data'] !=null?UserModel.fromJson(json['data']):null;
  }
}
class UserData
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['points'];
    credit=json['credit'];
    token=json['token'];
  }

}
