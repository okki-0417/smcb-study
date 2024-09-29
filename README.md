# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
3.3.4

* System dependencies

* Configuration

* Database creation
docker-compose exec app bundle exec rails ridgepole:apply で開発環境とテスト環境のデーターベースが更新される。

* Database initialization
docker-compose exec app bundle exec rails db:create でデータベースを作成

* How to run the test suite
RSpecを使用。docker-compose exec app bundle exec rspec <ファイル名>

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
