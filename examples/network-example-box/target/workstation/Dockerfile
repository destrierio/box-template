# The internal workstation: reachable only from `internal`, which the entry
# network cannot route to. Its flag is the pivot's proof.
#
# ⚠️ A CONTAINER, not a vm, and that is a platform constraint rather than a
# preference: a run goes to ONE backend, so every host in a box must be the same
# kind. This box's gateway is a container, so this is too. A mixed box is
# refused at compile with "this box mixes substrates".
FROM python:3.12-slim

RUN useradd --create-home --shell /usr/sbin/nologin analyst

WORKDIR /app
COPY app.py .

EXPOSE 8001
USER analyst
CMD ["python", "app.py"]
