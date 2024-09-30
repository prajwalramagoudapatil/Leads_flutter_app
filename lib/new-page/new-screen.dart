import 'package:flutter/material.dart';
import '../models/furnitures.dart';
import '/bottom-navigation-bar.dart';
import 'list-builder.dart';
import '../main.dart';
import '../models/custom-items.dart';
import 'package:leads_app/custom-item-widget.dart';

class NewScreen extends StatelessWidget {
  final String estimateId;

  const NewScreen({Key? key, required this.estimateId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon( Icons.arrow_back_ios_new_rounded)
        ),
        title: Text( 'New Leads' ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],  //actions
      ),
      body: NewScreenBody(estimateId: estimateId,),
      bottomNavigationBar: const BottomNavigationBarExample(),
    );
  }
}

// BODY
class NewScreenBody extends StatefulWidget {
  final String estimateId;

  const NewScreenBody({Key? key, required this.estimateId}) : super(key: key);

  @override
  State<NewScreenBody> createState() => _NewScreenBodyState();
}

class _NewScreenBodyState extends State<NewScreenBody> {
  late String estimateId;
  late List furnitureItemsList;
  late List customItemList;
  final ValueNotifier<bool> isVisible = ValueNotifier<bool>(false);


  void getData(){
    estimateId = widget.estimateId;
    late Map<String, dynamic> furnitureItems;
    late Map<String, dynamic> customItemsMap;

    for(var estimate in customerEstimates) {
      if (estimate['estimate_id'] == estimateId) {
        furnitureItems = estimate['items']['inventory'][0];
        customItemsMap = estimate['items']['customItems'];
      }
    }
    FurnituresList furnituresList = FurnituresList.fromJson(furnitureItems);
    CustomItemsList customItemsList = CustomItemsList.fromJson(customItemsMap);

    customItemList = customItemsList.customItems;
    print('  ****  Custom Items:>>>>>');
    for(var item in customItemsList.customItems){
      print('custom name: ${item.name} Qty: ${item.quantity} ' );
    }

    furnitureItemsList = furnituresList.furnitureItems;
    // temp = items.keys.runtimeType.toString();
    // print('temp: $temp');
    for (var item in furnituresList.furnitureItems) {
      print('Item: ${item.displayName}, Qty: ${item.qty}, ${item.selectType}, ${item.option}');
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          // Text('RAAMA SITA'),
           BuildList(
                ItemsList: furnitureItemsList,
           ),
          Column(
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
                        'Custom Items',
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
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:  isVisible.value? customItemList.length : 0,
                      itemBuilder: (context, index) {
                        return CustomItem(
                            name: customItemList[index].name,
                            desc: customItemList[index].description,
                            qty: customItemList[index].quantity,
                            len: customItemList[index].length,
                            width: customItemList[index].width,
                            height: customItemList[index].height
                        );
                      }
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

