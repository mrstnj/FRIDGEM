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

そこで使用した食材の数量を入力するだけで食費を計算・記録するアプリを開発することで、
記録するのにかける時間を削減しようと考え作成した。

（運用してからは私だけでなく他者も利用しております）

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
![トップ](https://user-images.githubusercontent.com/119155601/221579433-e66c0329-4697-40bd-b723-df3537a6ba3d.gif)

## ユーザ登録
### ユーザ登録ページ
<img width="1440" alt="ユーザ登録" src="https://user-images.githubusercontent.com/119155601/221577216-d6cfc1da-c1c7-43e5-8e72-e1ecbd1dbb7b.png">

## ログイン
### ログインページ
<img width="1440" alt="ログイン" src="https://user-images.githubusercontent.com/119155601/221577250-1faa80e2-db24-4c32-ae50-11bc2a5d82af.png">

## ユーザメニュー
### ユーザメニューページ
<img width="1440" alt="ユーザメニュー" src="https://user-images.githubusercontent.com/119155601/221577105-1193badb-b61f-4d07-b3b5-2611f8d58c37.png">


## 在庫食材ページ
### 在庫食材登録ページ
![食材登録](https://user-images.githubusercontent.com/119155601/221582273-c6a9547b-9672-47e7-888a-1b0e6f9c378f.gif)

### 在庫食材一覧ページ
<img width="1440" alt="在庫食材一覧" src="https://user-images.githubusercontent.com/119155601/221577384-ca658d17-5448-4e99-8240-07a7cf016614.png">

### 在庫食材（更新）ページ
<img width="1440" alt="在庫食材（更新）" src="https://user-images.githubusercontent.com/119155601/221577327-fc336e75-467a-4584-8822-1c6c35bbb168.png">

## 消費食材ページ
### 消費食材登録ページ
![食材を使う](https://user-images.githubusercontent.com/119155601/221581532-fd536697-1e25-42d2-9332-30bb42b9f67d.gif)

### 食費カレンダーページ
<img width="1440" alt="食費カレンダー" src="https://user-images.githubusercontent.com/119155601/221576303-9c473c64-a0be-4672-b7aa-8798ad34b8ff.png">

### 消費食材履歴ページ
<img width="1440" alt="消費食材履歴" src="https://user-images.githubusercontent.com/119155601/221576081-c1635221-0cd4-4c57-adaa-5087aab0e91e.png">
