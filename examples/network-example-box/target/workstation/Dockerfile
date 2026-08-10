# The internal workstation is reachable only from the internal network.
# It stays container-backed so this box uses one host kind throughout.
FROM python:3.12-slim

RUN useradd --create-home --shell /usr/sbin/nologin analyst

WORKDIR /app
COPY app.py .

EXPOSE 8001
USER analyst
CMD ["python", "app.py"]
