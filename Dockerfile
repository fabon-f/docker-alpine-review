FROM frolvlad/alpine-glibc
LABEL maintainer="syobon.hinata.public@gmail.com"

ARG REVIEW_VERSION

ENV PATH /usr/local/texlive/2019/bin/x86_64-linux:$PATH
ENV mecab_url https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE
ENV ipadic_url https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM

RUN apk --no-cache add perl wget xz tar && \
    mkdir /tmp/install-tl && \
    wget -qO - ftp://tug.org/historic/systems/texlive/2019/install-tl-unx.tar.gz | tar -xz -C /tmp/install-tl --strip-components=1 && \
    { \
        echo "selected_scheme scheme-basic"; \
        echo "option_doc 0"; \
        echo "option_src 0"; \
    } > /tmp/install-tl/texlive.profile && \
    /tmp/install-tl/install-tl --profile=/tmp/install-tl/texlive.profile && \
    tlmgr install collection-basic collection-latex collection-latexrecommended collection-fontsrecommended \
        collection-langcjk ascmac uplatex pxjahyper japanese-otf-uptex pxrubrica ipaex ptex-fontmaps plautopatch platex-tools pxchfon \
        everypage bigfoot framed wrapfig type1cm && \
    kanji-config-updmap-sys ipaex && \
    rm -fr /tmp/install-tl && \
    apk --no-cache del xz tar

RUN apk --no-cache add ruby graphviz gnuplot python3 py3-reportlab ghostscript && \
    gem install review -v "$REVIEW_VERSION" --no-rdoc --no-ri && \
    gem install rake bundler --no-rdoc --no-ri && \
    pip3 install aafigure blockdiag && \
    echo "[blockdiag]" >> "$HOME/.blockdiagrc" && echo "fontpath = /usr/share/fonts/ttf-dejavu/DejaVuSerif.ttf" >> "$HOME/.blockdiagrc"

# skip Java installation in v2.x
RUN if [ "$(echo "$REVIEW_VERSION" | cut -c1-2)" != "2." ]; then apk --no-cache add openjdk8-jre; fi

# skip MeCab installation in v2.x
RUN if [ "$(echo "$REVIEW_VERSION" | cut -c1-2)" != "2." ]; then \
    apk add --no-cache --virtual .deps build-base curl file ruby-dev && mkdir /tmp/mecab && \
    curl -L ${mecab_url} | tar -xzf - -C /tmp/mecab --strip-components 1 && cd /tmp/mecab && \
    ./configure --enable-utf8-only --with-charset=utf8 && make && make install && cd && rm -rf /tmp/mecab && \
    gem install mecab --no-rdoc --no-ri && \
    mkdir /tmp/mecab-ipadic && curl -L ${ipadic_url} | tar -xzf - -C /tmp/mecab-ipadic --strip-components 1 && cd /tmp/mecab-ipadic && \
    ./configure --with-charset=utf8 && make && make install && cd && rm -rf /tmp/mecab-ipadic && \
    apk del --purge .deps; fi
