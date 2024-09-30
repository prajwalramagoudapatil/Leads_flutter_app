import 'package:flutter/material.dart';
import 'bottom-navigation-bar.dart';
import 'package:http/http.dart' as http;
import 'models/new-leads.dart';
import 'dart:convert';
import 'build-items.dart';

late List<dynamic> customerEstimates;
const apiURL = 'http://test.api.boxigo.in/sample-data/';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<NewLeads> estimateFlows;
  late int selectedIdx = 0;
  bool isLoading = true;

  Widget fun(int idx) {
    if(isLoading){
      return CircularProgressIndicator();
    } else {
      switch (idx) {
        case 1:
          return ItemsList(
            customerEstimates: customerEstimates,
          );
        default:
          return const DefaultWidget();
      }
    }
  }
  void updateData(int data) {
    setState(() {
      print('in parent selectedIdx: $selectedIdx');
      selectedIdx = data;
    });
  }

  void fetchData() async {
    final response = await http
        .get(Uri.parse('http://test.api.boxigo.in/sample-data/'));
    if (response.statusCode == 200) {
      print('successfully fetched data');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      customerEstimates = await jsonData['Customer_Estimate_Flow'];
      estimateFlows = await customerEstimates.map((json) => NewLeads.fromJson(json)).toList();
      NewLeads firstFlow = estimateFlows.first;
      setState(() {
        isLoading = false;
      });
      int count = estimateFlows.length;
      String id = firstFlow.estimate_id;
      print('List:  $id, count: $count');
    } else {
      print('Unsuccessful to fetched data');
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text('AppBar'),
        leading:
            const Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          HorizontalList(
            onDataChanged: updateData,
          ),
          Expanded(
            child: fun(selectedIdx)
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarExample(),
    );
  }
}


class HorizontalList extends StatefulWidget {
  HorizontalList({Key? key, required this.onDataChanged}) : super(key: key);

  final List<String> list= ['All', 'New', 'Follow up', 'Booked', 'More', 'Options'];
  final Function(int) onDataChanged;

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {

  int selectedIndex = 0;
  late Function(int) onDataChanged;

  @override
  void initState() {
    super.initState();
    onDataChanged = widget.onDataChanged;
  }

  @override
  Widget build(BuildContext context) {
    onDataChanged = widget.onDataChanged;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.list.length ,
        itemBuilder: (BuildContext context, int index)=>
              TextButton(
                  onPressed: ()=>{
                    setState((){
                      selectedIndex = index;
                      print('in Horizontal List wdget idx: $selectedIndex');
                      onDataChanged(index);
                    }),

                  },
                  style: TextButton.styleFrom(
                  ),
                  child: Text(
                      widget.list[index],
                      style: TextStyle(
                        color: (index == selectedIndex)? Colors.redAccent : Colors.black,
                      ),
                  ),
              ),
      ),
    );
  }
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Icon(
        Icons.tag_faces_outlined,
        size: 100,
      ),
    );
  }
}



// void accessChildData() {
//   final childState = childKey.currentState;
//   if (childState != null) {
//     print(childState.selectedIndex); // Access child property
//     setState(()=> {
//       selectedIdx = childState.selectedIndex
//
//     });
//   }
// }

// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => const NewScreen()),
// )