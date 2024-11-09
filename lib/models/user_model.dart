import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  String? uid;
  String? name;
  String? email;
  String? phone;
  DateTime? dob;
  String? gender;
  String? profilePic;

  UserModel({this.uid, this.name, this.email, this.phone, this.dob, this.gender, this.profilePic});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    dob =  (map['dob'] != null) 
      ?(map['dob'] as Timestamp).toDate()
      : null;
    gender = map['gender'];
    profilePic = map['profilePic'];
  }

  static Map<String, dynamic> toMap(UserModel userModel) {
    Map<String, dynamic> map = {
      'uid': userModel.uid,
      'name': userModel.name,
      'email': userModel.email,
      'phone': userModel.phone,
      'dob': Timestamp.fromMillisecondsSinceEpoch(userModel.dob!.millisecondsSinceEpoch),
      'gender': userModel.gender,
      'profilePic': userModel.profilePic,
    };
    return map;
  }

}