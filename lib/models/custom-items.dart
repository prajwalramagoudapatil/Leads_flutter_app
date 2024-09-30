
import 'package:flutter/foundation.dart';

class CustomItems{
  final String name;
  final String description;
  final String quantity;
  final String length;
  final String width;
  final String height;

  CustomItems({
  required this.name, required this.description, required this.quantity,
    required this.length, required this.width, required this.height,
  });

  factory CustomItems.fromJson (Map<String, dynamic > json)  {

    return CustomItems(
          name: json['name'] ?? '',
          description: json['description'] ?? '',
          quantity: json['quantity'] ?? '',
          length: json['length'] ?? '',
          width: json['width'] ?? '',
          height: json['height'] ?? '',
    );
  }

}

class CustomItemsList{
    final List<CustomItems> customItems;

    CustomItemsList({required this.customItems});

    factory CustomItemsList.fromJson(Map<String, dynamic> json) {
        List<CustomItems> items = [];
        Map<String, dynamic> itemMap = {};
        // print('bef IF:');
        if(json.containsKey('items')) {
          // print('in IF');
          for (var item in json['items']) {
            print('in FOR Custom Item ${item}');
              itemMap['name']= item['item_name'] ?? '';
              itemMap['description']= item['item_description'] ?? '';
              itemMap['quantity']= item['item_qty'] ?? '';
              itemMap['length']= item['item_length'] ?? '';
              itemMap['width']= item['item_width'] ?? '';
              itemMap['height']= item['item_height'] ?? '';
              print('Map: ${itemMap}');
              items.add(CustomItems.fromJson(itemMap));
          }
        }

        return CustomItemsList(customItems: items);
    }

}
