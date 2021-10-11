import 'package:bhs/models/user.dart';

class Acte {
  String commune;
  String firstName;
  String lastName;
  String firstNameFather;
  String lastNameFather;
  String firstNameMother;
  String lastNameMother;
  String fatherJob;
  String motherJob;
  String dateBorn;
  String address;
  int state;
  String updatedAt;
  String createdAt;
  int id;
  int user_id;
  User user;

  Acte(
      {this.commune,
      this.firstName,
      this.lastName,
      this.firstNameFather,
      this.lastNameFather,
      this.firstNameMother,
      this.lastNameMother,
      this.fatherJob,
      this.motherJob,
      this.dateBorn,
      this.address,
      this.state,
      this.updatedAt,
      this.createdAt,
      this.user_id,
      this.user,
      this.id});

  Acte.fromJson(Map<String, dynamic> json) {
    commune = json['commune'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    firstNameFather = json['first_name_father'];
    lastNameFather = json['last_name_father'];
    firstNameMother = json['first_name_mother'];
    lastNameMother = json['last_name_mother'];
    fatherJob = json['father_job'];
    motherJob = json['mother_job'];
    dateBorn = json['date_born'];
    address = json['address'];
    state = json['state'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    user_id = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commune'] = this.commune;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['first_name_father'] = this.firstNameFather;
    data['last_name_father'] = this.lastNameFather;
    data['first_name_mother'] = this.firstNameMother;
    data['last_name_mother'] = this.lastNameMother;
    data['father_job'] = this.fatherJob;
    data['mother_job'] = this.motherJob;
    data['date_born'] = this.dateBorn;
    data['address'] = this.address;
    data['state'] = this.state;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }

    return data;
  }
}

class ListActe {
  List<Acte> data;

  ListActe({this.data});

  ListActe.fromJson(dynamic json) {
    if (json != null) {
      data = <Acte>[];
      json.forEach((v) {
        data.add(new Acte.fromJson(v));
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
