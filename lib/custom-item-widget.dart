import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  final String name;
  final String desc;
  final String qty;
  final String len;
  final String width;
  final String height;


  const CustomItem({
    Key? key,
    required this.name, required this.desc, required this.qty, required this.len, required this.width,
    required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          Text(
            desc,
          ),
          Text(
            'L:${len}ft  W:${width}ft   H:${height}ft',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              height: 1.4
            ),
          ),
          Divider(
            thickness: 4,
            height: 10,
          )
        ],
      ),
    );
  }
}
