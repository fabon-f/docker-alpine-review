FROM paperist/alpine-texlive-ja
LABEL maintainer="syobon.hinata.public@gmail.com"

ARG REVIEW_VERSION

RUN apk --no-cache add ruby graphviz gnuplot python3 py3-reportlab && \
    gem install review -v "$REVIEW_VERSION" --no-rdoc --no-ri && \
    pip3 install aafigure blockdiag && \
    echo "[blockdiag]" >> "$HOME/.blockdiagrc" && echo "fontpath = /usr/share/fonts/ttf-dejavu/DejaVuSerif.ttf" >> "$HOME/.blockdiagrc"
