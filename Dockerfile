FROM paperist/alpine-texlive-ja
LABEL maintainer="syobon.hinata.public@gmail.com"

RUN apk --no-cache add ruby ttf-freefont graphviz gnuplot && \
    gem install review -v "$REVIEW_VERSION" --no-rdoc --no-ri
