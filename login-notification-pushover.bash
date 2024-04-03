#!/usr/bin/env bash

trap ctrl_c INT
function ctrl_c()
{
        printf "trapped Ctrl+C"
}

if [[ "$PAM_TYPE" = "close_session" ]]; then
        export PUSHOVER_TYPE="closed"
        PUSHOVER_APP_TOKEN="TOKEN1"
        PUSHOVER_PRIORITY="-1"
elif [[ "$PAM_TYPE" = "open_session" ]]; then
        export PUSHOVER_TYPE="opened"
        PUSHOVER_APP_TOKEN="TOKEN2"
        PUSHOVER_PRIORITY="0"
else
        exit 0
fi

if [[ -z "$PAM_RHOST" ]]; then
        PAM_RHOST="localhost"
fi

DATE=$(date)

### PUSHOVER SETTINGS ###
PUSHOVER_URL="https://api.pushover.net/1/messages.json"
PUSHOVER_USER_TOKEN="USERTOKEN"

PUSHOVER_TITLE="$HOSTNAME session notification"
PUSHOVER_MESSAGE="User <b>$PAM_USER</b> $PUSHOVER_TYPE a session from <b>$PAM_RHOST</b> through <b>$PAM_SERVICE</b> at <i>$DATE</i>."
PUSHOVER_HTML="1"
PUSHOVER_SOUND="intermission"

if [[ "$PAM_USER" == "root" ]]; then
        PUSHOVER_PRIORITY="1"
        PUSHOVER_SOUND="siren"
        #PUSHOVER_USER_TOKEN="ONLYROOTTOKEN"
fi

#if [[ "$PAM_USER" == "john" ]]; then
        #PUSHOVER_USER_TOKEN="ONLYUSERTOKEN"
#fi

### ENDOF PUSHOVER SETTINGS ###

curl -s --data token=$PUSHOVER_APP_TOKEN --data user=$PUSHOVER_USER_TOKEN --data-urlencode title="$PUSHOVER_TITLE" --data priority=$PUSHOVER_PRIORITY --data-urlencode message="$PUSHOVER_MESSAGE" --data html=$PUSHOVER_HTML --data sound=$PUSHOVER_SOUND $PUSHOVER_URL > /dev/null 2>&1 &
