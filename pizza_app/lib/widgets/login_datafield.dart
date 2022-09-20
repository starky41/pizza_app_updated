import 'package:flutter/material.dart';

class LoginDataField extends StatelessWidget {
  final String text;
  final String hinttext;
  final TextEditingController controller;
  LoginDataField(
      {required this.controller, required this.text, required this.hinttext});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(color: Colors.black54)),
        SizedBox(
          height: 5.0,
        ),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            onChanged: (text) {
              print('First text field: $text');
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ],
    );
  }
}
