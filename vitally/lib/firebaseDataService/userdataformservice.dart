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

  String today = DateTime.now().day.toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();

  String time = DateTime.now().hour.toString() +
      ':' +
      DateTime.now().minute.toString() +
      ':' +
      DateTime.now().second.toString();

  String time1 = DateTime.now().hour.toString() +
      ' : ' +
      DateTime.now().minute.toString() +
      ' : ' +
      DateTime.now().second.toString();

  Future updateInitialBMI(double initialBMI, int idealWeight) async {
    return await Firestore.instance
        .collection(uid)
        .document('initialBMI')
        .setData(
            {'bmi_Initial': initialBMI, 'ideal_weight_initial': idealWeight});
  }

  Future weightUpdate(int weight) async {
    return await Firestore.instance
        .collection(uid)
        .document('initialBMI')
        .collection('WeightData')
        .document(today)
        .setData({'weight': weight});
  }

  Future healthData(int request, String email) async {
    return await Firestore.instance
        .collection(uid)
        .document('initialBMI')
        .updateData(
            {'healthData': request, 'requestTime': time1, 'email': email});
  }

  Future DailyWaterIntake(int ml) async {
    return await Firestore.instance
        .collection(uid)
        .document('target')
        .updateData({'DailyWater': ml});
  }

  Future WaterLog(int ml, int remaining, var time) async {
    updateTomorrowWaterLog(0, 0, 0);

    return await Firestore.instance
        .collection(uid)
        .document('userData')
        .collection('$today')
        .document('WaterConsumed')
        .collection('WaterLog')
        .document('$time')
        .setData({'Quantity': ml, 'RemainingQty': remaining}, merge: false);
  }

  Future FoodLog(String foodname, var qty, String url, var calories) async {
    updateTomorrowFoodLog('0', 0, '0', 0);
    return await Firestore.instance
        .collection(uid)
        .document('userData')
        .collection('$today')
        .document('FoodConsumed')
        .collection('FoodLog')
        .document(foodname)
        .setData({'qty': qty, 'imageURL': url, 'calories': calories},
            merge: false);
  }

  Future updateTomorrowFoodLog(
      String foodname, var qty, String url, var calories) async {}

  Future updateTomorrowWaterLog(int ml, int remaining, var time) async {
    for (int i = 1; i < 8; i++)
      return await Firestore.instance
          .collection(uid)
          .document('userData')
          .collection(DateTime.now().add(Duration(days: i)).day.toString() +
              DateTime.now().month.toString() +
              DateTime.now().year.toString())
          .document('WaterConsumed')
          .collection('WaterLog')
          .document('$time')
          .setData({'Quantity': ml, 'RemainingQty': remaining}, merge: false);
  }

  Future updateYesterdayWaterLog(int ml, int remaining, var time) async {
    for (int i = 1; i < 8; i++)
      await Firestore.instance
          .collection(uid)
          .document('userData')
          .collection(
              DateTime.now().subtract(Duration(days: i)).day.toString() +
                  DateTime.now().month.toString() +
                  DateTime.now().year.toString())
          .document('WaterConsumed')
          .collection('WaterLog')
          .document('$time')
          .setData({'Quantity': ml, 'RemainingQty': remaining}, merge: false);
  }

  Future updateYesterDayCalorieIntake(double cal) async {
    for (int i = 1; i < 8; i++)
      await Firestore.instance
          .collection(uid)
          .document('userData')
          .collection(
              DateTime.now().subtract(Duration(days: i)).day.toString() +
                  DateTime.now().month.toString() +
                  DateTime.now().year.toString())
          .document('FoodConsumed')
          .setData({'consumedCalories': cal});
  }

  Future updateYesterDayWaterIntake(int ml) async {
    for (int i = 0; i < 8; i++)
      await Firestore.instance
          .collection(uid)
          .document('userData')
          .collection(
              DateTime.now().subtract(Duration(days: i)).day.toString() +
                  DateTime.now().month.toString() +
                  DateTime.now().year.toString())
          .document('WaterConsumed')
          .setData({'consumedQuantity': ml});
  }

  Future updateWaterIntake(int ml) async {
    updateNextDayWaterIntake(0);

    return await Firestore.instance
        .collection(uid)
        .document('userData')
        .collection('$today')
        .document('WaterConsumed')
        .setData({'consumedQuantity': ml});
  }

  Future updateCalorieIntake(
      double cal, double protein, double fat, double carbs) async {
    updateNextDayCalorieIntake(0);

    return await Firestore.instance
        .collection(uid)
        .document('userData')
        .collection('$today')
        .document('FoodConsumed')
        .setData({
      'consumedCalories': cal,
      'dailyProtein': protein,
      'dailyFat': fat,
      'dailyCarbs': carbs
    });
  }

  Future updateNextDayCalorieIntake(double cal) async {
    for (int i = 1; i < 8; i++)
      return await Firestore.instance
          .collection(uid)
          .document('userData')
          .collection(DateTime.now().add(Duration(days: i)).day.toString() +
              DateTime.now().month.toString() +
              DateTime.now().year.toString())
          .document('FoodConsumed')
          .setData({'consumedCalories': cal});
  }

  Future updateNextDayWaterIntake(int ml) async {
    for (int i = 1; i < 8; i++)
      return await Firestore.instance
          .collection(uid)
          .document('userData')
          .collection(DateTime.now().add(Duration(days: i)).day.toString() +
              DateTime.now().month.toString() +
              DateTime.now().year.toString())
          .document('WaterConsumed')
          .setData({'consumedQuantity': ml});
  }

  Future updatetargetData(
    int dailycal,
    double goalBMI,
    String weeklyGain,
  ) async {
    int DailyWater = 3000;
    updateWaterIntake(0);

    updateYesterdayWaterLog(0, 0, 0);
    updateYesterDayWaterIntake(0);
    updateYesterDayCalorieIntake(0);

    WaterLog(0, 0, 0);
    FoodLog('0', 0, '0', 0);
    updateCalorieIntake(0, 0, 0, 0);

    return await Firestore.instance.collection(uid).document('target').setData({
      'DailyCal': dailycal,
      'goalBMI': goalBMI,
      'weeklyGain': weeklyGain,
      'DailyWater': DailyWater
    });
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
