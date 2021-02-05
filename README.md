[![Release](https://img.shields.io/github/v/release/bloodhunterd/froxlor-mail-spamassassin?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-mail-spamassassin/releases)
[![Docker Build](https://img.shields.io/github/workflow/status/bloodhunterd/froxlor-mail-spamassassin/Docker?style=for-the-badge&label=Docker%20Build)](https://github.com/bloodhunterd/froxlor-mail-spamassassin/actions?query=workflow%3ADocker)
[![Docker Pulls](https://img.shields.io/docker/pulls/bloodhunterd/froxlor-mail-spamassassin?style=for-the-badge)](https://hub.docker.com/r/bloodhunterd/froxlor-mail-spamassassin)
[![License](https://img.shields.io/github/license/bloodhunterd/froxlor-mail-spamassassin?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-mail-spamassassin/blob/master/LICENSE)

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/bloodhunterd)

# Froxlor Mail SpamAssassin

Docker image of SpamAssassin for Froxlor Server Management Panel.

This image is meant to be used with the [Froxlor Mail](https://github.com/bloodhunterd/froxlor-mail) image.

## Deployment

### Docker Compose

```dockerfile
version: '2.4'

services:
  spamassassin:
    image: bloodhunterd/froxlor-mail-spamassassin
    ports:
      - '783:783'
    volumes:
      - ./mail/:/var/customers/mail/:ro
      - ./spamassassin/:/var/lib/spamassassin/.spamassassin/
```

### Configuration

| ENV | Values | Default | Description
| --- | ------ | ------- | -----------
| REPORT_SAFE | 0 / 2 | 0 | Add Spam report as attachment instead of modifying the original message.
| REQUIRED_SCORE | 0.0 - ... | 5.0 | Threshold at which a message is considered spam.
| TRUSTED_NETWORKS | *IP address* | 127.0.0.1 | Exclude networks from Spam check.
| SPF_WHITELIST | *Email address* |  | Exclude email addresses from SPF check.
| MAIL_DIR | *Directory path* | /var/customers/mail | Absolute path to the mail directory

### Ports

| Port | Description
| ---: | -----------
| 783  | SpamAssassin

### Volumes

| Volume | Path | Read only | Description
| ------ | ---- | :-------: | -----------
| Customer mail | /var/customers/mail/ | &#10004; | Froxlor customer mail content.
| Learned messages | /var/lib/spamassassin/.spamassassin/ | &#10008; | Learned HAM and SPAM messages.

| &#10004; Yes | &#10008; No
| ------------ | -----------

## Update

Please note the [changelog](https://github.com/bloodhunterd/froxlor-mail-spamassassin/blob/master/CHANGELOG.md) to check for configuration changes before updating.

```bash
docker-compose pull
docker-compose up -d
```

## Build With

* [SpamAssassin](https://spamassassin.apache.org/)
* [Pyzor](https://github.com/SpamExperts/pyzor)
* [Debian](https://www.debian.org/)
* [Docker](https://www.docker.com/)

## Authors

* [BloodhunterD](https://github.com/bloodhunterd)

## License

This project is licensed under the MIT - see [LICENSE.md](https://github.com/bloodhunterd/froxlor-mail-spamassassin/blob/master/LICENSE) file for details.
