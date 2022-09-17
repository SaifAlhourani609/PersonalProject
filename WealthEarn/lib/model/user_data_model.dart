import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

var uuid = Uuid();

var v4 = uuid.v4();

class MyUser {
  String? email;
  String? name;
  String? id;
  String? password;
  int? vip1;
  int? vip2;
  int? vip3;
  double? amount;

  MyUser({required this.email, required this.password, amount});

  factory MyUser.fromJson(Map<String, dynamic> json) {
    MyUser user = MyUser(
      email: json["email"] ?? '',
      password: json["password"] ?? '',
    );
    if (json['name'] != null) {
      user.name = json['name'];
    }
    if (json["amount"] != null) {
      user.amount = json["amount"];
    }
    if (json["id"] != null) {
      user.id = json["id"];
    }
    if (json["vip1"] != null) {
      user.vip1 = json["vip1"];
    }
    if (json["vip2"] != null) {
      user.vip2 = json["vip2"];
    }
    if (json["vip3"] != null) {
      user.vip3 = json["vip3"];
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['id'] = v4;
    data['password'] = password;
    data['amount'] = 0.01;
    data['vip1'] = 0;
    data['vip2'] = 0;
    data['vip3'] = 0;
    return data;
  }
}
