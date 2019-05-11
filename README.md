# docker-alpine-review

[Re:VIEW](https://github.com/kmuto/review)を動かすためのDockerイメージです。

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

* TexLive 2018
* Re:VIEW 3.1.0
* Graphviz, gnuplot, aafigure, blockdiag(`//graph`用)
* Java 8(PlantUML用)

PlantUMLを使う場合、作業ディレクトリ(例だとmybookの下)に`plantuml.jar`を配置してください。

# 過去バージョン

現在存在しているタグは`2.5.0`, `3.0.0`, `3.1.0`, `latest`(3.1.0)です。
