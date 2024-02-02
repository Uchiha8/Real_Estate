class CustomUser {
  CustomUser({
    required this.id,
     this.password,
     this.lastLogin,
     this.isSuperuser,
   this.role,
     this.email,
     this.firstName,
   this.lastName,
    this.isActive,
    this.profileImage,
    this.groups,
   this.userPermissions,
  });
  late final int id;
  late final String? password;
  late final String? lastLogin;
  late final bool? isSuperuser;
  late final String? role;
  late final String? email;
  late final String? firstName;
  late final String? lastName;
  late final bool? isActive;
  late final Null? profileImage;
  late final List<dynamic>? groups;
  late final List<dynamic>? userPermissions;

  CustomUser.fromJson(Map<String, dynamic> json){
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    role = json['role'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isActive = json['is_active'];
    profileImage = null;
    groups = List.castFrom<dynamic, dynamic>(json['groups']);
    userPermissions = List.castFrom<dynamic, dynamic>(json['user_permissions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['password'] = password;
    _data['last_login'] = lastLogin;
    _data['is_superuser'] = isSuperuser;
    _data['role'] = role;
    _data['email'] = email;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['is_active'] = isActive;
    _data['profile_image'] = profileImage;
    _data['groups'] = groups;
    _data['user_permissions'] = userPermissions;
    return _data;
  }
}