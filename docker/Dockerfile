FROM n8nio/n8n:1.107.2

ENV NODE_FUNCTION_ALLOW_EXTERNAL=fs

USER root

# Install ffmpeg
RUN apk add --no-cache ffmpeg

USER node