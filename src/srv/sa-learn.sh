# Spam folder
sa-learn --spam "${1}/*/*/*/.Spam/cur/*" >> /var/log/sa-learn/spam.log

# Inbox folder
sa-learn --ham "${1}/*/*/*/cur/*" >> /var/log/sa-learn/ham.log

# Folders in inbox
sa-learn --ham "${1}/*/*/*/.INBOX.*/cur/*" >> /var/log/sa-learn/ham.log

# Other folders
for folder in "${1}/*/*/*/.*"/*
do
  if [ "${folder}" != ".Spam" ]
  then
    sa-learn --ham "${1}/*/*/*/${folder}/cur/*" >> /var/log/sa-learn/ham.log
  fi
done
