import 'package:flutter/material.dart';
import 'package:leads_app/main.dart';

class MyDropDownList extends StatefulWidget {
  final List furnitureList;
  final bool isVisible;


  const MyDropDownList({Key? key, required this.furnitureList, required this.isVisible }) : super(key: key);

  @override
  State<MyDropDownList> createState() => _MyDropDownListState();
}

class _MyDropDownListState extends State<MyDropDownList> {
  late List furnitureList;
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    furnitureList = widget.furnitureList;
    isVisible = widget.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    isVisible = widget.isVisible;

    return Flexible(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: isVisible?  furnitureList.length : 0,
        itemBuilder: (context, index){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(18),
                // color: Colors.red,
                child: getIcon(
                  furnitureList[index].displayName,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      furnitureList[index].displayName,
                      style: TextStyle(
                          fontSize: 28
                      ),
                    ),
                    Text(
                      getString(furnitureList[index].selectType, furnitureList[index].option) ,
                      style: TextStyle(
                        fontSize: 20
                      ),
                      // 'RAAMA SITA',
                      // furnitureList[index].option ?? " " ,
                    )
                  ],
                ),
              ),
              Text(
                furnitureList[index].qty.toString(),
                style: TextStyle(
                    fontSize: 28,
                  letterSpacing: 20,
                ),
              )
            ],
          );
        }),
    );
  }

  getIcon(name) {
      if(name.toLowerCase().contains('sofa')){
        return Icon(Icons.chair);
      }
      if(name.toLowerCase().contains('bed')){
        return Icon(Icons.bed);
      }
      if(name.toLowerCase().contains('dining')){
        return Icon(Icons.dining);
      }
      if(name.toLowerCase().contains('table') || name.toLowerCase().contains('Ottoman') ){
        return Icon(Icons.table_restaurant_outlined);
      }
      return Icon(Icons.chair_sharp);
  }

  getString(value, val){
    if( value == '' ) {
      return val;
    } else if(val == '') {
      return value;
    } else {
      return (val + ' ' + value);
    }
  }

}
