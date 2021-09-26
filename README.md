# README

## アプリケーション名
NOW ON MAP

## サイトURL
https://nowonmap.com/

## アプリケーション概要
NOW ON MAPは、地図上に未来のイベント情報を手軽に投稿することができるアプリです。
現在どんなイベントが自分の近くで開催されているのかを、地図上から手軽に探せればという思いから開発しました。
投稿されたイベントは、誰でも閲覧することができ、地図上から日付やカテゴリーから手軽に絞り込み検索することができます。
自宅周辺や旅行先のイベント探し、またイベントのPRにも使えるアプリです。
## 環境
- Ruby 2.6.5
- Rails 5.2.5
- PostgreSQL 13.1 
- AWS EC2 S3 Route53 ALB ACM
## インフラ構成図
![ER図](https://github.com/akira-yp/images/blob/master/infrastructure.png)
## 使用した技術
- Devise
- OAuth認証
- Ajax
- Leaflet.js
- aws
## 使用したgem
- gon
- ransack
- capistrano-rails
- rails_admin
- cancancan
- omniauth
## 主な機能
- 地図へのイベント投稿機能
- 地図上イベント検索機能
- マイロケーション機能（お気に入りの地点登録）
- マイページ機能
- 経路探索機能
- Googleカレンダー登録機能
- 現在地表示機能
- お気に入り機能
- コメント機能
- 全画面表示切替機能
- ハッシュタグ作成機能
- 住所検索機能
- googleログイン機能
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
