FROM paperist/alpine-texlive-ja
LABEL maintainer="syobon.hinata.public@gmail.com"

RUN apk --no-cache add ruby graphviz gnuplot python3 py3-reportlab && \
    gem install review -v "$REVIEW_VERSION" --no-rdoc --no-ri && \
    pip3 install aafigure
