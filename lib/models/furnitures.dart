import 'dart:convert';
import 'dart:core';

class Furniture{
  final String id;
  final String displayName;
  final String name;
  final List items;
  // final int itemsCount;

  Furniture( {
    required this.id,
    required this.displayName,
    required this.name,
    required this.items,
  });

  factory Furniture.fromJson(Map<String, dynamic> json) {
    return Furniture(
      id: json['id'],
      name: json['name'],
      displayName: json['displayName'],
      items: json['items'],
    );
  }
}

// real
class FurnitureItem {
  String selectType;
  String displayName;
  int qty;
  String option;

  FurnitureItem({
    required this.displayName,
    required this.qty,
    required this.selectType,
    required this.option,
  });

  factory FurnitureItem.fromJson(Map<String, dynamic> json) {
    return FurnitureItem(
      displayName: json['displayName'] ?? '',
      qty: json['qty'] ?? 0,
      selectType: json['selectType'] ?? '',
      option: json['option'] ?? '',

    );
  }
}

class FurnituresList {
  List<FurnitureItem> furnitureItems;

  FurnituresList({required this.furnitureItems});

  factory FurnituresList.fromJson(Map<String, dynamic> json) {
    List<FurnitureItem> items = [];
    Map<String, dynamic> itemMap={};


    if (json.containsKey('category')) {
      for (var category in json['category']) {
        if (category.containsKey('items')) {
          for (var item in category['items']) {
            int qty = item['qty'] ?? 0;
            if (qty > 0) {
              itemMap['displayName'] = item['displayName'];
              itemMap['qty'] = item['qty'];
              if( item.containsKey('meta') && item['meta'].containsKey('selectType') ) {
                String type = item['meta']['selectType'] ?? '';
                itemMap['selectType'] = type != 'none' ? type : '' ;
              }
              if( item.containsKey('type') ) {
                for(var type in item['type']) {
                  if( type.containsKey('selected') && type['selected'] == true){
                    String option = type['option'] ?? '';
                    itemMap['option'] = option;
                  }
                }
              }

              items.add(FurnitureItem.fromJson(itemMap));
            }
          }
        }
      }
    }

    return FurnituresList(furnitureItems: items);
  }
}