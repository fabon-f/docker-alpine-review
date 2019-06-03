FROM paperist/alpine-texlive-ja
LABEL maintainer="syobon.hinata.public@gmail.com"

ARG REVIEW_VERSION

ENV mecab_url https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE
ENV ipadic_url https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM

RUN apk --no-cache add ruby graphviz gnuplot python3 py3-reportlab openjdk8-jre ghostscript && \
    gem install review -v "$REVIEW_VERSION" --no-rdoc --no-ri && \
    pip3 install aafigure blockdiag && \
    echo "[blockdiag]" >> "$HOME/.blockdiagrc" && echo "fontpath = /usr/share/fonts/ttf-dejavu/DejaVuSerif.ttf" >> "$HOME/.blockdiagrc"

RUN if [ "$(echo "$REVIEW_VERSION" | cut -c1-2)" != "2." ]; then \
    : "skip MeCab installation if the version is 2.x" && \
    apk add --no-cache --virtual .deps build-base curl file ruby-dev && mkdir /tmp/mecab && \
    curl -L ${mecab_url} | tar -xzf - -C /tmp/mecab --strip-components 1 && cd /tmp/mecab && \
    ./configure --enable-utf8-only --with-charset=utf8 && make && make install && cd && rm -rf /tmp/mecab && \
    gem install mecab --no-rdoc --no-ri && \
    mkdir /tmp/mecab-ipadic && curl -L ${ipadic_url} | tar -xzf - -C /tmp/mecab-ipadic --strip-components 1 && cd /tmp/mecab-ipadic && \
    ./configure --with-charset=utf8 && make && make install && cd && rm -rf /tmp/mecab-ipadic && \
    apk del --purge .deps; fi
