import 'package:flutter/cupertino.dart';

import 'itemsWidget.dart';
import 'models/new-leads.dart';


class ItemsList extends StatefulWidget {

  final List customerEstimates;

  const ItemsList({
    Key? key,  required this.customerEstimates,
  }): super(key: key);
  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {

  late List customerEstimates;
  late List estimateFlows;
  void parseData(){
    estimateFlows = customerEstimates.map((json) => NewLeads.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    customerEstimates = widget.customerEstimates;
    parseData();
  }

  @override
  Widget build(BuildContext context) {
    customerEstimates = widget.customerEstimates;
    parseData();
    return ListView.builder(
      // scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: estimateFlows.length,
        itemBuilder: (BuildContext context, int i) => Item(
          estimate_id: estimateFlows[i].estimate_id,
          moving_from: estimateFlows[i].moving_from,
          moving_to: estimateFlows[i].moving_to,
          property_size: estimateFlows[i].property_size,
          distance: estimateFlows[i].distance,
          moving_on: estimateFlows[i].moving_on,

        )
    );
  }
}
