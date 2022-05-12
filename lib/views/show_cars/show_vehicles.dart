import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/car_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/cars.dart';

class ShowVehicles extends StatefulWidget {
  ShowVehicles({Key? key}) : super(key: key);

  @override
  State<ShowVehicles> createState() => _ShowVehiclesState();
}

class _ShowVehiclesState extends State<ShowVehicles> {
  late final FirebaseFirestore docCar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("CARS"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          GetX<CarController>(
              init: Get.put<CarController>(CarController()),
              builder: (CarController carController) {
                if (carController != null && carController.todos != null) {
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

Widget buildCard(String? id, CarModel car) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color(car.color!)),
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(FontAwesomeIcons.car, color: Colors.white),
            ),
            title: Text(
              car.car,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Text(
                  "Plate: ${car.licensePlate}",
                  style: TextStyle(color: Colors.greenAccent),
                ),
                SizedBox(
                  width: 30,
                ),
                Text("Model: ${car.model}",
                    style: TextStyle(color: Colors.white))
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.white,
              iconSize: 30.0,
              onPressed: () => {
                FirebaseFirestore.instance.collection('users').doc(UserController.instance.user.id).collection('cars').doc(car.carId).delete(),
              },
            )),
      ),
    );
