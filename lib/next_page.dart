// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  NextPage(this._text, {Key? key}) : super(key: key);
  // 入力されたテキストをデータとして持つ
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Next Page'),
        ),
        body: Container(
          // 余白を付ける
          padding: EdgeInsets.all(30),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // テキスト入力
              TextField(
                controller: TextEditingController(text: _text),
                onChanged: (String value) {
                  _text = value;
                },
              ),
              const SizedBox(height: 8),

              Container(
                // 横幅いっぱいに広げる
                width: double.infinity,
                // リスト追加ボタン
                child: ElevatedButton(
                  onPressed: () {
                    // pop 前の画面に遷移
                    // 前の画面に値を渡す
                    Navigator.of(context).pop(_text);
                    print(_text);
                  },
                  child: Text('追加', style: TextStyle(color: Colors.white)),
                ),
              ),

              const SizedBox(height: 8),
              Container(
                // 横幅いっぱいに広げる
                width: double.infinity,
                // キャンセルボタン
                child: TextButton(
                  // ボタンをクリックした時の処理
                  onPressed: () {
                    // "pop"で前の画面に戻る
                    Navigator.of(context).pop();
                  },
                  child: Text('キャンセル'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
