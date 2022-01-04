import 'dart:async';

// 비즈니스 로직 분리
class CountBloc {
  int _count = 0;

  // StreamController을 통해 여러 이벤트를 처리
  final StreamController _countSubject = StreamController.broadcast();

  // count는 _countSubject.stream 을 구독하고 있는 모든 위젯에게 변경된 상태를 알림
  Stream get count => _countSubject.stream;

  // count 덧셈 이벤트 처리
  add() {
    _count++;
    _countSubject.sink.add(_count); // _countSubject.sink 에다가 _count를 넣어준다.
  }

  // count 뺄셈 이벤트 처리
  remove() {
    _count--;
    _countSubject.sink.add(_count); // _countSubject.sink 에다가 _count를 넣어준다.
  }

  // _countSubject을 종료
  dispose() {
    _countSubject.close();
  }
}
