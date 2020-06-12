import 'package:cloud_firestore/cloud_firestore.dart';

class userDataHelpUsForm {
  final String uid;
  userDataHelpUsForm({this.uid});
  final CollectionReference helpusform = Firestore.instance.collection('users');
  final CollectionReference goal2 = Firestore.instance.collection('goal');
  final CollectionReference yourcalorieGoal =
      Firestore.instance.collection('YourCalorieGoal');
  final CollectionReference initialbmi =
      Firestore.instance.collection('initialbmi');

  Future updateInitialBMI(double initialBMI, int idealWeight) async {
    return await Firestore.instance
        .collection(uid)
        .document('initialBMI')
        .setData(
            {'bmi_Initial': initialBMI, 'ideal_weight_initial': idealWeight});
  }

  Future updatetargetData(
    int dailycal,
    double goalBMI,
    String weeklyGain,
  ) async {
    return await Firestore.instance.collection(uid).document('target').setData(
        {'DailyCal': dailycal, 'goalBMI': goalBMI, 'weeklyGain': weeklyGain});
  }

  Future updategoalData(
    double weight,
    double targetDuration,
    int goalid,
  ) async {
    return await Firestore.instance.collection(uid).document('goal').setData(
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
    return await Firestore.instance
        .collection(uid)
        .document('userData')
        .setData({
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
