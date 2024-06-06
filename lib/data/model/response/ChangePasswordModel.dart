/// CurrentPassword : "NewPa$$w0rd"
/// NewPassword : "Pa$$w0rd"

class ChangePasswordRequest {
  ChangePasswordRequest({
      this.currentPassword, 
      this.newPassword,});

  ChangePasswordRequest.fromJson(dynamic json) {
    currentPassword = json['CurrentPassword'];
    newPassword = json['NewPassword'];
  }
  String? currentPassword;
  String? newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CurrentPassword'] = currentPassword;
    map['NewPassword'] = newPassword;
    return map;
  }

}
class ChangePasswordResponse {
  final int statusCode;
  final String message;

  ChangePasswordResponse({
    required this.statusCode,
    required this.message,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponse(
      statusCode: json['satusCode'],
      message: json['message'],
    );
  }
}