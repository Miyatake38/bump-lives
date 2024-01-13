# BUMP Live 解析君

## はじめに
今までに参戦したBUMPのLiveを選択し，生で聴いた曲とその回数を表示するアプリである． 
本アプリはFlutterを用いて作成した．Flutterは一つのコードでiOS，android，webのプラットフォーム対応できる． READMEの最後にweb版のリンクを掲載している．  
まだまだ勉強中ということもあり，プログラムの書き方が拙い部分もあるが，とりあえずの動作は問題ない（はず）．  

## 仕様
1. インスト曲（aurora arc, 星の鳥）などはカウントしません．  
2. 入場曲もカウントしません．  
3. 海外でのライブ，テレビ（紅白，MUSIC AWARDS）は含めていません．
4. スマホでの使用を想定しています．PCやタブレットでも動作しますが，UIが崩れるためお勧めしません．
5. ライブ名や会場名は解釈性を優勢しており，一部正式名称でないものがあります．
6. セトリはネットを参考に全て手作業で入力しているため，間違いを含む可能性が高いです．結果は参考程度にとどめてください．

## 各ファイルの説明

### main.dart
メインファイル．最初に呼ばれる．mainにウィジェットは配置しておらず，HomePageを呼び出すだけである．  
ただし，mainでグローバル変数としてライブの情報（日程やセトリ）のデータベースを置いている．
jsonやcsvの形式でデータベースを作成し，それらを読み込むべきであるが，プログラミング技術の欠如により，コード内にデータベースが存在する．是非改善されたし．

### home_page.dart
ホーム画面．main.dartから呼ばれる．  
スタートボタンと使い方表示のボタンを配置．    
使い方を表示する画面もこのファイルに入れている．

### live_list_page.dart
参戦歴編集画面．home_page.dartから呼ばれる．  
47行目の以下のコードをコメントアウトすることにより，ライブのロゴ画像を非表示にしている．
個人で使う際にはコメントアウトを外せば良い．
``````dart
leading:Image.asset('assets/'+lives[i].image),
``````

### result_page.dart
結果を表示する画面．live_list_page.dartにおける右上の解析ボタンから呼ばれる．  
聞いた曲の回数を計算し，ソートして表示．

## 終わりに
web版は次のリンクからアクセスできる．→ [BUMP Live 解析くん](https://bump-lives.firebaseapp.com/)  
ソースコード等は自由に改変していただいて結構です．データベース取りも結構です．（正しさの保証はありませんが．）何かしらの成果物を作成された際には，ご一報頂けますと大変嬉しく思います．  
BUMP工学部が活発になることを期待しています．
