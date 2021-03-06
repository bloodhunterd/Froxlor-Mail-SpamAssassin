#!/bin/bash

# Get config files
r=()
r+=("$(find /etc/spamassassin/ -type f -name '*.cf')")
r+=("$(find /etc/cron.d/ -type f -name 'sa-learn')")

# Replace environment vars
for d in "${r[@]}"
do
	for f in $d
	do
		# Replace only if not mounted as read-only
		if [ -w "$f" ]
		then
			t="$f.tmp"
			mv $f $t
			envsubst < $t > $f
			rm $t
		fi
	done
done

service syslog-ng start

service cron start

# Start process and listen on all interfaces
spamd -i -A 0.0.0.0/0
