FROM debian:stable-slim

# Froxlor
ENV MAIL_DIR=/var/customers/mail

# SpamAssassin
ENV REPORT_SAFE=0
ENV REQUIRED_SCORE=3.0
ENV TRUSTED_NETWORKS=127.0.0.1

EXPOSE 783

# Update sources and preinstalled packages
RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends

# Install dependencies
RUN apt-get install -y --no-install-recommends \
	apt-utils \
	gettext-base \
    logrotate

# Install SpamAssassin
RUN apt-get install -y --no-install-recommends \
    spamassassin

COPY ./etc/spamassassin/local.cf /etc/spamassassin/

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]
