# My image NOW PRIVATE
FROM michaln28/faster-docker-build:v0.3

COPY hello.py .
CMD [ "hello.py" ]