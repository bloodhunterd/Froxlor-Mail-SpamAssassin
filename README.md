[![Release](https://img.shields.io/github/v/release/bloodhunterd/froxlor-mail-spamassassin-docker?include_prereleases&style=for-the-badge)](https://github.com/bloodhunterd/froxlor-mail-spamassassin-docker/releases)
[![Docker Build](https://img.shields.io/docker/cloud/build/bloodhunterd/froxlor-mail-spamassassin?style=for-the-badge)](https://hub.docker.com/r/bloodhunterd/froxlor-mail-spamassassin)
[![License](https://img.shields.io/github/license/bloodhunterd/froxlor-mail-spamassassin-docker?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-mail-spamassassin-docker/blob/master/LICENSE)

# SpamAssassin for Froxlor Mail

Docker Image of SpamAssassin for Froxlor Mail Server.

## Configuration

See example [Docker Compose file](https://github.com/bloodhunterd/froxlor-mail-spamassassin-docker/blob/master/docker-compose.yml).

### Environment

| ENV | Values¹ | Default | Description
|--- |--- |--- | ---
| TZ | [PHP: List of supported timezones - Manual](https://www.php.net/manual/en/timezones.php) | Europe/Berlin | Timezone.
| MAIL_DIR | *Directory path* | /var/customers/mail | Absolute path to the mail directory
| ALLOWED_IPS | *IPv4* | 127.0.0.1 | IP's who are allowed to connect to SpamAssassin.
| REPORT_SAFE | 0 / 2 | 0 | Add Spam report as attachment instead of modifying the original message.
| REQUIRED_SCORE | 0.0 - ... | 2.0 | Threshold at which a message is considered spam.
| TRUSTED_NETWORKS | *IP* | 127.0.0.1 | Exclude networks from Spam check.
| USE_BAYES | *0 / 1* | 1 | Enable or disabled using Bayes.
| BAYES_AUTO_LEARN | *0 / 1* | 1 | Enable or disabled Bayes auto learning.
| USE_PYZOR | *0 / 1* | 1 | Enable or disabled using [Pyzor](https://github.com/SpamExperts/pyzor).
| CRON_HAM_MINUTE | *0 - 60* | 0 | Execute learn HAM Cron at this minute.
| CRON_HAM_HOUR | *0 - 23* | 3 | Execute learn HAM Cron at this hour.
| CRON_SPAM_MINUTE | *0 - 60* | 0 | Execute learn SPAM Cron at this minute.
| CRON_SPAM_HOUR | *0 - 23* | 4 | Execute learn SPAM Cron at this hour.

¹ *Possible values are separated by a slash or a range is indicated by a dash.*

### Volumes

```bash
volumes:
  - ./mail/:/var/customers/mail/
```

## Update

Please note the [changelog](https://github.com/bloodhunterd/froxlor-mail-spamassassin-docker/blob/master/CHANGELOG.md) to check for configuration changes before updating.

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

This project is licensed under the Unlicense - see [LICENSE.md](https://github.com/bloodhunterd/froxlor-mail-spamassassin-docker/blob/master/LICENSE) file for details.
