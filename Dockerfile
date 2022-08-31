FROM debian:stable-slim

# ===================================================
# Configuration
# ===================================================

# SpamAssassin
ENV REPORT_SAFE 0
ENV REQUIRED_SCORE 5.0
ENV TRUSTED_NETWORKS ''
ENV SPF_WHITELIST ''

# Froxlor
ENV MAIL_DIR '/var/customers/mail'

# ===================================================
# Ports
# ===================================================

EXPOSE 783

# ===================================================
# Base packages
# ===================================================

# Update sources and preinstalled packages
RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends

RUN apt-get install -y --no-install-recommends \
    apt-listchanges \
    apt-transport-https \
    ca-certificates \
    cron \
	  gettext-base \
    syslog-ng \
    unattended-upgrades

# ===================================================
# SpamAssassin, Razor and Pyzor
# ===================================================

RUN apt-get install -y --no-install-recommends \
    spamassassin \
    razor \
    pyzor \
    libmail-spf-perl

RUN razor-admin -create && \
    razor-admin -register && \
    pyzor discover

# ===================================================
# Filesystem
# ===================================================

RUN mkdir /var/log/sa-learn

COPY ./src/ /

RUN chmod 0755 /srv/sa-learn.sh

# ===================================================
# Entrypoint
# ===================================================

ENTRYPOINT ["bash", "/start.sh"]
