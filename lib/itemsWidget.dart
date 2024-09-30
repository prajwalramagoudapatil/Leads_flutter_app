import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'new-page/new-screen.dart';

class Item extends StatelessWidget {
  final String estimate_id;
  final String moving_from;
  final String moving_to;
  final String property_size;
  final String distance;
  final String moving_on;

  String getTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    String time = "${dateTime.hour} : ${dateTime.minute}";

    // Print the results
    return time.toString();
  }

  String getDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    int day = dateTime.day;

    // Print the results
    return day.toString();
  }

  String getMonth(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    int month = dateTime.month;
    const List<String> monthNames = [
      'Jan', // January
      'Feb', // February
      'Mar', // March
      'Apr', // April
      'May', // May
      'Jun', // June
      'Jul', // July
      'Aug', // August
      'Sep', // September
      'Oct', // October
      'Nov', // November
      'Dec' // December
    ];

    return monthNames[
        month - 1]; // Month is 1-based, so subtract 1 for zero-based index
  }

  const Item(
      {Key? key,
      required this.estimate_id,
      required this.moving_from,
      required this.moving_to,
      required this.property_size,
      required this.distance,
      required this.moving_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        // First part with a flex of 1
        Expanded(
          flex: 1,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
            ),
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  getMonth(moving_on),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  getDate(moving_on),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                  ),
                  softWrap: true,
                ),
                Text(
                  getTime(moving_on),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            margin: EdgeInsets.all(10),
            // color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Bangalore',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        height: 1.25,
                      ),
                    ),
                    Text(
                      estimate_id,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        height: 1.25,
                      ),
                    )
                  ],
                ),
                Text(
                  moving_from,
                  style: TextStyle(
                    height: 1.25,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_downward_rounded, color: Colors.red, size: 30),
                    Column(
                      children:  <Widget>[
                        Icon(Icons.home, color: Colors.red, size: 30),
                        Text(
                          property_size,
                        )
                      ],
                    ),
                    Column(
                      children:  <Widget>[
                        Icon(Icons.insert_chart_rounded, color: Colors.red, size: 30),
                        Text('Favorite')
                      ],
                    ),
                    Column(
                      children:  <Widget>[
                        Icon(Icons.mode_of_travel, color: Colors.red, size: 30),
                        Text(
                            distance
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                    'Bangalore',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.5,
                  ),
                ),
                Text(
                  moving_to,
                  style: TextStyle(
                    height: 1.45,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: ( ){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewScreen(estimateId: estimate_id,)),
                          );
                        },
                        child: Text('View Details'),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text('Submit Quote'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}

// child: Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// Container(
// constraints: BoxConstraints(
// minWidth: 60,
// ),
// child: Column(
// // mainAxisSize: MainAxisSize.min,
// children: [
// Text(
// getMonth(moving_on),
// ),
// Text(
// getDate(moving_on),
// softWrap: true,
// ),
// Text(
// getTime(moving_on),
// )
// ],
// ),
// ),
// Flexible(
// child: Container(
// color: Colors.blue,
// constraints: BoxConstraints(
// minWidth: double.infinity
// ),
// child: Column(
// // mainAxisSize: MainAxisSize.min,
// children: [
// Container(
// width: MediaQuery.of(context).size.width-90,
// child: Row(
// // mainAxisSize: MainAxisSize.min,
// children: [
// Text(
// // 'address',
// moving_from,
// softWrap: true,
// )
// ],
// ),
// )
// ],
// ),
// ),
// )
//
// ],
