FROM python:3-slim

LABEL org.opencontainers.image.title="YCast"
LABEL org.opencontainers.image.description="Self hosted vTuner internet radio service emulation"
LABEL org.opencontainers.image.url="https://github.com/milaq/YCast"
LABEL org.opencontainers.image.source="https://github.com/milaq/YCast"
LABEL org.opencontainers.image.licenses="GPL-3.0"

EXPOSE 80

VOLUME /root/.ycast

WORKDIR /app
COPY ycast/ ./ycast/

RUN pip install --no-cache-dir requests flask PyYAML Pillow requests-cache APScheduler

ENTRYPOINT ["python", "-m", "ycast"]
CMD ["-l", "0.0.0.0", "-p", "80"]
