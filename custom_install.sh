#!/bin/sh
#====================================================================
#
#         USAGE:  ./install.sh
#
#   DESCRIPTION:  Install the product
#
#       OPTIONS:  ---
#        AUTHOR:  Denis Machard
#====================================================================

. /etc/rc.d/init.d/functions

# first check for root user
if [ ! $UID -eq 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

APP_NAME="ExtensiveTesting"
APP_PATH="$(pwd)"
LOG_FILE="$APP_PATH/install.log"
PKG_PATH="$APP_PATH/PKG/"
APP_SRC_PATH="$(pwd)/$APP_NAME/"
PRODUCT_VERSION="$(cat "$APP_SRC_PATH"/VERSION)"
PRODUCT_SVC_NAME="$(echo $APP_NAME | sed 's/.*/\L&/')"
PRODUCT_SVC_CTRL="xtctl"

# install the product without ask anything
$APP_PATH/custom.sh install