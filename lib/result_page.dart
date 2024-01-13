import 'package:bump_lives/main.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget{
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override

  void initState() {
    //songsをクリア
    songs.clear();

    //songsに聞いた曲を追加する
    for(int i=0;i<lives.length;i++)
      for(int j=0;j<lives[i].is_go.length;j++)
          if(lives[i].is_go[j]==true)
            songs.addAll(lives[i].setlist[j]);
    super.initState();

  }

  Widget build(BuildContext context) {
    Map<String, int> frequencyMap = {};

    // カウントを行う
    for (String str in songs) {
      frequencyMap.update(str, (value) => value + 1, ifAbsent: () => 1);
    }
    // 出現回数の降順にソート
    List<MapEntry<String, int>> sortedList = frequencyMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));


    return Scaffold(
      appBar: AppBar(
        title: Text("聞いた曲"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (MapEntry<String, int> entry in sortedList) ...{
                ListTile(title: Text('${entry.key}',style: TextStyle(fontSize: 20),),
                  trailing: Text('${entry.value}回',style: TextStyle(fontSize: 20),),
                ),
              }
      ],
          ),
        ),
      ),
    );
  }
}
