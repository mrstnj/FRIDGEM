# FRIDGEM
家庭用食材管理アプリです。

購入した食材・使った食材を記録することで、

食材の在庫管理、日別の食費記録、レシピ記録としてご活用いただけます。

<img width="1440" alt="トップ" src="https://user-images.githubusercontent.com/119155601/221583204-e93e85d5-c2f6-4bce-888f-b32cf8259817.png">

## URL
https://fridgem2.onrender.com
### テストユーザ
e-mail:hoge@example.com

pass:hogehoge

## 作成背景
食材の物価や、食費の金銭感覚を養うために、一人暮らしをはじめてから日別の食費を記録している。

しかし日別の食費を算出するには、専用のアプリもなく、さらに小数点の計算もはいるので手間な作業だと感じていた。

そこで使用した食材の数量を入力するだけで食費を計算・記録するアプリを開発し、

記録にかける時間を削減しようと考えた。

（運用してからは私だけでなく他の方も利用しております）

# 使用技術
言語 : Ruby (3.1.2)　　

フレームワーク：Ruby on Rails (7.0.4)　　

フロントエンド : HTML&CSS/Bootstrap/JavaScript　　

DB : PostgreSQL　　

インフラ : Render　　

ソースコード管理：GitHub　　

開発環境：Cloud9　　

# 機能一覧
- ユーザ登録
   - ユーザ名
   - メールアドレス
   - パスワード
- ログイン機能
   - ログイン
   - ログアウト
   - 永続cookie
- 在庫食材ページ
   - 購入日・食材名・単価・購入数を登録する機能
   - 一覧表示機能（ページネーションあり）
   - 編集機能
- 消費食材ページ
   - 消費日・消費数・メモを登録する機能(自動入力あり)
   - 一覧表示機能（ページネーションあり）
   - 編集機能
   - 削除機能
   - カレンダー機能
   

# 機能詳細
## トップ
アプリのトップ画面です。主な機能を表示します。
![トップ](https://user-images.githubusercontent.com/119155601/221579433-e66c0329-4697-40bd-b723-df3537a6ba3d.gif)

## ユーザ登録
ユーザ登録するためのページです。
### ユーザ登録ページ
<img width="1440" alt="ユーザ登録" src="https://user-images.githubusercontent.com/119155601/221577216-d6cfc1da-c1c7-43e5-8e72-e1ecbd1dbb7b.png">

## ログイン
ログインするためのページです。
### ログインページ
<img width="1440" alt="ログイン" src="https://user-images.githubusercontent.com/119155601/221577250-1faa80e2-db24-4c32-ae50-11bc2a5d82af.png">

▼ 工夫点
- 永続Cookieを使用しており、二度目以降は自動ログインすることもできます。

## ユーザメニュー
ログイン後のメニュー画面です。
### ユーザメニューページ
<img width="1440" alt="ユーザメニュー" src="https://user-images.githubusercontent.com/119155601/221577105-1193badb-b61f-4d07-b3b5-2611f8d58c37.png">

## 在庫食材ページ
### 在庫食材登録ページ
購入した食材の「購入年月日」「食材名」「単価」「購入数」を登録します。
![食材登録](https://user-images.githubusercontent.com/119155601/221582273-c6a9547b-9672-47e7-888a-1b0e6f9c378f.gif)

▼ 工夫点
- 「在庫数量」は0以下が入力できない仕様となっております。

### 在庫食材一覧ページ
登録された食材の一覧が表示されます。
<img width="1440" alt="在庫食材一覧" src="https://user-images.githubusercontent.com/119155601/221577384-ca658d17-5448-4e99-8240-07a7cf016614.png">

▼ 工夫点
- 消費食材登録ページで登録された数量分だけ、「在庫数量」もマイナス更新される仕様となっております。
- 「在庫数量」が0になると表示されない仕様となっております。

### 在庫食材（更新）ページ
登録された食材情報を編集します。
<img width="1440" alt="在庫食材（更新）" src="https://user-images.githubusercontent.com/119155601/221577327-fc336e75-467a-4584-8822-1c6c35bbb168.png">

## 消費食材ページ
### 消費食材登録ページ
消費した食材の「消費年月日」「消費数」「メモ」を登録します。
![食材を使う](https://user-images.githubusercontent.com/119155601/221581532-fd536697-1e25-42d2-9332-30bb42b9f67d.gif)

▼ 工夫点
- 「食材名」はプルダウンにし、在庫食材テーブルから「ログインしているユーザに紐づいている」かつ「在庫が0ではない」食材を取得しております。
- 「食材名」のプルダウンを選択すると、自動で「食材単価」が自動入力される仕様となっております。数値の変更はできません。
- 「食材名」のプルダウンを選択すると、自動で「消費数量」が自動入力される仕様となっております。数値の変更はできます。
- 何の料理に使用した食材なのか記録するために「メモ」機能を実装しております。
- 「単価」と「消費数量」から食材ごとの食費を計算し保存しております。
- 「消費数量」は0以下が入力できない仕様となっております。
- 「消費数量」は小数でも入力できる仕様となっております。

### 食費カレンダーページ
登録された消費食材情報から日別の食費を表示します。
<img width="1440" alt="食費カレンダー" src="https://user-images.githubusercontent.com/119155601/221576303-9c473c64-a0be-4672-b7aa-8798ad34b8ff.png">

▼ 工夫点
- 消費食材を登録すると自動で計算し表示される仕様となっております。
- 小数点以下の食費も表示される仕様となっております。

### 消費食材履歴ページ
登録された消費食材の一覧を表示します。
<img width="1440" alt="消費食材履歴" src="https://user-images.githubusercontent.com/119155601/221576081-c1635221-0cd4-4c57-adaa-5087aab0e91e.png">

### 消費食材（更新）ページ
登録された消費食材情報を編集します。
<img width="1440" alt="消費食材（更新）" src="https://user-images.githubusercontent.com/119155601/221705558-7a042ccb-fdf5-42e7-8b29-5de5234d79a5.png">
