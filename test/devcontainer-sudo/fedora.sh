#!/bin/sh

dnf update -y && dnf install -y util-linux

. ./common.sh