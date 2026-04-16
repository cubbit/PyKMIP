FROM python:3.9-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN pip install --no-cache-dir .

FROM python:3.9-slim

WORKDIR /app

# Copy installed packages only
COPY --from=builder /usr/local/bin/pykmip-server /usr/local/bin/pykmip-server
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

RUN useradd -M appuser 
USER appuser

EXPOSE 5696

ENTRYPOINT ["pykmip-server"]
CMD ["-f", "/etc/pykmip/server.conf", "-l", "/var/log/pykmip/server.log"]