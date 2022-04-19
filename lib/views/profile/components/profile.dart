import 'package:flutter/material.dart';

import '../edit_profile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 0, 20),
          child: Container(
            width: 90,
            height: 90,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Image(
              image: AssetImage('assets/images/download.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Elon Musk',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Senior Designer',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));
            },
            icon: const Icon(
              Icons.edit,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
