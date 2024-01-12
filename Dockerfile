FROM python:3.12
# 利用する「ベースイメージ」を指定する。 ここでは Docker Hub 公式の Python 3.12 イメージを利用する。
# `python` が「イメージ名」で、コロンのあとの `3.12` が「タグ名」と呼ばれる。
# このイメージには Python 3.12 の実行環境が含まれている。
# 初めてのビルド時にこのイメージがダウンロードされる。
# `python` のイメージは以下の Docker Hub のページに存在するもので、
# `3.12` タグ以外にも利用可能なタグを確認することができる。
# https://hub.docker.com/_/python

ENV PYTHONUNBUFFERED=1
# 環境変数 PYTHONUNBUFFERED に 1 を設定する。
# この変数は標準出力のバッファリングに関わる Python の設定で、
# Docker で Python を利用する際のお作法的な変数。
# これを設定しないとコンテナ実行中にログが表示されず、終了と同時に一気に表示される。

WORKDIR /app
# 作業を行う為のディレクトリ。
# WORKDIR 何も設定しないとルート `/` にファイルがコピーされるので移動することを推奨する。

COPY main.py requirements.txt ./
# ローカル側にある main.py と requirements.txt をコンテナ側のディレクトリにコピーする。
# 相対パスを指定しているので WORKDIR 直下にコピーされる。

RUN pip install -r requirements.txt
# コンテナ内にて、`pip install` コマンドを実行して必要ライブラリをインストールしておく。

CMD [ "python" , "main.py" ]
# 実行コマンド。 `docker run` 時に実行される。