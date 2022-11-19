# sleeple

## 概要
sleepleは、良い睡眠の習慣を身につけるための行動チェックツールです。
朝すっきり起きて、良い1日を過ごしたいと思っている方が取り組むべき行動を実践できているかを記録し、可視化することができます。

## 特徴
毎日寝る前に、シンプルな質問に答えるだけです。
睡眠習慣を記録し、良い睡眠の習慣を作れているかを確認することができます。

## 開発の前提条件
* Ruby 3.1.2
* Ruby on Rails 6.1.6
* node 16.14.0
* yarn 1.22.18
* PostgreSQL 14.3
* bundler 2.2.22

## 開発環境のセットアップ
### Rubyのインストール

```
$ ruby -v
$ rbenv install --list
$ rbenv install 3.1.2
$ rbenv local 3.1.2
```

### bundlerのインストール
```
$ bundler -v
$ gem install bundler -v 2.2.22
```

### PostgeSQLのインストール
```
$ brew install postgresql@14.3
```

### Gemfileの内容を適用

```
$ bundle install
```

### 開発環境の立ち上げ

```
$ bin/rails s
```

### Questionデータの作成
* 手動でデータをいくつか作成する形をとっているため、 `bin/rails c` でRailsコンソールを立ち上げてから以下のような内容を実行する。

```ruby
> Question.create!(content: '適当な質問用の文章', is_active: true)
```
* 上記を1回実行すると1つの質問ができるため、5個程度文章を変えてデータを作成しておくと実際の動作に近づけられるのでそれを行うことを推奨

## 開発時のテストやLinterの動作
### rubocop

```
$ rubocop
```

### RSpec
```
$ bundle exec rspec
```