FROM python:3.9.18-slim

LABEL maintainer="gallon_shih"
LABEL Description="python base image"
USER root

# Environment setup for scripts
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends vim iputils-ping telnet cron krb5-user curl procps git libssl-dev g++ make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt