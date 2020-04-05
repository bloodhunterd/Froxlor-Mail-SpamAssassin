#!/bin/bash

# Learn HAM (good mails)
sa-learn --dbpath /var/lib/spamassassin/.spamassassin --ham ${MAIL_DIR}/*/*/*/cur/*

# Learn SPAM (bad mails)
sa-learn --dbpath /var/lib/spamassassin/.spamassassin --spam ${MAIL_DIR}/*/*/*/.Spam/cur/*
