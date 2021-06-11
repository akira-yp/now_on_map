# README
---
## 開発言語
---
- Ruby2.6.5
- Rails5.2.5

## 就職Termの技術
---
- devise
- Ajax

## カリキュラム外の技術
---
- Leaflet.js
作成したイベントの位置座標を元にマップに配置、マーカーをクリックでテキストやリンク表示、ズームアウトした場合に複数のイベントをまとめる、などマップ操作をするために使用

## 実行手順
---
```
$ git clone git@github.com:akira-yp/now_on_map.git
$ cd now_on_map
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

## カタログ設計
---
https://docs.google.com/spreadsheets/d/1tKA-39uMiWCW5cX_xzeoDFyHms2Gmi9x-wKPaT3ufwo/edit#gid=782464957

## テーブル定義書
---
https://docs.google.com/spreadsheets/d/1tKA-39uMiWCW5cX_xzeoDFyHms2Gmi9x-wKPaT3ufwo/edit#gid=2020033787

## ワイヤーフレーム
---
https://docs.google.com/spreadsheets/d/1tKA-39uMiWCW5cX_xzeoDFyHms2Gmi9x-wKPaT3ufwo/edit#gid=1740487753

## ER図
---
![ER図](https://github.com/akira-yp/images/blob/master/nowonmap_er.png)

## 画面遷移図
---
![画面遷移図](https://github.com/akira-yp/images/blob/master/nowonmap_std.png)
