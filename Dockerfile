# My image NOW PRIVATE
FROM michaln28/faster-docker-build:v0.2

COPY hello.py .
CMD [ "hello.py" ]