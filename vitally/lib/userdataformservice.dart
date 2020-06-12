import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vitally/main.dart';

class userDataHelpUsForm {
  final String uid;
  userDataHelpUsForm({this.uid});
  final CollectionReference helpusform = Firestore.instance.collection('users');
  final CollectionReference goal2 = Firestore.instance.collection('goal');

  Future updategoalData(
    double weight,
    double targetDuration,
    int goalid,
  ) async {
    return goal2.document(uid).setData(
        {'TargetWeight': weight, 'Duration': targetDuration, 'Goal': goalid});
  }

  Future updateUserData(
      String name,
      int age,
      int gender,
      double weight,
      int weightunit,
      double height,
      int heightunit,
      String occupation,
      int daily,
      String city) async {
    return await helpusform.document(uid).setData({
      'userName': name,
      'userAge': age,
      'userGender': gender,
      'userCity': city,
      'userDailyActivity': daily,
      'userHeight': height,
      'userWeight': weight,
      'userOccupation': occupation,
      'userWeightUnit': weightunit,
      'userHeightUnit': heightunit,
    });
  }
}
