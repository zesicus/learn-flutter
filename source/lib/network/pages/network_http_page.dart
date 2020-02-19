import 'package:flutter/material.dart';
import '../vms/network_http_vm.dart';

class NetworkHttpPage extends StatefulWidget {
  NetworkHttpPage({Key key}) : super(key: key);

  @override
  _NetworkHttpPageState createState() => _NetworkHttpPageState();
}

class _NetworkHttpPageState extends State<NetworkHttpPage> {
  final vm = NetworkHttpVM();
  String _getResult = "";
  String _postResult = "";

  _getRequest() async {
    _getResult = await vm.getRequest();
    setState(() {});
  }

  _postRequest() async {
    _postResult = await vm.postRequest();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Http"),
            bottom: TabBar(
              tabs: [
                Tab(text: "Get"),
                Tab(text: "Post"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              // Get
              Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Text(_getResult),
                    Center(
                      child: RaisedButton(
                        child: Text("get"),
                        onPressed: _getRequest,
                      ),
                    ),
                  ],
                ),
              ),

              // Post
              Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Text(_postResult),
                    Center(
                      child: RaisedButton(
                        child: Text("Post"),
                        onPressed: _postRequest,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
