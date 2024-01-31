class Agent{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  Agent({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
  });
  dynamic fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
    );

    }
  Map<String,dynamic> toJson(){
    return{
      'id':id,
      'name':name,
      'email':email,
      'phone':phone,
      'photo':photo,
    };

  }



}