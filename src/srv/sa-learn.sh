sa-learn --spam "${1}/*/*/*/.Spam/cur/*" | ts -s "[%H:%M:%.S] [SPAM]" | ts '[%Y-%m-%d %H:%M:%.S%z]' >> /var/log/sa-learn/spam.log

sa-learn --ham "${1}/*/*/*/cur/*" | ts -s "[%H:%M:%.S] [INBOX]" | ts '[%Y-%m-%d %H:%M:%.S%z]' >> /var/log/sa-learn/ham.log

for DIR_PATH in "${1}"/*/*/*/.*/
do
  DIR_NAME="$(basename "${DIR_PATH}")"
  if [ "${DIR_NAME}" != "." ] && [ "${DIR_NAME}" != ".." ] && [ "${DIR_NAME}" != ".Spam" ]; then
    sa-learn --ham "${DIR_PATH}*" | ts -s "[%H:%M:%.S] [FOLDER]" | ts "[%Y-%m-%d %H:%M:%.S%z]" >> /var/log/sa-learn/ham
    .log
  fi
done
