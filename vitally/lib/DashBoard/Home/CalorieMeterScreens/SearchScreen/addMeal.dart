import 'package:flutter/material.dart';
import 'package:vitally/DashBoard/Home/CalorieMeterScreens/SearchScreen/searchBar.dart';
import 'package:vitally/constants.dart';
import 'package:vitally/DashBoard/DashBoardLanding.dart';
import 'mealsList.dart';

class AddMealPage extends StatefulWidget {
  AddMealPage({@required this.uid, @required this.caloriesConsumed});

  final int caloriesConsumed;
  final String uid;

  @override
  _AddMealPageState createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: uiBlue,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        backgroundColor: uiBlue,
        title: Text(
          'Today',
          style: searchbartoday,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SearchBar(
            uid: widget.uid,
            CaloriesConsumed: widget.caloriesConsumed,
          ),
          AddMealList(
            uid: widget.uid,
          ),
        ],
      ),
    );
  }
}
