import 'package:changenotifier_provider/src/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:changenotifier_provider/src/ui/count_home_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {

    // Provider를 호출해 접근, listen: false를 통해 구독된 모든 위젯들에게 알림을 보내지 않게 한다.
    _countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(

      appBar: AppBar(
        title: Text("Provider Sample"),
      ),
      body: CountHomeWidget(), // count_home_widget.dart
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        IconButton(
          icon: Icon(Icons.add), 
        onPressed: () {
          _countProvider.add(); // 클릭 되었을 때 add()
        },),
        IconButton(icon: Icon(Icons.remove), 
        onPressed: () {
          _countProvider.remove(); // 클릭 되었을 때 remove()
        },)
        

      ],),
      
    );
  }
}