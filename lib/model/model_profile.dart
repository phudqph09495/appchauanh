class ModelProfile {
  int? id;
  String? name;
  String? fullName;
  String? email;
  String? phone;
  Role? role;
  List<ProjectId>? projectId;
  Null? emailVerifiedAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ModelProfile(
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

  ModelProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    if (json['project_id'] != null) {
      projectId = <ProjectId>[];
      json['project_id'].forEach((v) {
        projectId!.add(new ProjectId.fromJson(v));
      });
    }
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
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    if (this.projectId != null) {
      data['project_id'] = this.projectId!.map((v) => v.toJson()).toList();
    }
    data['email_verified_at'] = this.emailVerifiedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Role {
  int? id;
  String? name;

  Role({this.id, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProjectId {
  int? id;
  String? name;
  String? description;

  ProjectId({this.id, this.name, this.description});

  ProjectId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
