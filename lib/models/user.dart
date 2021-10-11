
class User {
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  int roleId;
  int state;
  String updatedAt;
  String createdAt;
  String password;
  String passwordConfirmed;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.roleId,
    this.state,
    this.password,
    this.passwordConfirmed,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    roleId = json['role_id'];
    state = json['state'];
    password = json['password'];
    passwordConfirmed = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['role_id'] = this.roleId;
    data['state'] = this.state;

    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmed;

    return data;
  }
}

class ListUsers {
  List<User> data;

  ListUsers({this.data});

  ListUsers.fromJson(dynamic json) {
    if (json != null) {
      data = <User>[];
      json.forEach((v) {
        data.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
