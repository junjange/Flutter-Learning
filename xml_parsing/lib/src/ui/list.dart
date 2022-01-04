import 'package:xml_parsing/src/model/ev.dart';
import 'package:xml_parsing/src/provider/ev_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  ListWidget({Key? key}) : super(key: key);

  late EvProvider _evProvider;

  // _makeEvOne => 데이터를 텍스트에 뿌려줌
  Widget _makeEvOne(Ev ev) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 충전소 주소
              Text(
                ev.addr.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),

              // 충전기 타입
              Text(
                ev.chargeTp.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 충전기 명칭
              Text(
                "충전기 명칭 : " + ev.cpNm.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 충전기 상태 코드
              Text(
                ev.cpStat.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 충전 방식
              Text(
                ev.cpTp.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 충전소 명칭
              Text(
                "충전소 명칭 : " + ev.csNm.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 위도
              Text(
                "위도 : " + ev.lat.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 경도
              Text(
                "경도 : " + ev.longi.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ))
      ],
    );
  }

  Widget _makeListView(List<Ev> evs) {
    // 리스트 뷰
    return ListView.separated(
      itemCount: evs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            // _makeEvOne 위젯을 호출해 리스트 뷰에 뿌려준다.
            height: 300,
            color: Colors.white,
            child: _makeEvOne(evs[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Provider를 호출해 접근, listen: false를 통해 Consumer의 builder만 업데이트 되게 한다.
    _evProvider = Provider.of<EvProvider>(context, listen: false);
    _evProvider.loadEvs(); // EvProvider에서 loadEvs를 호출

    return Scaffold(
        appBar: AppBar(
          title: Text("Ev Provider"),
        ),

        // Consumer를 통해 데이터에 접근
        body: Consumer<EvProvider>(builder: (context, provider, wideget) {
          // 데이터가 있다면
          if (provider.evs != null && provider.evs.length > 0) {
            return _makeListView(
                provider.evs); // _makeListView 위젯에 provider.evs(데이터)를 넘긴다.
          }
          // 데이터가 없다면 CircularProgressIndicator 수행(로딩 처리)
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
