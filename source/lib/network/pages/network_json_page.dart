import 'package:flutter/material.dart';
import '../vms/network_json_vm.dart';

class NetworkJsonPage extends StatelessWidget {
  final vm = NetworkJsonVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "原 JSON 数据：\n"
          "${vm.jsonString}\n\n"
          
          "数据转化为 Map，格式化结构：\n"
          "姓名：${vm.jsonDecodeMap["name"]}\n"
          "年龄：${vm.jsonDecodeMap["age"]}\n\n"
          
          "将 Map 数据转化为 Json 字符串：\n"
          "${vm.mapEncodeJson}\n\n"
          
          "转化请参考 NetworkJsonVM"),
      ),
    );
  }
}
