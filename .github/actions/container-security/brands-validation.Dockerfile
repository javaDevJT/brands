FROM alpine AS dependencies

RUN apk add --no-cache imagemagick bash git optipng

FROM dependencies AS runtime

RUN apk upgrade --no-cache
COPY .github/workflows/validate/validate.sh /validate.sh
ENTRYPOINT ["/validate.sh"]

# Match the original GitHub Docker action's workspace mount and entrypoint while
# executing the validator through the configured remote BuildKit service.
FROM scanned AS validate

WORKDIR /github/workspace
RUN --mount=type=bind,target=/github/workspace,rw GITHUB_ACTIONS=true /validate.sh
