class UserModel {
  UserModel({
    required this.id,
    required this.name,
    this.document,
    required this.phone,
  });
  late final String id;
  late final String name;
  late final String? document;
  late final String phone;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    document = json['document'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['document'] = document;
    data['phone'] = phone;
    return data;
  }
}
