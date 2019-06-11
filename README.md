# docker-alpine-review

[![Docker Automated build](https://img.shields.io/docker/automated/fabon/alpine-review.svg)](https://hub.docker.com/r/fabon/alpine-review/)

[Re:VIEW](https://github.com/kmuto/review)を動かすための軽量なDockerイメージです。

# インストール

```sh
docker pull fabon/alpine-review
```

# 使い方

```sh
docker run -t --rm -v "path_to_review_project:/book" fabon/alpine-review /bin/sh -c "cd /book && review-pdfmaker config.yml"
```

例えば、次のようなディレクトリ構成の場合を考えます。

```
├── README.md
└── mybook
    ├── Gemfile
    ├── catalog.yml
    ├── config.yml
    ├── images
    ├── layouts
    ├── sty
    └── mybook.re
```

PDFを出力するのに実行するコマンドは

```sh
docker run -t --rm -v "$(pwd)/mybook:/book" fabon/alpine-review /bin/sh -c "cd /book && review-pdfmaker config.yml"
```

となります。

# 仕様

## サポートしているバージョン

Re:VIEWのバージョンごとに別のタグでイメージをビルドしています。現在存在しているタグは`2.5.0`, `3.0.0`, `3.1.0`, `latest`(3.1.0)です。

## インストールされているもの

* Tex Live 2019
* Ruby
* Re:VIEW
* Graphviz, gnuplot, aafigure, blockdiag(`//graph`用)
* Java 8(PlantUML用)
* MeCab(Re:VIEWの索引作成用)

Re:VIEW 3.0以上でPlantUMLを使う場合、作業ディレクトリ(例だとmybookの下)に`plantuml.jar`を配置してください。

# カスタマイズ

最大限軽量化するため、最低限のTeXパッケージしか入っていません。デフォルトの状態のRe:VIEWプロジェクトはビルドできますが、パッケージが足りない場合は必要に応じて`tlmgr install`を実行してください。

CIでビルドに使用する場合は、ビルドのたびにコンテナ内で`tlmgr install`を実行するか、もしくはこのイメージをベースとして自前のイメージを作るなどの方法があります。
