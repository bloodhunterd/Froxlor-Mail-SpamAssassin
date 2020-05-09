FROM debian:stable-slim

# Froxlor
ENV MAIL_DIR '/var/customers/mail'

# SpamAssassin
ENV REPORT_SAFE 0
ENV REQUIRED_SCORE 2.0
ENV TRUSTED_NETWORKS ''

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
    razor \
    pyzor

RUN razor-admin -create && \
    razor-admin -register

# Setup Pyzor
RUN pyzor discover

# Add SpamAssassin configuration
COPY ./etc/spamassassin /etc/spamassassin/

# Add learn HAM/SPAM Cron
COPY etc/cron.d /etc/cron.d/

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]
