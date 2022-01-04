import 'package:xml_parsing/src/model/ev.dart';
import 'package:xml_parsing/src/repository/ev_repository.dart';
import 'package:flutter/material.dart';

class EvProvider extends ChangeNotifier {
  EvRepository _evRepository = EvRepository();

  List<Ev> _evs = []; // 가공이 필요한 데이터
  List<Ev> get evs => _evs; // 외부에서 접근 가능한 데이터

  // EvRepository에 접근하여 데이터를 로드한다.
  loadEvs() async {
    // 전달받은 데이터
    // listEvs를 _evs로 바로 바꿔도 되지만 listEvs의 예외 처리와 추가적인 가공을 위해서 나눠서 작성한다.
    List<Ev>? listEvs = await _evRepository.loadEvs();
    _evs = listEvs!;

    // 데이터가 업데이트 됐으므로 notifyListeners 호출해 구독자에게 알린다.
    notifyListeners();
  }
}
