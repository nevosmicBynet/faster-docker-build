# My image NOW PRIVATE
FROM michaln28/faster-docker-build:v0.1

COPY hello.py .
CMD [ "hello.py" ]