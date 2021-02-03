## Samesyとは
https://www.samesy.work/br>
サウナメシの写真と感想を投稿・共有できるWebサービスです。

![samesyトップ画](https://user-images.githubusercontent.com/63295568/106753621-3e721900-666f-11eb-9b4d-d6443b625769.jpg)
※トップページの右上にあるログインボタンをクリックしログイン画面に遷移した後、  
「ゲストユーザーでログイン」のボタンをクリックすると、フォームに文字を入力せずにログインできます。

## 機能一覧
- ユーザー機能
  - 新規登録、ログイン、ログアウト機能ほか<br>
- 投稿機能
  - 一覧表示、詳細表示、投稿、編集、削除
  - 画像アップロードはCarrierWave
  - 詳細表示内に地図、コメント機能(Ajax)
  - 施設名・都道府県から位置情報を取得
- お気に入り機能(Ajax)
  - お気に入り登録した投稿の一覧表示<br>
- フォロー機能(Ajax)
  - フォロー、フォロワーの一覧表示<br>
- 投稿検索機能
  - キーワード検索フォーム設置
- RSpecによる自動テスト(モデル単体・システムテスト、ブラウザテスト　合計196example)<br>
## 使用技術
- フロントエンド
  - HTML, SCSS, Bootstrap, jquery, javascript<br>
- バックエンド
  - Ruby 2.5.1
  - Rails 5.2.4<br>
- DB
  - MySQL 5.6.47<br>
- webサーバー・アプリケーションサーバー
  - Nginx
  - Unicorn<br>
- インフラ・開発環境等
  - AWS（VPC, EC2, RDS, S3, Route 53, ALB, ACM）
  - Docker/docker-compose(ローカル開発環境)
  - CircleCI(自動ビルド、自動テスト、自動デプロイ)
  - Capistrano(自動デプロイ)
  - RSpec(テストフレームワーク)
  - rubocop(静的コード解析ツール)
  - Git, GitHub
  - Google Maps Platform
## ER図
  ![インフラ構成図](https://user-images.githubusercontent.com/63295568/106405658-5765a900-647a-11eb-90ad-1751bcf6a47c.jpg)
## インフラ構成図
  ![インフラ構成図](https://user-images.githubusercontent.com/63295568/106405658-5765a900-647a-11eb-90ad-1751bcf6a47c.jpg)