import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/views/apply_additional_balance/ticket_data.dart';
import 'package:ticket_widget/ticket_widget.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? selectedProffession;
  String? selectedEmergency;

  List<String> professions = [
    'Solider',
    'Doctor',
    'Engineer',
    'Lawyer',
    'Teacher',
  ];
  List<String> emergency = [
    'Corona',
    'Injury',
    'Accident',
    'Life or Death',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
        //backgroundColor: Color(0xf8f6f0ff),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                //SizedBox(width: 10,),
                Text("Apply for Balance",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                //Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz_sharp,
                      size: 30,
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropDownButton("Proffession", professions),
                DropDownButton2("Medical Urgency", emergency),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   color: Colors.white,
            //   width: 350,
            //   height: 500,
            //   child: MyTicketView(),

            Container(
              color: Colors.greenAccent,
              child: TicketWidget(
                width: 350,
                height: 500,
                isCornerRounded: false,
                padding: EdgeInsets.all(20),
                child: TicketData(
                  proffession: selectedProffession ?? "Proffessor",
                  emergency: selectedEmergency ?? "Reach University",
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Apply for Additional Balance",
                    "Hello ${UserController.instance.user.fullName}, Your request has been sent to the admin",
                    backgroundColor: Colors.greenAccent,
                    icon: Icon(Icons.person, color: Colors.teal),
                    snackPosition: SnackPosition.TOP,
                  );
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Apply Now ",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  WidgetSpan(
                    child: Icon(
                      Icons.local_gas_station_outlined,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
                ])),
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow[300],
                    fixedSize: const Size(360, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget DropDownButton(String condition, List criteria) =>
      DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              Icon(
                Icons.list,
                size: 16,
                color: Colors.black,
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  condition,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: criteria
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedProffession,
          onChanged: (value) {
            setState(() {
              selectedProffession = value as String;
            });
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.black,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.greenAccent,
          ),
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 200,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.greenAccent,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      );
  Widget DropDownButton2(String condition, List criteria) =>
      DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              Icon(
                Icons.list,
                size: 16,
                color: Colors.black,
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  condition,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: criteria
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedEmergency,
          onChanged: (value) {
            setState(() {
              selectedEmergency = value as String;
            });
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.black,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.greenAccent,
          ),
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 200,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.greenAccent,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      );
}
