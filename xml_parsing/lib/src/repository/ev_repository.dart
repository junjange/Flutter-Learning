import 'dart:convert' as convert;
import 'package:xml_parsing/src/model/ev.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

// api 서버를 호출해 데이터를 받아온다.
class EvRepository {
  // 자신의 apiKey
  var apiKey =
      "Pbf3CrVpW1Tu8fCFGfn7kmJZ%2FelaNXNA8wbegwrgXMtpboJYYQGP3Fl0DuodrxfWXmlUsuhHJ4G%2BPrPdnRG9CA%3D%3D";

  // 비동기를 통해 수행
  Future<List<Ev>?> loadEvs() async {
    var addr = "서울";

    // 공공데이터 url
    String baseUrl =
        "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?addr=$addr&pageNo=1&numOfRows=10&ServiceKey=$apiKey";

    // url parsing
    final response = await http.get(Uri.parse(baseUrl));

    // 정상적으로 데이터를 불러왔다면
    if (response.statusCode == 200) {
      // 데이터 가져오기
      final body = convert.utf8.decode(response.bodyBytes);

      // xml => json으로 변환
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      // 필요한 데이터 찾기
      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonEv = jsonResult['response']['body']['items'];

      // 필요한 데이터 그룹이 있다면
      if (jsonEv['item'] != null) {
        List<dynamic> list = jsonEv['item'];

        // list에 있는 데이터를 map을 통해 Ev값으로 => Ev.fromJson(item)에 전달한다.
        return list.map<Ev>((item) => Ev.fromJson(item)).toList();
      }
    }
  }
}
