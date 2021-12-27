import 'package:bloc_pattern/src/bloc/count_bloc.dart';
import 'package:bloc_pattern/src/components/count_view.dart';
import 'package:flutter/material.dart';

late CountBloc countBloc; // 전역 변수로 CountBloc을 호출하고 late를 통해 나중에 값을 받는다.

class BlocDisplayWidget extends StatefulWidget {
  const BlocDisplayWidget({Key? key}) : super(key: key);

  @override
  _BlocDisplayWidgetState createState() => _BlocDisplayWidgetState();
}

class _BlocDisplayWidgetState extends State<BlocDisplayWidget> {

  // initState() : 위젯이 생성될때 처음으로 호출되는 메서드
  // initState()을 통해 CountBloc()을 생성
  @override
  void initState() {
    super.initState();
    countBloc = CountBloc();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc 패턴"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: CountView(), // Count만을 관리하는 CountView 호출

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
               // countBloc에서 add() 이벤트를 호출
              countBloc.add();
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
               // countBloc에서 remove() 이벤트를 호출
              countBloc.remove();
            },
          )
        ],
      ),
    );
  }
}
