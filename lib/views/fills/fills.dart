import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/car_controller.dart';
import 'package:smartgas/controllers/fill_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/cars.dart';
import 'package:smartgas/models/fill.dart';

class ShowFills extends StatefulWidget {
  ShowFills({Key? key}) : super(key: key);

  @override
  State<ShowFills> createState() => _ShowFillsState();
}

class _ShowFillsState extends State<ShowFills> {
  late final FirebaseFirestore docCar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Fills"),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.list),
        //     onPressed: () {},
        //   )
        // ],
      ),
      body: Column(
        children: [
          GetX<FillController>(
              init: Get.find<FillController>(),
              builder: (FillController carController) {
                if (carController != null && carController.todos != null) {
                  carController.todos
                      .sort((a, b) => a.date.seconds.compareTo(b.date.seconds));
                  return Expanded(
                    child: ListView.builder(
                      itemCount: carController.todos.length,
                      itemBuilder: (_, index) {
                        return buildCard(UserController.instance.user.id,
                            carController.todos[index]);
                      },
                    ),
                  );
                } else {
                  return Text("loading...");
                }
              }),
        ],
      ),
    );
  }
}

Widget buildCard(String? id, FillModel car) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.amber),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(FontAwesomeIcons.cartShopping, color: Colors.white),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Column(
            children: <Widget>[
              Text(
                "Quantity: ${car.quantity} L",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Date: ${DateTime.fromMillisecondsSinceEpoch(car.date.seconds * 1000)}",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Station : " + car.station,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
