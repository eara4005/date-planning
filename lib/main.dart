// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_sample_app/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String name;
  late String hobby;
  // dateリストの値
  List<String> dateList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Planning'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "デートコースを作成する",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            MaterialButton(
              onPressed: () async {
                final newListText = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    // 遷移先の画面としてリスト追加画面を指定
                    return NextPage('');
                  }),
                );
                if (newListText != null) {
                  // キャンセルした場合は newListText が null となるので注意
                  setState(() {
                    // リスト追加
                    dateList.add(newListText);
                  });
                }
              },
              // 背景を写真に置き換える
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // 角を丸くする
                child: Image.network(
                  'https://cdn.jouer-style.jp/images/production/imgs/images/000/227/581/original.jpg?1582853785',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "作成したデートコース",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // column内にlistViewを追加する
            // https://rayt-log.com/%E3%80%90flutter%E3%80%91column%E3%81%AE%E4%B8%AD%E3%81%A7listview-builder%E3%82%92%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95/#toc2
            Flexible(
              child: ListView.builder(
                itemCount: dateList.length,
                itemBuilder: (context, index) {
                  // リストをスワイプして削除
                  // https://www.choge-blog.com/programming/flutterlistview-swipe-remove/#toc1
                  return Dismissible(
                    key: UniqueKey(),
                    child: Card(
                      child: ListTile(
                        title: Text(dateList[index]),
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        dateList.removeAt(index);
                      });
                    },
                    background: Container(
                      color: Colors.red,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
