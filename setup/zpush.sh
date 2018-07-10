#!/bin/bash
#
# Z-Push: The Microsoft Exchange protocol server
# ----------------------------------------------
#
# Mostly for use on iOS which doesn't support IMAP IDLE.
#
# Although Ubuntu ships Z-Push (as d-push) it has a dependency on Apache
# so we won't install it that way.
#
# Thanks to http://frontender.ch/publikationen/push-mail-server-using-nginx-and-z-push.html.

source setup/functions.sh # load our functions
source /etc/mailinabox.conf # load global vars

# Prereqs.

echo "Installing Z-Push (Exchange/ActiveSync server)..."
apt_install \
	php7.0-soap php7.0-imap libawl-php php7.0-xsl

phpenmod -v php7.0 imap

# Copy Z-Push into place.

# Restart service.

restart_service php7.0-fpm

# Fix states after upgrade

hide_output z-push-admin -a fixstates
