FROM alpine:latest

RUN apk add --no-cache curl unzip

# ดาวน์โหลด Xray ครั้งเดียวพอ
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip \
    && mv xray /usr/local/bin/xray \
    && chmod +x /usr/local/bin/xray \
    && rm -rf xray.zip

# copy config
COPY config.json /config.json

CMD ["xray", "-config", "/config.json"]
