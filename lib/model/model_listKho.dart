class ModelListKho {
  int? id;
  int? projectId;
  String? type;
  String? name;
  String? address;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ModelListKho(
      {this.id,
        this.projectId,
        this.type,
        this.name,
        this.address,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ModelListKho.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    type = json['type'];
    name = json['name'];
    address = json['address'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['address'] = this.address;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
