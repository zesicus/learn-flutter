import 'package:flutter/material.dart';
import '../vms/storage_files_vm.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StorageFilesPage extends StatefulWidget {
  @override
  _StorageFilesPageState createState() => _StorageFilesPageState();
}

class _StorageFilesPageState extends State<StorageFilesPage> {
  final vm = StorageFilesVM();

  RadioListTile getRadioListTile(int index) {
    return RadioListTile(
      value: vm.radioTitles[index],
      title: Text(vm.radioTitles[index]),
      subtitle: Text(vm.radioDescs[index]),
      groupValue: vm.currentValue,
      onChanged: (value) {
        setState(() {
          vm.currentValue = value;
        });
      },
    );
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File IO')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('File IO Demo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0, color: Theme.of(context).primaryColor)),
          ),
          getRadioListTile(0),
          getRadioListTile(1),
          getRadioListTile(2),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              controller: vm.editingController,
              decoration: InputDecoration(
                  icon: Icon(Icons.text_fields), labelText: '输入存储的文本内容'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: RaisedButton(
              onPressed: () async {
                if (await vm.writeTextIntoFile()) {
                  Fluttertoast.showToast(
                    msg: '写入成功',
                    backgroundColor: Colors.green,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: '写入失败',
                    backgroundColor: Colors.red,
                  );
                }
              },
              child: Text('写入文件信息'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('文件内容：${vm.fileContent}'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: RaisedButton(
              onPressed: () async {
                if (vm.fileContent != null) {
                  await vm.readTextFromFile();
                  setState(() {});
                } else {
                  Fluttertoast.showToast(
                    msg: '文件不存在',
                    backgroundColor: Colors.red,
                  );
                }
              },
              child: Text('读取文件信息'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("这里使用了两个库，1) path_provider 是用来提供目录路径的；2) permission_handler 是用来提示权限的；目前iOS 应该是不需要权限的，Android 测试机不带外置存储，所以最后一个外置存储和第二个库没有测试；demo 仍有 bug，仅学习使用。", style: TextStyle(color: Colors.blueGrey),),
          ),
        ],
      ),
    );
  }
}
