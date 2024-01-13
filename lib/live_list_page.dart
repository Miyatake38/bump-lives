import 'package:flutter/material.dart';

import 'main.dart';
import 'result_page.dart';

class LiveListPage extends StatefulWidget {
  const LiveListPage({super.key});

  @override
  State<LiveListPage> createState() => _LiveListPageState();
}

class _LiveListPageState extends State<LiveListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ライブリスト"),
        backgroundColor: Colors.black,
        actions: [
          SizedBox(
            width:100,
            child: ElevatedButton(
              child: const Text('解析',style: TextStyle(fontSize: 25),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for(int i=0;i<lives.length;i++)
                Card(
                  child: ExpansionTile(
                    title: Text(lives[i].tour_name,style: TextStyle(fontWeight: FontWeight.bold),),
                    // leading:Image.asset('assets/'+lives[i].image), //web公開用は画像なし
                    children: <Widget>[
                      for (int j=0; j<lives[i].live_name.length; j++)
                        ListTile(title: Text(lives[i].live_name[j]),
                          trailing: Checkbox(
                            value: lives[i].is_go[j],
                            onChanged: (bool? value) {
                              setState(() {
                                lives[i].is_go[j] = value ?? false;
                              });
                            },
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
