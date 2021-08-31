# README

## アプリケーション名
NOW ON MAP

## サイトURL
http://ec2-35-73-217-236.ap-northeast-1.compute.amazonaws.com

## アプリケーション概要
NOW ON MAPは、地図上に未来のイベント情報を手軽に投稿することができるアプリです。投稿されたイベントは、地図上から日付やカテゴリーから手軽に絞り込み検索することができます。自宅周辺や旅行先のイベント探し、またイベントのPRにも使えるアプリです。

## 主な機能
- イベント投稿機能
- イベント検索機能
- マイロケーション機能（お気に入りの地点作成）
- マイページ機能
- 経路探索機能
- カレンダー登録機能
- 現在地表示機能
- お気に入り機能
- コメント機能
- 全画面表示切替機能
- ハッシュタグ作成機能
- 住所検索機能
- googleログイン機能

## 開発言語
- Ruby2.6.5
- Rails5.2.5

## カリキュラム内の技術
- devise
- Ajax
- aws EC2

## カリキュラム外の技術
- Leaflet.js
作成したイベントの位置座標を元にマップに配置、マーカーをクリックでテキストやリンク表示、ズームアウトした場合に複数のイベントをグループ化、クリックでポップアップを表示などマップ操作をするために使用

## 使用したgem
- gon
- ransack
- capistrano-rails
- rails_admin
- cancancan
- omniauth

## 実行手順
```
$ git clone git@github.com:akira-yp/now_on_map.git
$ cd now_on_map
$ bundle install
$ rails db:create && rails db:migrate
$ rails db:seed
$ rails s
```

## カタログ設計
https://docs.google.com/spreadsheets/d/1tKA-39uMiWCW5cX_xzeoDFyHms2Gmi9x-wKPaT3ufwo/edit?usp=sharing

## テーブル定義書
https://docs.google.com/spreadsheets/d/1tKA-39uMiWCW5cX_xzeoDFyHms2Gmi9x-wKPaT3ufwo/edit?usp=sharing

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1tKA-39uMiWCW5cX_xzeoDFyHms2Gmi9x-wKPaT3ufwo/edit?usp=sharing

## ER図
![ER図](https://github.com/akira-yp/images/blob/master/nowonmap_er.png)

## 画面遷移図
![画面遷移図](https://github.com/akira-yp/images/blob/master/nowonmap_std.png)
