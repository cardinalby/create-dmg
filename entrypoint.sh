#!/bin/bash

VOLUME_NAME=$1
SRC_DIR=$2
OUTPUT_FILE=$3

# Create symlink to /Applications if APPLICATIONS_SYMLINK is set
if [ -n "$APPLICATIONS_SYMLINK" ]; then
  TMP_SRC_DIR="/tmp/src_copy"
  # copy source dir to temp dir in order to create a copy with current user permissions
  cp -r "$SRC_DIR" "$TMP_SRC_DIR"
  ln -s /Applications "$TMP_SRC_DIR/Applications" || exit 1
  SRC_DIR="$TMP_SRC_DIR"
fi

TMP_DMG="/tmp/tmp.dmg"
genisoimage -quiet -V "$VOLUME_NAME" -D -R -apple -no-pad -o "$TMP_DMG" "$SRC_DIR"
dmg dmg "$TMP_DMG" "$OUTPUT_FILE"