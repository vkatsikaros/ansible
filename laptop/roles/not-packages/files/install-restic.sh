#!/usr/bin/env bash
set -ex

bzip2 -d /tmp/restic.bz2
mv /tmp/restic ~/.local/bin
chmod u+x ~/.local/bin/restic