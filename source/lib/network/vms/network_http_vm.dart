import 'package:http/http.dart' as http;

class NetworkHttpVM {
  
  // Get 请求测试
  Future<String> getRequest() async {
    final url = "http://a.itying.com/api/productlist";
    final response = await http.get(url);
    return response.body.toString();
  }

  // Post 请求测试
  Future<String> postRequest() async {
    final url = "http://www.26green.cn/degrees26App/rpm/getRPMList";
    final response = await http.post(url, body: {"type": "3"});
    return response.body.toString();
  }

}