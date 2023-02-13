# syntax=docker/dockerfile:1.5.1

# First image: compile image
FROM python:3.9-alpine AS compile-image
# Enable Docker BuildKit for better caching and faster builds
ENV DOCKER_BUILDKIT=1
ENV PYTHONUNBUFFERED=1

# This mount type allows the build container to cache directories for compilers and package managers.
# Create a symlink for the APK cache
RUN --mount=type=cache,target=/var/cache/apk ln -vs /var/cache/apk /etc/apk/cache && \
	apk add --update

# Minimize the number of RUN commands
# Install the required packages
# Download the Microsoft ODBC Driver
# Install the Microsoft ODBC Driver
# Ensure pip is installed

RUN apk add --update --no-cache \
    curl \
    unixodbc-dev \
    build-base \
    gcc \
    chromium-chromedriver \
    chromium && \
    curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.10.2.1-1_amd64.apk && \
    apk add --allow-untrusted msodbcsql17_17.10.2.1-1_amd64.apk && \
    python3 -m ensurepip

COPY requirements.txt .
# Upgrade pip and install the requirements
RUN pip3 install wheel setuptools pip  --upgrade pip -r requirements.txt --use-pep517

# Remove unneeded packages
RUN apk del --no-cache curl build-base gcc

# This is the second and final image; it copies the compiled binary
# over but starts from the base python:3.9-alpine image.
#FROM python:3.9-alpine AS runtime-image
#COPY --from=compile-image . .
#COPY hello.py .
#CMD [ "hello.py" ]