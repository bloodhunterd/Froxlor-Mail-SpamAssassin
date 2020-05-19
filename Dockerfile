FROM debian:stable-slim

# SpamAssassin
ENV REPORT_SAFE 0
ENV REQUIRED_SCORE 2.0
ENV TRUSTED_NETWORKS ''
ENV SPF_WHITELIST ''

# Froxlor
ENV MAIL_DIR '/var/customers/mail'

EXPOSE 783

# Update sources and preinstalled packages
RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends

# Install dependencies
RUN apt-get install -y --no-install-recommends \
    cron \
	gettext-base \
    logrotate \
    syslog-ng \
    unattended-upgrades

# Install SpamAssassin, Razor and Pyzor
RUN apt-get install -y --no-install-recommends \
    spamassassin \
    razor \
    pyzor \
    libmail-spf-perl

# Setup Razor and Pyzor
RUN razor-admin -create && \
    razor-admin -register && \
    pyzor discover

# Add SpamAssassin configuration
COPY ./etc/spamassassin /etc/spamassassin/

# Add Ham/Spam learning Cron
COPY etc/cron.d /etc/cron.d/

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]
