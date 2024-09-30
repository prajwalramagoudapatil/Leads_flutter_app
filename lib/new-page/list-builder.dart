import 'package:flutter/material.dart';
import 'package:leads_app/main.dart';
import '../models/furnitures.dart';
import 'MyDropDownList.dart';
import 'dart:convert';

class BuildList extends StatefulWidget {
  // final String estimateId;
  final List ItemsList;

  const BuildList({Key? key, required this.ItemsList}) : super(key: key);

  @override
  State<BuildList> createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  late String estimateId;
  late List estimateFlows;
  // late List furnitureItemsList;
  late List itemsListToBuild;
  late Map<String, dynamic> items;
  final ValueNotifier<bool> isVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    itemsListToBuild = widget.ItemsList;
    // setEstimateId();
  }

  // void setEstimateId(){
  //   // estimateId = widget.estimateId;
  //   // items = customerEstimates.map((e) => {
  //   //    if (e['estimate_id'] == estimateId)
  //   //      e['items']['inventory'][0]
  //   // }).toList();
  //
  //   for(var estimate in customerEstimates) {
  //     if (estimate['estimate_id'] == estimateId) {
  //       items = estimate['items']['inventory'][0];
  //     }
  //   }
  //   // Map<String, dynamic> jsonData = jsonDecode(items.toString());// Your JSON data here;
  //   FurnituresList furnituresList = FurnituresList.fromJson(items);
  //   furnitureItemsList = furnituresList.furnitureItems;
  //   // temp = items.keys.runtimeType.toString();
  //   // print('temp: $temp');
  //   for (var item in furnituresList.furnitureItems) {
  //     print('Item: ${item.displayName}, Qty: ${item.qty}, ${item.selectType}, ${item.option}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // setEstimateId();
    itemsListToBuild = widget.ItemsList;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: (){
            setState(() {
              isVisible.value = !isVisible.value;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Furniture',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Icon(
                isVisible.value? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 50,
              ),
            ],
          )
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isVisible,
          builder: (BuildContext context, value, Widget? child) {
            print('ValueNotifier<bool> builder called');
            return MyDropDownList(furnitureList: itemsListToBuild, isVisible: value);
          },
        ),
      ],
    );
  }
}
