# Stage 1: lấy ffmpeg từ Alpine 3.22
FROM alpine:3.22 AS ff
RUN apk add --no-cache ffmpeg

# Stage 2: image n8n của bạn
FROM n8nio/n8n:latest

USER root
COPY --from=ff /usr/bin/ffmpeg /usr/local/bin/ffmpeg
COPY --from=ff /usr/bin/ffprobe /usr/local/bin/ffprobe
COPY --from=ff /usr/lib/ /usr/lib/

USER node

