import 'package:vitally/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMealList extends StatefulWidget {
  AddMealList({@required this.uid});

  final String uid;

  @override
  _AddMealListState createState() => _AddMealListState();
}

class _AddMealListState extends State<AddMealList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> Meals = [];

    List<Widget> Meals2 = [
      Container(
        height: height / 1.5,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/search.png'),
            Text(
              "You haven't added any meals",
              style: emptylist1,
            ),
            SizedBox(height: 10),
            Text(
              "Search for meals and add ",
              style: emptyllist2,
            ),
            Text(
              "them inorder to track",
              style: emptyllist2,
            ),
          ],
        )),
      ),
    ];
    String today = DateTime.now().day.toString() +
        DateTime.now().month.toString() +
        DateTime.now().year.toString();
    int length = 0;
    getlength() async {
      await Firestore.instance
          .collection(widget.uid)
          .document('userData')
          .collection('$today')
          .document('FoodConsumed')
          .collection('FoodLog')
          .getDocuments()
          .then((value) => length = value.documents.length);
    }

    return Expanded(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            topLeft: Radius.circular(35),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(10),
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection(widget.uid)
                  .document('userData')
                  .collection('$today')
                  .document('FoodConsumed')
                  .collection('FoodLog')
                  .snapshots(),
              builder: (context, snapshot) {
                startFunction() {
                  getlength();
                  if (length != null)
                    for (int i = 0; i < length; i++) {
                      {
                        Meals.add(MealListTile(
                            uid: widget.uid,
                            calories: snapshot.data.documents[i]['calories'],
                            foodname: snapshot.data.documents[i].documentID
                                .toString(),
                            qty: snapshot.data.documents[i]['qty'],
                            imageurl: snapshot.data.documents[i]['imageURL']));
                      }
                    }
                }

                startFunction();
                List<Widget> Meals3 = [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Consumed Meals",
                          style: nonemptylist1,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              startFunction();
                            });
                          },
                          child: Icon(Icons.refresh,
                              color: Colors.grey[500], size: 20),
                        ),
                      ],
                    ),
                  ),
                ];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: Meals.isEmpty ? Meals3 + Meals2 : Meals3 + Meals,
                );
              }),
        ),
      ),
    );
  }
}

class MealListTile extends StatelessWidget {
  MealListTile(
      {@required this.uid,
      @required this.calories,
      @required this.foodname,
      @required this.qty,
      @required this.imageurl});

  final String uid;
  final dynamic calories;
  final dynamic foodname;
  final dynamic qty;
  final dynamic imageurl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                          width: 80,
                          height: 60,
                          child: imageurl == null
                              ? Text('')
                              : Image.network(imageurl)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          foodname.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Quantity: ' + qty.toString(),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      calories.toString(),
                      style: TextStyle(
                          color: uiGreen,
                          fontFamily: 'Montserrat',
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'kCal',
                      style: TextStyle(
                          color: uiGreen,
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
