FROM alpine:3.22 AS ff

RUN apk add --no-cache \
    ffmpeg \
    fontconfig \
    font-noto-cjk \
    font-noto-emoji \
 && fc-cache -fv

FROM n8nio/n8n:latest

USER root

COPY --from=ff /usr/bin/ffmpeg /usr/local/bin/ffmpeg
COPY --from=ff /usr/bin/ffprobe /usr/local/bin/ffprobe
COPY --from=ff /usr/lib/ /usr/lib/

COPY --from=ff /usr/share/fonts /usr/share/fonts
COPY --from=ff /etc/fonts /etc/fonts
COPY --from=ff /var/cache/fontconfig /var/cache/fontconfig

USER node