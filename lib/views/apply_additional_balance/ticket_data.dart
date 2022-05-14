import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketData extends StatelessWidget {
  const TicketData(
      {Key? key, required this.proffession, required this.emergency})
      : super(key: key);
  final String proffession;
  final String emergency;

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 25.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: const Center(
                child: Text(
                  'SMART GAS.INC',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Row(
              children: const [
                Text(
                  'BAU',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.local_gas_station,
                    color: Colors.pink,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'MNGLS',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Additional Balance Ticket',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ticketDetailsWidget('Customer', 'Mingles', 'Date',
                  date.toString().replaceAll("00:00:00.000", "")),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 52.0),
                child: ticketDetailsWidget(
                    'Proffession', proffession, 'Dispenser', '3'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                child: ticketDetailsWidget(
                    'Emergency', emergency, 'Service', 'Immediate'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
          child: Container(
            width: 250.0,
            height: 60.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Barcode.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
          child: Center(
            child: Text(
              '+961 ${UserController.instance.user.phoneNumber}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
