FROM alpine AS dependencies
RUN apk add --no-cache imagemagick bash git optipng

FROM dependencies AS runtime
RUN apk upgrade --no-cache
COPY validate.sh /validate.sh
ENTRYPOINT ["/validate.sh"]
