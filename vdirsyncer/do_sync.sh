#!/bin/sh

export VDIRSYNCER_CONFIG=/var/lib/vdirsyncer/config
vdirsyncer discover && vdirsyncer sync
