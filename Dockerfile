# My image
FROM michaln28/faster-docker-build:v0.1

COPY hello.py .
CMD [ "hello.py" ]