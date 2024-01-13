import 'package:bump_lives/live_list_page.dart';
import 'package:bump_lives/result_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUMP Live 解析君'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            // Image.asset('assets/emblem.jpg'),//エンブレム
            SizedBox(
                width: 250,
                child: Image.asset('assets/nicole.jpg',)
            ), //web公開用にうちの子
            SizedBox(
              width: 250,
              child: ElevatedButton(
                child: const Text('解析を始める',style: TextStyle(fontSize: 25),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LiveListPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                child: const Text('使い方',style: TextStyle(fontSize: 25),),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text("使い方",style: TextStyle(fontSize: 25),),
                                Align(alignment:Alignment.centerLeft,child: Text("1. 解析を始めるボタンを押す",style: TextStyle(fontSize: 25))),
                                SizedBox(height:300,child: Image.asset('assets/home.jpg')),
                                Align(alignment:Alignment.centerLeft,child: Text("2. 行ったライブにチェックを入れる",style: TextStyle(fontSize: 25))),
                                Align(alignment:Alignment.centerLeft,child: Text("3. 右上の解析ボタンを押す",style: TextStyle(fontSize: 25))),
                                SizedBox(height:300,child: Image.asset('assets/list.jpg')),
                              ],
                            )
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            Text("version 1.0  Created by Aoi",style: TextStyle(fontSize: 10),),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
