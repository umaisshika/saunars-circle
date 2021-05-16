# Samesy
![samesyトップ画](https://user-images.githubusercontent.com/63295568/106753621-3e721900-666f-11eb-9b4d-d6443b625769.jpg)

就活用のポートフォリオとして制作した自作アプリです。
サウナメシの写真と感想を投稿・共有するSNSです。

## URL
https://www.samesy.work

※トップページの右上にあるログインボタンをクリックしログイン画面に遷移した後、  
「ゲストユーザーでログイン」のボタンをクリックすると、フォームに文字を入力せずにログインできます。

## 機能一覧
- ユーザー機能(devise)
  - 新規登録、ログイン、ログアウト機能ほか<br>
- 投稿機能
  - 一覧表示、詳細表示、投稿、編集、削除
  - 画像アップロードはCarrierWave
  - 詳細表示内に地図、コメント機能(Ajax)
  - 施設名・都道府県から位置情報を取得
- ページネーション機能（Kaminari）<br>
- お気に入り機能(Ajax)
  - お気に入り登録した投稿の一覧表示<br>
- フォロー機能(Ajax)
  - フォロー、フォロワーの一覧表示<br>
- コメント機能(Ajax)
- 投稿検索機能（Ransackを使用）
  - キーワード検索フォーム設置
- RSpecによる自動テスト(モデル単体・システムテスト、ブラウザテスト　およそ200example)<br>
- CircleCIを用いたCI/CD機能<br>

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
  - AWS（VPC, ECS, ECR, RDS, S3, Route 53, ALB, ACM）
  - Docker/docker-compose(ローカル開発環境)
  - CircleCI(自動ビルド、自動テスト、自動デプロイ)
  - Capistrano(自動デプロイ)
  - RSpec(テストフレームワーク)
  - rubocop(静的コード解析ツール)
  - Git, GitHub
  - Google Maps Platform
## ER図
  ![samesy_ER図](https://user-images.githubusercontent.com/63295568/106827014-655e3880-66cb-11eb-9c96-3f2c2c9cad70.png)
## インフラ構成図
  ![saunars-circle-ark ](https://user-images.githubusercontent.com/63295568/118406686-d2646f80-b6b7-11eb-8b55-9cc74feddff6.jpg)
## 今後の改善
  - issueに記載
