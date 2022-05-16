import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/car_controller.dart';
import 'package:smartgas/models/cars.dart';
import 'package:smartgas/services/database.dart';

class NewVehicle extends StatefulWidget {
  @override
  State<NewVehicle> createState() => _NewVehicleState();
}

class _NewVehicleState extends State<NewVehicle> {
  Color color = Colors.black;
  TextEditingController carController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController driverController = TextEditingController();
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 1],
              colors: [
                Colors.white,
                Color.fromARGB(144, 3, 54, 102),
              ],
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'Add New Vehicle',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                indent: 70,
                endIndent: 70,
                thickness: 1.3,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextField(
                  controller: carController,
                  decoration: InputDecoration(
                    labelText: 'Car',
                    labelStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextField(
                  controller: modelController,
                  decoration: InputDecoration(
                    labelText: 'Model',
                    labelStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextField(
                  controller: licenseController,
                  decoration: InputDecoration(
                    labelText: 'License Plate',
                    labelStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextField(
                  controller: driverController,
                  decoration: InputDecoration(
                    labelText: 'Drivers License Number',
                    labelStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      width: 25,
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () => pickColor(context),
                        child: null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(color),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      uploadCar();

                      Get.back();
                    },
                    child: const Text('Add Vehicle'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[900]),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColorPicker() => BlockPicker(
        pickerColor: color,
        availableColors: [
          Colors.yellow,
          Colors.orange,
          Colors.deepOrangeAccent,
          Colors.red,
          Colors.pink,
          Colors.purple,
          Colors.lightGreen,
          Colors.green,
          Colors.teal,
          Colors.cyan,
          Colors.blue,
          Colors.indigo,
          Colors.black,
          Colors.white,
          Colors.grey,
          Colors.brown,
        ],
        onColorChanged: (color) => setState(() => this.color = color),
      );

  void pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Pick Your Color'),
          insetPadding: EdgeInsets.symmetric(vertical: 70),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPicker(),
              TextButton(
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          ),
        ),
      );

  void uploadCar() async {
    try {
      print(carController.text +
          " " +
          modelController.text +
          " " +
          licenseController.text +
          " " +
          driverController.text +
          " " +
          color.value.toString());
      CarModel car = CarModel(
          car: carController.text,
          model: modelController.text,
          licensePlate: licenseController.text,
          driversLicense: driverController.text,
          color: color.value);
      if (car != null) {
        await Database().addCar(car);
        // Get.find<CarController>().car = car;
      }
    } catch (e) {
      Get.snackbar(
        "About Car",
        "User message",
        backgroundColor: Color(0xFFECCB45),
        titleText: Text(
          "Car creation failed",
          style: TextStyle(color: Colors.black),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
    }
  }
}
