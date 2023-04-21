class ModelListPrd {
  int? id;
  int? projectId;
  String? code;
  String? name;
  String? note;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ModelListPrd(
      {this.id,
        this.projectId,
        this.code,
        this.name,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ModelListPrd.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    code = json['code'];
    name = json['name'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
