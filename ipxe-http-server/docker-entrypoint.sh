#!/bin/sh -e

# Create logpipe to redirect all logs from lighttpd to stdout
# NOTE: We need to check for its existance for when the container
#   is restarted.
if [ ! -e /tmp/logpipe ]; then
  mkfifo -m 600 /tmp/logpipe
fi

cat <> /tmp/logpipe 1>&2 &

exec lighttpd -D -f /lighttpd.conf 2>&1

