class ModelListNV {
  int? id;
  String? name;
  String? fullName;
  String? email;
  String? phone;
  int? role;
  int? projectId;
  String? emailVerifiedAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ModelListNV(
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

  ModelListNV.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['project_id'] = this.projectId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
