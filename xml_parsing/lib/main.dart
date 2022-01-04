import 'package:xml_parsing/src/provider/ev_provider.dart';
import 'package:flutter/material.dart';
import 'package:xml_parsing/src/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // MultiProvider를 통해 여러가지 Provider를 관리
        home: MultiProvider(
            // ChangeNotifierProvider 변화에 대해 구독
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => EvProvider())
            ],
            child:
                Home() // home.dart // child 하위에 모든 것들은 CountProvider에 접근 할 수 있다.
            ));
  }
}
