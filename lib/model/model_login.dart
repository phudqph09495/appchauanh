class ModelLogin {
  User? user;
  String? token;

  ModelLogin({this.user, this.token});

  ModelLogin.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

}

class User {
  int? id;
  String? name;
  String? fullName;
  String? email;
  String? phone;
  int? role;
  int? projectId;
  Null? emailVerifiedAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  User(
      {this.id,
        this.name,
        this.fullName,
        this.email,
        this.phone,
        this.role,
        this.projectId,
        this.emailVerifiedAt,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    projectId = json['project_id'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }


}
