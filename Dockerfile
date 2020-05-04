FROM debian:stable-slim

# Time
ENV TZ=Europe/Berlin

# Froxlor
ENV MAIL_DIR=/var/customers/mail

# SpamAssassin
ENV ALLOWED_IPS=127.0.0.1
ENV REPORT_SAFE=0
ENV REQUIRED_SCORE=2.0
ENV TRUSTED_NETWORKS=${ALLOWED_IPS}

# Bayes
ENV USE_BAYES=1
ENV BAYES_AUTO_LEARN=1

# Pyzor
ENV USE_PYZOR=1

# Learn Cron
ENV CRON_HAM_MINUTE=0
ENV CRON_HAM_HOUR=3
ENV CRON_SPAM_MINUTE=0
ENV CRON_SPAM_HOUR=4

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

# Install SpamAssassin and Pyzor
RUN apt-get install -y --no-install-recommends \
    spamassassin \
    pyzor

# Setup Pyzor
RUN pyzor discover

# Add SpamAssassin configuration
COPY ./etc/spamassassin/local.cf /etc/spamassassin/

# Add learn HAM/SPAM Cron
COPY etc/cron.d /etc/cron.d/

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]
