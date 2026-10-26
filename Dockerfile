FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN curl -L -o /tmp/Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && unzip /tmp/Xray-linux-64.zip -d /tmp/xray && cp /tmp/xray/xray /app/xray && chmod +x /app/xray && rm -rf /tmp/Xray-linux-64.zip /tmp/xray
COPY start.sh ./start.sh
RUN chmod +x ./start.sh
CMD ["./start.sh"]
