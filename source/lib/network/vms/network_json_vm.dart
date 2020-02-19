import 'dart:convert';

class NetworkJsonVM {
  final jsonString = '{"name": "张三", "age": 20}';
  Map jsonDecodeMap;
  String mapEncodeJson;

  NetworkJsonVM() {
    jsonDecodeMap = json.decode(jsonString);
    mapEncodeJson = json.encode(jsonDecodeMap);
  }
}